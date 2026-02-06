# Code Review Team

Create an agent team to review uncomitted changes (`git diff`)
- One focused on security implications
- One checking performance impact
- One validating test coverage and quality (flag redundant, overly verbose, or unecessary tests)
- One reviewing Rails best practices and conventions
- One reviewing architecture (clean architecture)

Have them each review and report findings.

## Test Pruning Guidance

Aggressively flag for removal:
- Tests asserting Rails/framework behavior
- Duplicate tests covering the same code path
- Tests >40 lines that could be split
- Integration tests duplicating unit coverage
- Trivial tests for getters/delegators

## Output
| Severity | File:Line | Issue | Fix |
|----------|-----------|-------|-----|
| 🔴 BLOCK | path:line | ... | ... |
| 🟡 WARN | path:line | ... | ... |
| 🟢 NIT | path:line | ... | ... |

End with: `X blocking, Y warnings, Z nits`
