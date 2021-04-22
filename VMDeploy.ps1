#requires -RunAsAdministrator

[CmdletBinding()]
param (
    [Parameter(Mandatory=$true, HelpMessage="VM admin user name")]
    [string]$vmAdmin
)

New-Item -ItemType Directory -Force -Path "C:\Users\$vmAdmin\Desktop\Va_Logs"
New-Item -ItemType Directory -Force -Path "C:\Users\$vmAdmin\Desktop\Setup_Logs"
New-Item -Path "HKLM:\\Software\\Microsoft\\AzureOperationalInsights"

Set-ItemProperty -Path "HKLM:\\Software\\Microsoft\\AzureOperationalInsights" -Name "SqlVulnerabilityAssessment_LogDirectoryPath" -Value "C:\Users\$vmAdmin\Desktop\Va_Logs"
Set-ItemProperty -Path "HKLM:\\Software\\Microsoft\\AzureOperationalInsights" -Name "SqlVulnerabilityAssessment_BypassHashCheck" -Value "true"
Set-ItemProperty -Path "HKLM:\\Software\\Microsoft\\AzureOperationalInsights" -Name "SqlVulnerabilityAssessment_TestMachine" -Value "true"
