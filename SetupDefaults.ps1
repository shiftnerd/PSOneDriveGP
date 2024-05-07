< # Function to enable OneDrive Known folders move.#>
function Enable-OneDriveKnownFolderMove {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $false, HelpMessage = 'Enable silent sync of Pictures folder')]
        [ValidateSet('1', '0')]
        [string]$OptInPictures = '1',

        [Parameter(Mandatory = $false, HelpMessage = 'Enable silent sync of Documents folder')]
        [ValidateSet('1', '0')]
        [string]$OptInDocuments = '1',

        [Parameter(Mandatory = $false, HelpMessage = 'Enable silent sync of Desktop folder')]
        [ValidateSet('1', '0')]
        [string]$OptInDesktop = '1',

        [Parameter(Mandatory = $false, HelpMessage = 'Enable silent opt-in')]
        [ValidateSet('1', '0')]
        [string]$OptInSilent = '1'
    )
    process {
        if ((Test-Path -LiteralPath 'HKLM:\SOFTWARE\Policies\Microsoft\OneDrive') -ne $true) { New-Item 'HKLM:\SOFTWARE\Policies\Microsoft\OneDrive' -Force -ea SilentlyContinue }
        if ($OptInPictures = '1') { New-ItemProperty -LiteralPath 'HKLM:\SOFTWARE\Policies\Microsoft\OneDrive' -Name 'KFMSilentOptInPictures' -Value 1 -PropertyType DWord -Force -ea SilentlyContinue; }else {}
        if ($OptInDocuments = '1') { New-ItemProperty -LiteralPath 'HKLM:\SOFTWARE\Policies\Microsoft\OneDrive' -Name 'KFMSilentOptInDocuments' -Value 1 -PropertyType DWord -Force -ea SilentlyContinue; }else {}
        if ($OptInDesktop = '1') { New-ItemProperty -LiteralPath 'HKLM:\SOFTWARE\Policies\Microsoft\OneDrive' -Name 'KFMSilentOptInDesktop' -Value 1 -PropertyType DWord -Force -ea SilentlyContinue; }else {}
        if ($OptInDesktop = '1') { New-ItemProperty -LiteralPath 'HKLM:\SOFTWARE\Policies\Microsoft\OneDrive' -Name 'KFMSilentOptInWithNotification' -Value 0 -PropertyType DWord -Force -ea SilentlyContinue; }else {}
        
    }
}
Enable-OneDriveKnownFolderMove

function Enable-OneDriveFilesOnDemand {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $false, HelpMessage = 'Enable Files On Demand')]
        [ValidateSet('1', '0')]
        [string]$FilesOnDemandEnable = '1'
    )
    process {
        if ((Test-Path -LiteralPath 'HKLM:\SOFTWARE\Policies\Microsoft\OneDrive') -ne $true) { New-Item 'HKLM:\SOFTWARE\Policies\Microsoft\OneDrive' -Force -ea SilentlyContinue }
        if ($FilesOnDemandEnable = '1') { New-ItemProperty -LiteralPath 'HKLM:\SOFTWARE\Policies\Microsoft\OneDrive' -Name 'filesondemandEnabled' -Value 1 -PropertyType DWord -Force -ea SilentlyContinue; }else {}

    }
}
Enable-OneDriveFilesOnDemand

function Enable-OneDriveSilentSignIn {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $false, HelpMessage = 'Enable Silent Sign In with windows credentials')]
        [ValidateSet('1', '0')]
        [string]$SilentSigninEnable = '1'
    )
    process {
        if ((Test-Path -LiteralPath 'HKLM:\SOFTWARE\Policies\Microsoft\OneDrive') -ne $true) { New-Item 'HKLM:\SOFTWARE\Policies\Microsoft\OneDrive' -Force -ea SilentlyContinue }
        if ($SilentSigninEnable = '1') { New-ItemProperty -LiteralPath 'HKLM:\SOFTWARE\Policies\Microsoft\OneDrive' -Name 'SilentAccountConfig' -Value 1 -PropertyType DWord -Force -ea SilentlyContinue; }else {}

    }
}
Enable-OneDriveSilentSignIn
