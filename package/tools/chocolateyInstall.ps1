$package = 'CrystalReports2010Runtime'

$params = @{
  packageName = $package;
  fileType = 'msi';
  silentArgs = '/quiet';
  url = 'https://downloads.businessobjects.com/akdlm/crnetruntime/clickonce/CRRuntime_32bit_13_0_18.msi';
  url64bit = 'https://downloads.businessobjects.com/akdlm/crnetruntime/clickonce/CRRuntime_64bit_13_0_18.msi';

  checksum = '1B2C9CF1B3B7B2E2719DAEB0887537C82E1500C326F3BAE7C65CF216B7C3C6CD';
  checksumType = 'sha256';
  checksum64 = 'D74B614C5FCE4B01319F6CB612C490BBE7E7F964B6659A116C7864E2810F7802';
  checksumType64 = 'sha256';
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
