#!/bin/bash
# GitHub CLI project management utilities
# Source this file from .bash_profile

# Internal: Parse query string and populate filter arrays
# Usage: _gh_parse_query "query string"
# Sets: f_status, f_assignee, f_priority, f_project, f_type, f_title
#       f_not_status, f_not_assignee, f_not_priority, f_not_project, f_not_type, f_not_title
_gh_parse_query() {
    local query="$1"
    local token field value exclude

    # Parse tokens: handles field:value and field:"value with spaces"
    while [[ -n "$query" ]]; do
        # Skip leading whitespace
        query="${query#"${query%%[![:space:]]*}"}"
        [[ -z "$query" ]] && break

        # Check for exclusion prefix
        exclude=false
        if [[ "$query" == -* ]]; then
            exclude=true
            query="${query:1}"
        fi

        # Extract field name (everything before :)
        if [[ "$query" =~ ^([a-zA-Z]+): ]]; then
            field="${BASH_REMATCH[1]}"
            query="${query#"$field":}"
        else
            # Skip unrecognized token
            query="${query#* }"
            continue
        fi

        # Extract value (handle quoted values)
        if [[ "$query" == \"* ]]; then
            # Quoted value: find closing quote
            query="${query:1}"
            value="${query%%\"*}"
            query="${query#"$value"\"}"
        else
            # Unquoted value: take until space
            value="${query%% *}"
            if [[ "$value" == "$query" ]]; then
                query=""
            else
                query="${query#"$value"}"
            fi
        fi

        # Map field to filter array
        if $exclude; then
            case "$field" in
                status)   f_not_status+=("$value") ;;
                assignee) f_not_assignee+=("$value") ;;
                priority) f_not_priority+=("$value") ;;
                project)  f_not_project+=("$value") ;;
                type)     f_not_type+=("$value") ;;
                title)    f_not_title+=("$value") ;;
            esac
        else
            case "$field" in
                status)   f_status+=("$value") ;;
                assignee) f_assignee+=("$value") ;;
                priority) f_priority+=("$value") ;;
                project)  f_project+=("$value") ;;
                type)     f_type+=("$value") ;;
                title)    f_title+=("$value") ;;
            esac
        fi
    done
}

