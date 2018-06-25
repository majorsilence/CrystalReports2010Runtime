$package = 'CrystalReports2010Runtime'

$params = @{
  packageName = $package;
  fileType = 'msi';
  silentArgs = '/quiet';
  url = 'https://downloads.businessobjects.com/akdlm/crnetruntime/clickonce/CRRuntime_32bit_13_0_22.msi';
  url64bit = 'https://downloads.businessobjects.com/akdlm/crnetruntime/clickonce/CRRuntime_64bit_13_0_22.msi';

  checksum = '48AFFA324E1C95D2140C39818E3DFDDE581D7DD1D98F97AA3F13B957D800FCD9';
  checksumType = 'sha256';
  checksum64 = '4988ED1E3B1672A6C785F54A5CF8246DE97FAC4A058F5C9EB6E97213BB78723D';
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
