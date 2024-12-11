#Make sure needed module is installed
$module = Get-InstalledModule -Name NtObjectManager -ErrorAction SilentlyContinue
#If the module is not installed, install it
if (-not $module) {
    Write-Host "Module 'NtObjectManager' not found. Installing..."
    Install-Module -Name NtObjectManager -Force -Scope CurrentUser
    Write-Host "Module 'NtObjectManager' installed successfully."
} else {
    Write-Host "Module 'NtObjectManager' is already installed."
}

Import-Module NtObjectManager

#Grant TrustedInstaller permission on current powershell window
sc.exe start TrustedInstaller
$processOfTrustedInstaller = (Get-NtProcess -Name TrustedInstaller.exe)
$thread = $processOfTrustedInstaller.GetFirstThread()
$currentThread = Get-NtThread -Current -PseudoHandle
$impersonate = $currentThread.ImpersonateThread($thread)
$impersonate_token = Get-NtToken -Impersonation
#$impersonate_token.Groups | Where-Object {$_.Sid.Name -match "TrustedInstaller"}

$impersonate
clear

Write-Output "This Powershell session now runs commands as TrustedInstaller"