# CHANGELOG

This file is AI-agent-friendly by default.

- FORMAT: deterministic
- ORDER: newest first
- VERSIONING: semantic versioning
- CHANGE TYPE: product-level summary, not commit dump
- LINEAGE: `p1zza-agent` is maintained as an `Everything Claude Code (ECC)` fork adapted for Claude + Codex

## 0.3.0

DATE: `2026-04-09`
STATUS: preparing-in-repo

SUMMARY:

- Product coordination capability is being expanded with dedicated `product-manager` and `product-owner` agents.
- The new roles are positioned above implementation work so product scope and acceptance quality can improve without weakening engineering ownership boundaries.
- Codex skill discovery, runtime dispatch guidance, and installer version metadata are being aligned for the `0.3.0` line.

CHANGES:

- added `product-manager` agent definitions to both `claude/agents/` and `codex/agents/`
- added `product-owner` agent definitions to both `claude/agents/` and `codex/agents/`
- added Codex skills `p1zza-product-manager` and `p1zza-product-owner`
- updated shared auto-dispatch and coordination registry for product strategy, backlog ownership, and acceptance clarification flows
- clarified that `development-lead` retains merge and deploy authority while product roles own scope and acceptance framing
- product version bumped from `0.2.0` to `0.3.0`

IMPACT:

- `0.3.0` can support earlier product shaping before engineering implementation begins
- PM and PO work can be routed more deterministically instead of overloading `development-lead`
- future non-engineering agents can be added on top of a clearer coordination model

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
