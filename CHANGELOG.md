# CHANGELOG

This file is AI-agent-friendly by default.

- FORMAT: deterministic
- ORDER: newest first
- VERSIONING: semantic versioning
- CHANGE TYPE: product-level summary, not commit dump
- LINEAGE: `p1zza-agent` is maintained as an `Everything Claude Code (ECC)` fork adapted for Claude + Codex

## 0.5.0

DATE: `2026-04-09`
STATUS: preparing-in-repo

SUMMARY:

- User-flow and usability work now has a dedicated owner through `ui-ux-designer`.
- A canonical UX packet layer was added so flow discovery and implementation handoff can be separated from styling work.
- Claude and Codex runtime dispatch guidance, skill routing, and installer metadata were aligned for the `0.5.0` line.

CHANGES:

- added `ui-ux-designer` agent definitions to both `claude/agents/` and `codex/agents/`
- added Codex skill `p1zza-ui-ux-designer`
- added `ux-design-templates.md` to both runtime packages
- added `ux-brief-v1` and `ux-handoff-v1` as canonical packet templates
- clarified `frontend-designer` as the visual styling implementation owner after UX intent is defined
- updated shared auto-dispatch and coordination registry for wireframes, interaction models, and usability routing
- product version bumped from `0.4.0` to `0.5.0`

IMPACT:

- UX structure can now be handed off separately from styling implementation
- flow and usability work are less likely to be mixed into CSS-only tasks
- the product/design collaboration layer is more explicit

## 0.4.0

DATE: `2026-04-09`
STATUS: released-in-repo

SUMMARY:

- Customer-facing signals now have a dedicated coordination role through `customer-management`.
- A canonical packet layer was added so support issues, feedback, and churn-risk signals can be routed cleanly into product and engineering workflows.
- Claude and Codex runtime dispatch guidance, skill routing, and installer metadata were aligned for the `0.4.0` line.

CHANGES:

- added `customer-management` agent definitions to both `claude/agents/` and `codex/agents/`
- added Codex skill `p1zza-customer-management`
- added `customer-management-templates.md` to both runtime packages
- added `customer-signal-v1` and `customer-handoff-v1` as canonical packet templates
- updated shared auto-dispatch and coordination registry for customer feedback, support triage, and escalation routing
- product version bumped from `0.3.1` to `0.4.0`

IMPACT:

- customer feedback can now be normalized before it reaches PM/PO or engineering
- product/customer handoff semantics are more deterministic
- the next release layer can build on a complete product-to-customer loop

## 0.3.1

DATE: `2026-04-09`
STATUS: released-in-repo

SUMMARY:

- README maintenance and changelog version logging are being promoted into explicit product capabilities of the agent system for versioned workspaces that define them.
- Claude and Codex runtime guidance now treats documentation upkeep as part of normal product delivery rather than optional cleanup.
- The documentation workflow and `doc-updater` role were expanded so versioned product changes in qualifying workspaces must carry README and changelog updates together.

CHANGES:

- documented at the product root that `README.md` maintenance and `CHANGELOG.md` version logging are agent-system responsibilities in qualifying versioned workspaces
- updated Claude and Codex entrypoint guidance to treat docs/versioning upkeep as built-in service behavior
- inserted a docs/versioning step into the shared development workflow for both runtimes
- expanded `doc-updater` in both packages to manage `CHANGELOG.md` alongside `README.md`
- product version bumped from `0.3.0` to `0.3.1`

IMPACT:

- future product-visible changes are less likely to ship without README updates
- version history is tied more tightly to runtime behavior and release discipline
- documentation upkeep becomes a predictable part of the service contract

## 0.3.0

DATE: `2026-04-09`
STATUS: released-in-repo

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
- documented that `README.md` and `CHANGELOG.md` must be updated together for versioned or user-visible product changes
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
