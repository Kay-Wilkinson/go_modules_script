#!/bin/bash

# Configuration
TEST_APP_NAME="testapp"
TEST_PACKAGE_NAME="testpackage"
TEST_INTERNAL_NAME="testinternal"
SCRIPT_PATH="../gogomod.sh"

# Run the main script
bash "$SCRIPT_PATH" "$TEST_APP_NAME" "$TEST_PACKAGE_NAME" "$TEST_INTERNAL_NAME"

# Define test function to check existence of file
check_file_exists() {
    if [ ! -f "$1" ]; then
        echo "Test failed: $1 does not exist."
        exit 1
    else
        echo "Test passed: $1 exists."
    fi
}

# Define directory and file paths
APP_DIR="../$TEST_APP_NAME"
CMD_MAIN_GO="$APP_DIR/cmd/$TEST_APP_NAME/main.go"
PKG_GO="$APP_DIR/pkg/$TEST_PACKAGE_NAME/$TEST_PACKAGE_NAME.go"
INTERNAL_GO="$APP_DIR/internal/$TEST_INTERNAL_NAME/$TEST_INTERNAL_NAME.go"

# Check if directories and files were created
check_file_exists "$CMD_MAIN_GO"
check_file_exists "$PKG_GO"
check_file_exists "$INTERNAL_GO"


if grep -q "package main" "$CMD_MAIN_GO"; then
    echo "Test passed: main.go contains package main."
else
    echo "Test failed: main.go does not contain package main."
    exit 1
fi

# Clean up (optional)
# Ccmment the following line if you want to keep test artifacts
rm -r "$APP_DIR"

echo "All tests completed successfully."
