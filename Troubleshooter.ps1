#requires -Version 5.1
<# Created by Dewald Pretorius #>
param([string]$OutputPath)
if(-not $OutputPath){$OutputPath="$([Environment]::GetFolderPath('Desktop'))\Word_Corruption_Reports"};New-Item $OutputPath -ItemType Directory -Force|Out-Null
$events=Get-WinEvent -FilterHashtable @{LogName='Application';StartTime=(Get-Date).AddDays(-7)} -ErrorAction SilentlyContinue|Where-Object Message -match 'WINWORD|Word|document'|Select-Object -First 50 TimeCreated,Id,ProviderName,Message
$normal="$env:APPDATA\Microsoft\Templates\Normal.dotm"
@('WORD DOCUMENT CORRUPTION TROUBLESHOOTER','Created by Dewald Pretorius',"Generated: $(Get-Date)","Normal.dotm exists: $(Test-Path $normal)",'Guidance: test Open and Repair, recover text, copy content without final paragraph mark, test a new template, and preserve the original file.',($events|Format-List|Out-String -Width 220))|Set-Content (Join-Path $OutputPath 'Report.txt') -Encoding UTF8