---
description: Multi-agent review of uncommitted changes
argument-hint: "[optional path scope, e.g. app/models]"
allowed-tools: Bash(git diff:*), Bash(git status:*), Bash(codex:*), Task
# model: claude-opus-4-8   # optional; reviews benefit from a stronger model
---

# Code Review Team

## Changes under review
Tracked (staged + unstaged) vs HEAD:
!`git diff HEAD -- $ARGUMENTS`

Untracked files (not in the diff above — inspect separately):
!`git status --porcelain --untracked-files=all | grep '^??' || echo "none"`

If the diff is empty AND there are no untracked files, stop and report
"No uncommitted changes to review." Do not launch agents.

## Severity rubric — EVERY agent uses these exact definitions
- 🔴 BLOCK — correctness or security bug, data loss, or changed behavior
  with no/broken test. Should stop the merge.
- 🟡 WARN — real issue, not merge-blocking: risky pattern, perf regression,
  weak test, convention violation with consequences.
- 🟢 NIT — style/preference/cosmetic. Author may ignore.

Cite `file:line` using the line number in the NEW version of the file,
not the diff hunk offset.

## Reviewers — launch ALL of these in parallel via the Task tool,
## passing each the diff and untracked list above.

1. **Security** — strong params / mass assignment, SQL injection
   (`where("...#{}")`, raw SQL), command injection, SSRF, missing authz
   (can user A touch user B's record?), secrets in code, `html_safe`/XSS,
   open redirects, unsafe deserialization.
2. **Performance** — N+1 (missing `includes`/`preload`), unbounded queries
   (no limit/pagination), missing indexes for new query patterns, per-row
   work that should be batched, request-path work that belongs in a job.
3. **Test coverage & quality** — every changed code path has a test for the
   new behavior; apply the pruning rules below.
4. **Rails conventions** — skinny controllers / service objects vs fat
   callbacks, reversible migrations with proper null constraints & indexes,
   scopes, naming, i18n.
5. **Architecture (clean architecture)** — dependency direction, business
   logic leaking into controllers/models, coupling, boundaries, testability.
6. **Adversarial** — assume the change is subtly wrong. Hunt the edge cases
   the author didn't handle: nil/empty/duplicate/huge input, partial failure,
   idempotency, race conditions, behavior under rollback or replay. Try to
   construct one input that breaks it.
7. **Codex** — run an independent review via the codex CLI, e.g.
   `git diff HEAD | codex exec "Review this diff for bug, architecture issues and risks"`.
   If `codex` is not on PATH, report that and skip — do not fail the run.

## Test pruning guidance (for reviewer #3)
Aggressively flag for removal:
- Tests asserting Rails/framework behavior
- Duplicate tests covering the same code path
- Tests >40 lines that could be split
- Integration tests duplicating unit coverage
- Trivial tests for getters/delegators

## Synthesis (you do this after all agents return)
Merge findings into ONE table. Collapse duplicates: same `file:line` + same
root cause = one row, keeping the highest severity and noting which reviewers
flagged it. Sort by severity (BLOCK → WARN → NIT), then by file.

| Severity | File:Line | Issue | Fix | Flagged by |
|----------|-----------|-------|-----|------------|
| 🔴 BLOCK | path:line | ... | ... | security, adversarial |
| 🟡 WARN | path:line | ... | ... | perf |
| 🟢 NIT | path:line | ... | ... | rails |

End with: `X blocking, Y warnings, Z nits`
