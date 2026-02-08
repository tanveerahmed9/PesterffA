# Dev Container for Pester PowerShell Testing

This dev container is configured to provide a complete PowerShell and Pester development environment.

## What's Included

- **PowerShell Core** - Latest version with full PowerShell 7+ support
- **Pester** - PowerShell testing framework (automatically installed)
- **Git** - Version control support
- **VS Code Extension** - PowerShell language support

## Getting Started

1. **Reopen in Container**: Click the "Dev Containers" button in VS Code status bar and select "Reopen in Container"
2. **Verify Installation**: Run the following in the PowerShell terminal:
   ```powershell
   Get-Module Pester -ListAvailable
   ```

## Using Pester

### Create a test file
Create a new `.Tests.ps1` file:
```powershell
Describe "My Test Suite" {
    It "Should perform a basic test" {
        1 + 1 | Should -Be 2
    }
}
```

### Run tests
```powershell
Invoke-Pester
# or for specific file
Invoke-Pester -Path ./MyTest.Tests.ps1
```

## Customization

- Edit `devcontainer.json` to add features, extensions, or change settings
- Edit `Dockerfile` to install additional tools or PowerShell modules
- The `postCreateCommand` in `devcontainer.json` runs automatically after container creation

## References

- [Pester Documentation](https://pester.dev/)
- [PowerShell Container Images](https://hub.docker.com/_/microsoft-powershell)
- [Dev Containers Documentation](https://containers.dev/)
