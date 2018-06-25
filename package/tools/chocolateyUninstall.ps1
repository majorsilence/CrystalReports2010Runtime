# HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\
$msiId = '{FA2DBC64-D232-4999-87AF-D2A75780024D}'
$msiId64 = '{4DB0F775-025B-4B92-808D-53A28F4C105D}'

$package = 'CrystalReports2010Runtime'

if ([IntPtr]::Size -eq 8) { Uninstall-ChocolateyPackage $package 'MSI' -SilentArgs "$msiId64 /qb" -validExitCodes @(0) }
else { Uninstall-ChocolateyPackage $package 'MSI' -SilentArgs "$msiId /qb" -validExitCodes @(0) }

