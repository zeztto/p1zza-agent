#!/usr/bin/env node
'use strict';

/**
 * session-start-bootstrap.js — p1zza-agent SessionStart hook.
 * Resolves ~/.claude/ as root and delegates to run-with-flags.js.
 */

const fs = require('fs');
const path = require('path');
const { spawnSync } = require('child_process');
const os = require('os');

const raw = fs.readFileSync(0, 'utf8');
const root = path.join(os.homedir(), '.claude');
const script = path.join(root, 'scripts', 'hooks', 'run-with-flags.js');

if (fs.existsSync(script)) {
  const result = spawnSync(
    process.execPath,
    [script, 'session:start', 'scripts/hooks/session-start.js', 'minimal,standard,strict'],
    { input: raw, encoding: 'utf8', env: process.env, cwd: process.cwd(), timeout: 30000 }
  );

  const stdout = typeof result.stdout === 'string' ? result.stdout : '';
  if (stdout) process.stdout.write(stdout);
  else process.stdout.write(raw);
  if (result.stderr) process.stderr.write(result.stderr);

  if (result.error || result.status === null || result.signal) {
    process.stderr.write('[SessionStart] hook failed\n');
    process.exit(1);
  }
  process.exit(Number.isInteger(result.status) ? result.status : 0);
}

process.stdout.write(raw);
