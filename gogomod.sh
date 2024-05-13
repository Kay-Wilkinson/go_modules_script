#!/bin/bash

# Script to create a Go project structure where the base directory is named after the application

# Check for correct number of arguments
if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <app_name> <package_name> <internal_package_name>"
    exit 1
fi

APP_NAME=$1
PACKAGE_NAME=$2
INTERNAL_PACKAGE_NAME=$3

# Base directory for the Go application now matches the app name
APP_DIR="${APP_NAME}"

# Create the base directory
mkdir -p "${APP_DIR}/cmd/${APP_NAME}"
mkdir -p "${APP_DIR}/pkg/${PACKAGE_NAME}"
mkdir -p "${APP_DIR}/internal/${INTERNAL_PACKAGE_NAME}"

# Create go.mod and go.sum files
touch "${APP_DIR}/go.mod"
echo "// Declares the module path and manages dependencies" > "${APP_DIR}/go.mod"
touch "${APP_DIR}/go.sum"
echo "// Contains expected cryptographic checksums of module content" > "${APP_DIR}/go.sum"

# Create main.go in the cmd/app directory
MAIN_GO="${APP_DIR}/cmd/${APP_NAME}/main.go"
touch "${MAIN_GO}"
echo "// The entry point of the program" > "${MAIN_GO}"
echo "package main" >> "${MAIN_GO}"
echo "import \"fmt\"" >> "${MAIN_GO}"
echo "func main() {" >> "${MAIN_GO}"
echo "    fmt.Println(\"Hello, ${APP_NAME}!\")" >> "${MAIN_GO}"
echo "}" >> "${MAIN_GO}"

# Create mypackage.go in the pkg directory
PACKAGE_GO="${APP_DIR}/pkg/${PACKAGE_NAME}/${PACKAGE_NAME}.go"
touch "${PACKAGE_GO}"
echo "// Library code that's ok to use by external applications" > "${PACKAGE_GO}"
echo "package ${PACKAGE_NAME}" >> "${PACKAGE_GO}"
echo "// ExportedFunction is an example function" >> "${PACKAGE_GO}"
echo "func ExportedFunction() string {" >> "${PACKAGE_GO}"
echo "    return \"This is from ${PACKAGE_NAME}.\"" >> "${PACKAGE_GO}"
echo "}" >> "${PACKAGE_GO}"

# Create internal.go in the internal directory
INTERNAL_GO="${APP_DIR}/internal/${INTERNAL_PACKAGE_NAME}/internal.go"
touch "${INTERNAL_GO}"
echo "// Internal packages that are not meant to be used by other applications" > "${INTERNAL_GO}"
echo "package ${INTERNAL_PACKAGE_NAME}" >> "${INTERNAL_GO}"
echo "// internalFunction is an example internal function" >> "${INTERNAL_GO}"
echo "func internalFunction() string {" >> "${INTERNAL_GO}"
echo "    return \"Internal use only for ${INTERNAL_PACKAGE_NAME}.\"" >> "${INTERNAL_GO}"
echo "}" >> "${INTERNAL_GO}"

echo "Go project structure for ${APP_NAME} created successfully."
