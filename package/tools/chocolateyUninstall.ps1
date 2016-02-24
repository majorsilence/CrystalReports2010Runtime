# HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\
$msiId = '{4A10D640-13F1-4A13-BAD1-3E3790511B17}'
$msiId64 = '{9EFF1F10-990C-4DE8-A4C7-7EEE1952F159}'

$package = 'CrystalReports2010Runtime'

if ([IntPtr]::Size -eq 8) { Uninstall-ChocolateyPackage $package 'MSI' -SilentArgs "$msiId64 /qb" -validExitCodes @(0) }
else { Uninstall-ChocolateyPackage $package 'MSI' -SilentArgs "$msiId /qb" -validExitCodes @(0) }

