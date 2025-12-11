import React, { useState } from 'react';
import { FaTimes, FaCamera, FaSpinner } from 'react-icons/fa';
import { Profile } from '../lib/types';
import { supabase } from '../lib/supabaseClient';

interface EditProfileModalProps {
    isOpen: boolean;
    onClose: () => void;
    profile: Profile;
    onUpdate: () => void;
}

const STYLE_TAGS_OPTIONS = [
    'streetwear', 'vintage', 'luxury', 'basketball', 'running',
    'skate', 'casual', 'techwear', 'hypebeast', 'minimalist'
];

const EditProfileModal: React.FC<EditProfileModalProps> = ({ isOpen, onClose, profile, onUpdate }) => {
    const [formData, setFormData] = useState({
        username: profile.username || '',
        bio: profile.bio || '',
        avatar_url: profile.avatar_url || '',
        style_tags: profile.style_tags || [],
    });
    const [loading, setLoading] = useState(false);
    const [error, setError] = useState<string | null>(null);

    if (!isOpen) return null;

    const handleSubmit = async (e: React.FormEvent) => {
        e.preventDefault();
        setLoading(true);
        setError(null);

        try {
            const { error: updateError } = await supabase
                .from('profiles')
                .update({
                    username: formData.username,
                    bio: formData.bio,
                    avatar_url: formData.avatar_url,
                    style_tags: formData.style_tags,
                    updated_at: new Date().toISOString(),
                })
                .eq('id', profile.id);

            if (updateError) throw updateError;

            onUpdate();
            onClose();
        } catch (err) {
            if (import.meta.env.DEV) console.error('Error updating profile:', err);
            setError(err instanceof Error ? err.message : 'Failed to update profile');
        } finally {
            setLoading(false);
        }
    };

    const toggleStyleTag = (tag: string) => {
        setFormData(prev => {
            const tags = prev.style_tags || [];
            if (tags.includes(tag)) {
                return { ...prev, style_tags: tags.filter(t => t !== tag) };
            } else {
                if (tags.length >= 5) return prev; // Limit to 5 tags
                return { ...prev, style_tags: [...tags, tag] };
            }
        });
    };

    return (
        <div className="fixed inset-0 bg-black/80 backdrop-blur-sm z-50 flex items-center justify-center p-4">
            <div className="bg-zinc-900 border border-zinc-800 rounded-2xl w-full max-w-md max-h-[90vh] overflow-y-auto">
                <div className="p-6 border-b border-zinc-800 flex justify-between items-center sticky top-0 bg-zinc-900 z-10">
                    <h2 className="text-xl font-bold text-white">Edit Profile</h2>
                    <button onClick={onClose} className="text-zinc-400 hover:text-white">
                        <FaTimes />
                    </button>
                </div>

                <form onSubmit={handleSubmit} className="p-6 space-y-6">
                    {error && (
                        <div className="bg-red-500/10 border border-red-500/30 text-red-400 p-3 rounded-xl text-sm">
                            {error}
                        </div>
                    )}

                    {/* Avatar Input */}
                    <div className="flex flex-col items-center gap-4">
                        <div className="relative w-24 h-24 rounded-full bg-zinc-800 border-2 border-orange-500 overflow-hidden group">
                            {formData.avatar_url ? (
                                <img src={formData.avatar_url} alt="" className="w-full h-full object-cover" />
                            ) : (
                                <div className="w-full h-full flex items-center justify-center text-orange-500 text-3xl font-bold">
                                    {formData.username?.[0]?.toUpperCase()}
                                </div>
                            )}
                            <div className="absolute inset-0 bg-black/50 opacity-0 group-hover:opacity-100 transition-opacity flex items-center justify-center">
                                <FaCamera className="text-white text-xl" />
                            </div>
                        </div>
                        <div className="w-full">
                            <label className="block text-xs font-medium text-zinc-400 mb-1">Avatar URL</label>
                            <input
                                type="url"
                                value={formData.avatar_url}
                                onChange={(e) => setFormData({ ...formData, avatar_url: e.target.value })}
                                placeholder="https://example.com/image.jpg"
                                className="w-full bg-zinc-800 border-zinc-700 rounded-lg px-4 py-2 text-white focus:ring-orange-500 focus:border-orange-500"
                            />
                        </div>
                    </div>

                    {/* Username */}
                    <div>
                        <label className="block text-sm font-medium text-zinc-400 mb-1">Display Name</label>
                        <input
                            type="text"
                            value={formData.username}
                            onChange={(e) => setFormData({ ...formData, username: e.target.value })}
                            className="w-full bg-zinc-800 border-zinc-700 rounded-lg px-4 py-2 text-white focus:ring-orange-500 focus:border-orange-500"
                            required
                        />
                    </div>

                    {/* Bio */}
                    <div>
                        <label className="block text-sm font-medium text-zinc-400 mb-1">Bio</label>
                        <textarea
                            value={formData.bio}
                            onChange={(e) => setFormData({ ...formData, bio: e.target.value })}
                            rows={3}
                            className="w-full bg-zinc-800 border-zinc-700 rounded-lg px-4 py-2 text-white focus:ring-orange-500 focus:border-orange-500"
                        />
                    </div>

                    {/* Style Tags */}
                    <div>
                        <label className="block text-sm font-medium text-zinc-400 mb-2">
                            Style Tags <span className="text-xs text-zinc-500">(Max 5)</span>
                        </label>
                        <div className="flex flex-wrap gap-2">
                            {STYLE_TAGS_OPTIONS.map(tag => {
                                const isSelected = formData.style_tags.includes(tag);
                                return (
                                    <button
                                        key={tag}
                                        type="button"
                                        onClick={() => toggleStyleTag(tag)}
                                        className={`px-3 py-1 rounded-full text-xs font-medium transition-colors ${isSelected
                                                ? 'bg-orange-500 text-white'
                                                : 'bg-zinc-800 text-zinc-400 hover:bg-zinc-700'
                                            }`}
                                    >
                                        {tag}
                                    </button>
                                );
                            })}
                        </div>
                    </div>

                    <button
                        type="submit"
                        disabled={loading}
                        className="w-full py-3 bg-gradient-to-r from-orange-500 to-red-500 rounded-xl text-white font-bold flex items-center justify-center gap-2 hover:opacity-90 transition-opacity disabled:opacity-50"
                    >
                        {loading ? <FaSpinner className="animate-spin" /> : 'Save Changes'}
                    </button>
                </form>
            </div>
        </div>
    );
};

export default EditProfileModal;
