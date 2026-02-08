# Use the official PowerShell container image
FROM mcr.microsoft.com/powershell:latest

# Install git
RUN apt-get update && \
    apt-get install -y git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install Pester module
RUN pwsh -Command 'Install-Module Pester -Force -SkipPublisherCheck -Scope AllUsers'

# Set working directory
WORKDIR /workspace

# Default shell to pwsh
ENTRYPOINT ["pwsh"]
