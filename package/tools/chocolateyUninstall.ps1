# HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\
$msiId = '{80BDFEC8-E811-4211-A20E-98C569F84855}'
$msiId64 = '{BBDB706C-1469-41D5-BAEF-FC43A996B5DE}'

$package = 'CrystalReports2010Runtime'

if ([IntPtr]::Size -eq 8) { Uninstall-ChocolateyPackage $package 'MSI' -SilentArgs "$msiId64 /qb" -validExitCodes @(0) }
else { Uninstall-ChocolateyPackage $package 'MSI' -SilentArgs "$msiId /qb" -validExitCodes @(0) }

