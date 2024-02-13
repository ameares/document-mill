#!/bin/bash

# Check if a project name was provided
if [ -z "$1" ]; then
    echo "Usage: $0 PROJECT_NAME"
    exit 1
fi

# Define the project name
PROJECT_NAME="$1"

# Array of patterns to ignore. Add patterns here.
IGNORE_PATTERNS=(
    './create-document-mill*'
)

# Function to join ignore patterns
join_patterns() {
    local IFS="|"
    echo "$*"
}

# Generate grep pattern for ignoring files and directories
GREP_IGNORE_PATTERN=$(join_patterns "${IGNORE_PATTERNS[@]}")

# Convert ignore patterns array to a grep-compatible pattern string
IGNORE_PATTERN=$(printf "|%s" "${IGNORE_PATTERNS[@]}")
IGNORE_PATTERN=${IGNORE_PATTERN:1} # Remove the leading '|'

# Function to generate directory structure
generate_directories() {
    echo "# Create folders"
    find . -type d ! -path '.' | grep -Ev "$IGNORE_PATTERN" | sed 's|^\./|mkdir -p |' | sort
}

# Function to generate file content
generate_files() {
    echo ""
    find . -type f | grep -Ev "$GREP_IGNORE_PATTERN" | while read -r file; do
        local relative_path="${file#./}" # Remove leading './'
        echo "# Create $relative_path"
        echo "cat <<'EOF' > $relative_path"
        cat "$file"
        echo "EOF"
        echo ""
    done
}

# Start of the script generation
echo "#!/bin/bash"
echo ""
echo "# Define project name"
echo "PROJECT_NAME=\"$PROJECT_NAME\""
echo ""
echo "# Create project directory and navigate into it"
echo "mkdir -p \"\$PROJECT_NAME\""
echo "cd \"\$PROJECT_NAME\""
echo ""

# Call functions to generate directories and files
generate_directories
generate_files

# End of the script with a success message
echo "# Success message"
echo "echo \"\$PROJECT_NAME framework is ready.\""
