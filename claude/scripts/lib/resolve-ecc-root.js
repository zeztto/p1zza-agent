'use strict';

const path = require('path');
const os = require('os');

function resolveEccRoot() {
  const envRoot = process.env.CLAUDE_PLUGIN_ROOT || '';
  if (envRoot.trim()) return envRoot.trim();
  return path.join(os.homedir(), '.claude');
}

module.exports = { resolveEccRoot };
