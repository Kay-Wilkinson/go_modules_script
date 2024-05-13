
# Go Go Mod!

This script will create a directory structure adherant to Go Modules for your Golang projects.

**(Recommended for Go 1.11 and later)**

Go modules are the current, official dependency management system in Go, allowing you to work outside the traditional GOPATH workspace. It makes dependency versioning clearer and simpler.

### Basic Directory Structure:
```bash
/my-go-app
│
├── go.mod               # Declares the module path and manages dependencies
├── go.sum               # Contains expected cryptographic checksums of module content
│
├── cmd                  # Contains the application-specific main packages
│   └── myapp
│       └── main.go      # The entry point of the program
│
├── pkg                  # Library code that's ok to use by external applications
│   └── mypackage
│       └── mypackage.go
│
└── internal             # Internal packages that are not meant to be used by other applications
    └── myinternal
        └── internal.go
```

### Set up:

**Make the script executable:**
```bash
$ chmod +x gogomod.sh

```

To make the script executable from anywhere, add the script to your PATH:

```bash
vi ~/.bash_profile
```

```bash
# add the path to the scripts' directory in your shell's configuration file (replace the values in the example below)
export PATH="/full/path/to/the/go_modules_script:$PATH"

```
Then reload your bash profile:

```bash
source ~/.bash_profile
```

Verify the addition.

```bash
echo $PATH
```

### Run the script:

```bash
gogomod.sh my-app-name my-package-name my-internal-package-name
```


