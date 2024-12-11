param(
    [string]$Param1,
    [string]$Param2
)

set-executionpolicy unrestricted -scope currentuser

# Function to check if a parameter is null or empty, and if so, prompt the user for input
function Get-Input {
    param (
        [string]$paramName,
        [ref]$paramValue
    )

    if ([string]::IsNullOrEmpty($paramValue.Value)) {
        $paramValue.Value = Read-Host "Please enter the value for $paramName"
    }
}

# Check and prompt for Param1 if not provided
Get-Input -paramName 'Param1' -paramValue ([ref]$Param1)

# Check and prompt for Param2 if not provided
Get-Input -paramName 'Param2' -paramValue ([ref]$Param2)


###

$ModuleName = "NtObjectManager"

# Check if the module is installed
$module = Get-InstalledModule -Name NtObjectManager -ErrorAction SilentlyContinue

# If the module is not installed, install it
if (-not $module) {
    Write-Host "Module 'NtObjectManager' not found. Installing..."
    Install-Module -Name NtObjectManager -Force -Scope CurrentUser
    Write-Host "Module 'NtObjectManager' installed successfully."
} else {
    Write-Host "Module 'NtObjectManager' is already installed."
}

Import-Module NtObjectManager

# Start up TrustedInstaller and store the process in a variable

Start-Service TrustedInstaller
$processOfTrustedInstaller = (Get-NtProcess -Name TrustedInstaller.exe)
$thread = $processOfTrustedInstaller.GetFirstThread()
$currentThread = Get-NtThread -Current -PseudoHandle
$impersonate = $currentThread.ImpersonateThread($thread)
$impersonate_token = Get-NtToken -Impersonation
$impersonate_token.Groups | Where-Object {$_.Sid.Name -match "TrustedInstaller"}

$impersonate




