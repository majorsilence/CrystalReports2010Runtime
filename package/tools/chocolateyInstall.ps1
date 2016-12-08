$package = 'CrystalReports2010Runtime'

$params = @{
  packageName = $package;
  fileType = 'msi';
  silentArgs = '/quiet';
  url = 'https://downloads.businessobjects.com/akdlm/crnetruntime/clickonce/CRRuntime_32bit_13_0_18.msi';
  url64bit = 'https://downloads.businessobjects.com/akdlm/crnetruntime/clickonce/CRRuntime_64bit_13_0_18.msi';
}

Install-ChocolateyPackage @params

# http://forums.iis.net/p/1174672/1968094.aspx
# it turns out that even on x64, x86 clr types should also be installed
# or SMO breaks
$IsSytem32Bit = (($Env:PROCESSOR_ARCHITECTURE -eq 'x86') -and `
  ($Env:PROCESSOR_ARCHITEW6432 -eq $null))
if (!$IsSytem32Bit)
{
  $params.url64bit = $params.url  
}
Install-ChocolateyPackage @params
