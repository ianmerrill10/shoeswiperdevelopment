/* eslint-disable no-console */
import { REAL_SNEAKER_DATA, generateSQLInserts } from './realSneakerSeedData.ts';
import fs from 'fs';
import path from 'path';

// Fix for strict mode allowing console usage
const consoleLog = console.log;

async function main() {
    consoleLog('Generating SQL seed data...');
    const sqlContent = `
-- ============================================
-- SHOESWIPER SEED DATA MIGRATION
-- Phase 2: Content Population
-- Generated: ${new Date().toISOString()}
-- ============================================

-- clear existing data to prevent duplicates (optional, comment out if unwanted)
-- TRUNCATE TABLE public.shoes CASCADE;

${generateSQLInserts()}

-- ============================================
-- VERIFICATION
-- ============================================
-- SELECT count(*) FROM shoes;
    `.trim();

    const outputPath = path.resolve('003_seed_data.sql');
    fs.writeFileSync(outputPath, sqlContent);
    consoleLog(`Successfully wrote ${REAL_SNEAKER_DATA.length} records to ${outputPath}`);
}

main().catch(console.error);
