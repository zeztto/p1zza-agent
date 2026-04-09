# CHANGELOG

This file is AI-agent-friendly by default.

- FORMAT: deterministic
- ORDER: newest first
- VERSIONING: semantic versioning
- CHANGE TYPE: product-level summary, not commit dump
- LINEAGE: `p1zza-agent` is maintained as an `Everything Claude Code (ECC)` fork adapted for Claude + Codex

## 0.2.0

DATE: `2026-04-09`
STATUS: released-in-repo

SUMMARY:

- Codex installer and runtime path semantics were corrected to the working canonical path.
- Session bootstrap, role selection, delegation planning, and packet-first communication rules were strengthened for Codex.
- CEO-facing human message handling was added as an explicit exception to packet-only output when requested.
- Installer branding was refreshed with version, repo, creator, and homepage metadata.
- Root documentation was rewritten into a more AI-agent-friendly structure.

CHANGES:

- Codex canonical skill path standardized to `~/.codex/skills/p1zza-*`
- legacy hidden Codex skill path treated as non-default
- `session-bootstrap-v1` workflow added to Codex-side operating guidance
- stakeholder-facing human message exception added, with CEO language rule
- installer banner updated for readability
- installer metadata now prints version, repo, creator, and homepage
- product version bumped from `0.1.0` to `0.2.0`

IMPACT:

- Codex installation behavior is easier to verify
- session startup behavior is more deterministic
- project docs are easier for AI agents to parse and maintain

## 0.1.0

DATE: `2026-04-09`
STATUS: initial-product-structure

SUMMARY:

- initial dual-package product structure for Claude and Codex
- ECC fork lineage established as the base product direction
- unified installer added
- shared rules, agents, and packet semantics organized under one repo
