# Code Review

Use agent-organizer to review uncommitted changes (`git diff`) with these agents:

- **code-reviewer**
- **qa-expert**
- **rails**
- **security-auditor**
- **test-automator**
- **architect-reviewer**

## Focus Areas

- Requirements compliance and code standards
- Readability
- Testability
- Rails best practices and conventions
- Security issues
- Clean architecture
- Clean code
- **Test quality**: flag tests that are redundant, overly verbose, or unnecessary

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
