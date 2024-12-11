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

#Grant TrustedInstaller permission on new Powershell window
# $line1 = ('Import-Module NtObjectManager')
$line2 = ('Start-Service TrustedInstaller')
$line3 = ('$processOfTrustedInstaller = (Get-NtProcess -Name TrustedInstaller.exe)')
$line4 = ('$thread = $processOfTrustedInstaller.GetFirstThread()')
$line5 = ('$currentThread = Get-NtThread -Current -PseudoHandle')
$line6 = ('$impersonate = $currentThread.ImpersonateThread($thread)')
$line7 = ('$impersonate_token = Get-NtToken -Impersonation')
#$line8 = (cls)

Start-Process powershell.exe -ArgumentList "-NoExit", "-Command", "Import-Module NtObjectManager", $line2, $line3, $line4, $line5, $line6, $line7