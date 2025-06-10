// start-docs.js
const { execSync } = require('child_process');

try {
  console.log('📦 Installing Retype...');
  execSync('npx retype@latest init', { stdio: 'inherit' });

  console.log('🚀 Starting Retype dev server...');
  execSync('npx retype dev', { stdio: 'inherit' });
} catch (error) {
  console.error('❌ Error running Retype:', error.message);
}