gh_project_table() {
    if [[ "$1" == "--help" || "$1" == "-h" ]]; then
        cat <<'EOF'
Usage: gh project item-list ... --format json | gh_project_table [title_len]

Format GitHub project JSON output as a table.

ARGUMENTS
  title_len    Max title length (default: 35)

EXAMPLE
  gh project item-list 1 --owner lcls-daw --format json | gh_project_table 50
EOF
        return 0
    fi

    local title_len="${1:-35}"
    local title_width="$((title_len + 2))"

    jq -r --argjson tlen "$title_len" '
        ["#","Title","Status","Assignee","Start","End","Priority","Project","Type"],
        (.items[] | [
            .content.number,
            .title[0:$tlen],
            .status // "-",
            (.assignees // [] | .[0] // "-"),
            (."start Date" // "-"),
            (."end Date" // "-"),
            .prioirty // "-",
            (."project Name" // "-"),
            (."task Type" // "-")
        ]) | @tsv
    ' | awk -F'\t' -v tw="$title_width" '{printf "%-4s %-" tw "s %-12s %-14s %-12s %-12s %-8s %-22s %-15s\n", $1, $2, $3, $4, $5, $6, $7, $8, $9}'
}

# Wrapper: fetch and format project items with filtering
# Usage: gh_project [owner] [project_num] [limit] [title_len] [--filters...]
# Filters: --status, --assignee, --priority, --project, --type, --title
#          --start-after, --start-before, --end-after, --end-before
gh_project() {
    local owner="lcls-daw"
    local num="1"
    local limit="100"
    local title_len="35"

    # Filter variables (arrays for multiple values with OR logic)
    local f_status=() f_assignee=() f_priority=() f_project=() f_type=() f_title=()
    local f_start_after="" f_start_before="" f_end_after="" f_end_before=""
    # Exclusion filter variables (arrays for multiple values)
    local f_not_status=() f_not_assignee=() f_not_priority=()
    local f_not_project=() f_not_type=() f_not_title=()
    # Action variables
    local open_issue=""
    # Sorting variables
    local sort_field="" sort_reverse=""

    # Collect positional args
    local positional=()

    # Parse arguments
    while [[ $# -gt 0 ]]; do
        case "$1" in
            --help|-h)
                cat <<'EOF'
Usage: gh_project [owner] [project_num] [limit] [title_len] [--filters...]
       gh_project -q "query string" [other options...]

Fetch and display GitHub project items with optional filtering.

POSITIONAL ARGUMENTS
  owner        GitHub org/user (default: lcls-daw)
  project_num  Project number (default: 1)
  limit        Max items to fetch (default: 100)
  title_len    Max title length (default: 35)

QUERY MODE
  -q, --query QUERY    Filter using query syntax (see below)

QUERY SYNTAX
  field:value          Include items matching field value
  -field:value         Exclude items matching field value
  field:"with spaces"  Use quotes for values containing spaces

  Supported fields: status, assignee, priority, project, type, title

FILTERS (repeatable, OR logic)
  --status VALUE       Filter by status (e.g., "In Progress", "Todo", "Done")
  --assignee VALUE     Filter by assignee username
  --priority VALUE     Filter by priority (High, Medium, Low)
  --project VALUE      Filter by project name (partial match)
  --type VALUE         Filter by task type (partial match)
  --title VALUE        Filter by title (case-insensitive, partial match)

DATE FILTERS
  --start-after DATE   Filter: start date >= DATE
  --start-before DATE  Filter: start date <= DATE
  --end-after DATE     Filter: end date >= DATE
  --end-before DATE    Filter: end date <= DATE

EXCLUSION FILTERS (repeatable, AND logic)
  --not-status VALUE   Exclude items with this status
  --not-assignee VALUE Exclude items assigned to this user
  --not-priority VALUE Exclude items with this priority
  --not-project VALUE  Exclude items from this project (partial match)
  --not-type VALUE     Exclude items of this type (partial match)
  --not-title VALUE    Exclude items matching title (partial match)

SORTING
  -s, --sort FIELD     Sort by field (number, title, status, assignee, start, end, priority, project, type)
  --reverse, --desc    Sort in descending order (default: ascending)

ACTIONS
  -o, --open NUMBER    Open issue #NUMBER in browser (exits without listing)

EXAMPLES
  # Query mode (concise)
  gh_project -q "assignee:carbonscott -status:Done"
  gh_project -q 'status:"In Progress"'
  gh_project -q "status:Todo status:\"In Progress\""  # OR logic

  # Flag mode (verbose)
  gh_project --status "In Progress"
  gh_project --assignee carbonscott --not-status Done

  # Mixed: query + flags
  gh_project -q "assignee:carbonscott" --start-after 2025-01-01

  # Sorting
  gh_project --sort status             # Sort by status A-Z
  gh_project --sort start --reverse    # Sort by start date, newest first
  gh_project -s priority               # Short form

  # Open issue in browser
  gh_project -o 101                    # Open issue #101
  gh_project my-org 2 -o 101           # Open from different owner/project
EOF
                return 0
                ;;
            -q|--query)    _gh_parse_query "$2"; shift 2 ;;
            --status)      f_status+=("$2"); shift 2 ;;
            --assignee)    f_assignee+=("$2"); shift 2 ;;
            --priority)    f_priority+=("$2"); shift 2 ;;
            --project)     f_project+=("$2"); shift 2 ;;
            --type)        f_type+=("$2"); shift 2 ;;
            --title)       f_title+=("$2"); shift 2 ;;
            --start-after) f_start_after="$2"; shift 2 ;;
            --start-before) f_start_before="$2"; shift 2 ;;
            --end-after)   f_end_after="$2"; shift 2 ;;
            --end-before)  f_end_before="$2"; shift 2 ;;
            --not-status)      f_not_status+=("$2"); shift 2 ;;
            --not-assignee)    f_not_assignee+=("$2"); shift 2 ;;
            --not-priority)    f_not_priority+=("$2"); shift 2 ;;
            --not-project)     f_not_project+=("$2"); shift 2 ;;
            --not-type)        f_not_type+=("$2"); shift 2 ;;
            --not-title)       f_not_title+=("$2"); shift 2 ;;
            -o|--open)         open_issue="$2"; shift 2 ;;
            -s|--sort)         sort_field="$2"; shift 2 ;;
            --reverse|--desc)  sort_reverse="true"; shift ;;
            -*)            echo "Unknown option: $1" >&2; return 1 ;;
            *)             positional+=("$1"); shift ;;
        esac
    done

    # Apply positional args
    [[ ${#positional[@]} -ge 1 ]] && owner="${positional[0]}"
    [[ ${#positional[@]} -ge 2 ]] && num="${positional[1]}"
    [[ ${#positional[@]} -ge 3 ]] && limit="${positional[2]}"
    [[ ${#positional[@]} -ge 4 ]] && title_len="${positional[3]}"

    # Handle --open: fetch URL and open in browser
    if [[ -n "$open_issue" ]]; then
        if ! [[ "$open_issue" =~ ^[0-9]+$ ]]; then
            echo "Error: --open requires a numeric issue number" >&2
            return 1
        fi
        local url
        url=$(gh project item-list "$num" --owner "$owner" --format json --limit 500 | \
            jq -r --argjson n "$open_issue" '.items[] | select(.content.number == $n) | .content.url' | head -1)
        if [[ -z "$url" || "$url" == "null" ]]; then
            echo "Error: Issue #$open_issue not found in project $owner/$num" >&2
            return 1
        fi
        echo "Opening: $url"
        open "$url"
        return 0
    fi

    # Build jq filter conditions
    local conditions=()
    # Positive filters (OR logic for multiple values)
    if [[ ${#f_status[@]} -gt 0 ]]; then
        local _or=""
        for val in "${f_status[@]}"; do
            [[ -n "$_or" ]] && _or="$_or or "
            _or="$_or(.status // \"\") == \"$val\""
        done
        conditions+=("($_or)")
    fi
    if [[ ${#f_assignee[@]} -gt 0 ]]; then
        local _or=""
        for val in "${f_assignee[@]}"; do
            [[ -n "$_or" ]] && _or="$_or or "
            _or="$_or(.assignees // [] | index(\"$val\") != null)"
        done
        conditions+=("($_or)")
    fi
    if [[ ${#f_priority[@]} -gt 0 ]]; then
        local _or=""
        for val in "${f_priority[@]}"; do
            [[ -n "$_or" ]] && _or="$_or or "
            _or="$_or(.prioirty // \"\") == \"$val\""
        done
        conditions+=("($_or)")
    fi
    if [[ ${#f_project[@]} -gt 0 ]]; then
        local _or=""
        for val in "${f_project[@]}"; do
            [[ -n "$_or" ]] && _or="$_or or "
            _or="$_or(.\"project Name\" // \"\" | contains(\"$val\"))"
        done
        conditions+=("($_or)")
    fi
    if [[ ${#f_type[@]} -gt 0 ]]; then
        local _or=""
        for val in "${f_type[@]}"; do
            [[ -n "$_or" ]] && _or="$_or or "
            _or="$_or(.\"task Type\" // \"\" | contains(\"$val\"))"
        done
        conditions+=("($_or)")
    fi
    if [[ ${#f_title[@]} -gt 0 ]]; then
        local _or=""
        for val in "${f_title[@]}"; do
            [[ -n "$_or" ]] && _or="$_or or "
            _or="$_or(.title // \"\" | ascii_downcase | contains(\"$val\" | ascii_downcase))"
        done
        conditions+=("($_or)")
    fi
    [[ -n "$f_start_after" ]]  && conditions+=("(.\"start Date\" != null and .\"start Date\" >= \"$f_start_after\")")
    [[ -n "$f_start_before" ]] && conditions+=("(.\"start Date\" != null and .\"start Date\" <= \"$f_start_before\")")
    [[ -n "$f_end_after" ]]    && conditions+=("(.\"end Date\" != null and .\"end Date\" >= \"$f_end_after\")")
    [[ -n "$f_end_before" ]]   && conditions+=("(.\"end Date\" != null and .\"end Date\" <= \"$f_end_before\")")
    # Exclusion filters (loop through arrays for multiple values)
    for val in "${f_not_status[@]}"; do
        conditions+=("(.status // \"\") != \"$val\"")
    done
    for val in "${f_not_assignee[@]}"; do
        conditions+=("(.assignees // [] | index(\"$val\") == null)")
    done
    for val in "${f_not_priority[@]}"; do
        conditions+=("(.prioirty // \"\") != \"$val\"")
    done
    for val in "${f_not_project[@]}"; do
        conditions+=("(.\"project Name\" // \"\" | contains(\"$val\") | not)")
    done
    for val in "${f_not_type[@]}"; do
        conditions+=("(.\"task Type\" // \"\" | contains(\"$val\") | not)")
    done
    for val in "${f_not_title[@]}"; do
        conditions+=("(.title // \"\" | ascii_downcase | contains(\"$val\" | ascii_downcase) | not)")
    done

    # Join conditions with 'and'
    local jq_filter="true"
    if [[ ${#conditions[@]} -gt 0 ]]; then
        jq_filter="${conditions[0]}"
        for ((i=1; i<${#conditions[@]}; i++)); do
            jq_filter="$jq_filter and ${conditions[$i]}"
        done
    fi

    # Build sort expression
    local jq_sort=""
    if [[ -n "$sort_field" ]]; then
        sort_field="$(echo "$sort_field" | tr '[:upper:]' '[:lower:]')"  # Convert to lowercase
        local sort_key
        case "$sort_field" in
            number)   sort_key=".content.number // 0" ;;
            title)    sort_key=".title // \"\"" ;;
            status)   sort_key=".status // \"\"" ;;
            assignee) sort_key="(.assignees // [])[0] // \"\"" ;;
            start)    sort_key=".\"start Date\" // \"\"" ;;
            end)      sort_key=".\"end Date\" // \"\"" ;;
            priority) sort_key=".prioirty // \"\"" ;;
            project)  sort_key=".\"project Name\" // \"\"" ;;
            type)     sort_key=".\"task Type\" // \"\"" ;;
            *)        echo "Unknown sort field: $sort_field (valid: number, title, status, assignee, start, end, priority, project, type)" >&2; return 1 ;;
        esac
        jq_sort="| sort_by($sort_key)"
        [[ -n "$sort_reverse" ]] && jq_sort="$jq_sort | reverse"
    fi

    # Fetch, filter, and sort
    gh project item-list "$num" --owner "$owner" --format json --limit "$limit" | \
        jq --arg filter "$jq_filter" '.items |= (map(select('"$jq_filter"'))'"$jq_sort"')' | \
        gh_project_table "$title_len"
}
