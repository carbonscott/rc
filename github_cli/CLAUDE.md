# GitHub CLI Project Utilities

Bash utilities for querying and displaying GitHub Projects (v2) data.

## Project Structure

```
~/.vim/github_cli/
├── gh_project.sh      # Main source file (sourced from .bash_profile)
└── CLAUDE.md          # This file

## Setup

The functions are sourced from `~/.bash_profile`:
```bash
source $HOME/.vim/github_cli/gh_project.sh
```

## Functions

| Function | Purpose |
|----------|---------|
| `gh_project` | Fetch and filter project items with table output |
| `gh_project_table` | Format JSON output as a table (used internally) |
| `_gh_parse_query` | Internal: parse query syntax into filter arrays |

## GitHub Project JSON Fields

The JSON from `gh project item-list` uses these field names:

| Display Column | JSON Field | Notes |
|---------------|------------|-------|
| Status | `.status` | e.g., "Todo", "In Progress", "Done" |
| Assignee | `.assignees[]` | Array of usernames |
| Priority | `.prioirty` | **Note: typo in GitHub's JSON** |
| Project | `."project Name"` | Has space in key |
| Type | `."task Type"` | Has space in key |
| Start | `."start Date"` | Has space in key |
| End | `."end Date"` | Has space in key |
| Title | `.title` | Issue/PR title |
| Number | `.content.number` | Issue/PR number |

## Testing Changes

After editing `gh_project.sh`:
```bash
source ~/.bash_profile
gh_project --help
gh_project -q "status:Todo"
```

## Query Syntax

```
field:value       Include matching items
-field:value      Exclude matching items
field:"spaces"    Quote values with spaces
```

Supported fields: `status`, `assignee`, `priority`, `project`, `type`, `title`

## Dependencies

- `gh` (GitHub CLI) - for fetching project data
- `jq` - for JSON processing
- `awk` - for table formatting
