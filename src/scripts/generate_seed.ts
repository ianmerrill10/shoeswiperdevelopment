/* eslint-disable no-console */
/**
 * Generate SQL seed data from TypeScript source
 * Uses ESM-compatible path handling
 */
import { generateSQLInserts, SEED_DATA_STATS } from '../lib/realSneakerSeedData';
import { writeFileSync } from 'fs';
import { fileURLToPath } from 'url';
import { dirname, resolve } from 'path';

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);

try {
    console.log('Generating SQL seed data...');
    console.log('Stats:', SEED_DATA_STATS);

    const sql = generateSQLInserts();
    const outputPath = resolve(__dirname, '../../seed_data.sql');
    writeFileSync(outputPath, sql);

    console.log(`✅ Generated SQL seed data at ${outputPath}`);
    console.log(`   Total shoes: ${SEED_DATA_STATS.totalShoes}`);
} catch (error) {
    console.error('❌ Error generating seed data:', error);
    process.exit(1);
}
