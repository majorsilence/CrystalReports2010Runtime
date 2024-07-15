$package = 'CrystalReports2010Runtime'

# SP 35
$params = @{
  packageName = $package;
  fileType = 'msi';
  silentArgs = '/quiet';
  url = 'https://origin.softwaredownloads.sap.com/public/file/0020000001518522023';
  url64bit = 'https://origin.softwaredownloads.sap.com/public/file/0020000001518472023';

  checksum = 'D5510E9F05081173D4C9AAF7E165D07C8D886DDAB1D1E410F00D32D4D1C3B881';
  checksumType = 'sha256';
  checksum64 = 'BAFE7A1006EDDA93075B479C1CF1C0CDFB617874146364ED9444FD2FBF190912';
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
