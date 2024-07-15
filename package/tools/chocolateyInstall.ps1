$package = 'CrystalReports2010Runtime'

# SP 36
$params = @{
  packageName = $package;
  fileType = 'msi';
  silentArgs = '/quiet';
  url = 'https://origin.softwaredownloads.sap.com/public/file/0020000000638692024';
  url64bit = 'https://origin.softwaredownloads.sap.com/public/file/0020000000638682024';

  checksum = 'A78D7288E4C01C081FD200F148873DCAC1717435A9178BB104D6995BEEC56020';
  checksumType = 'sha256';
  checksum64 = '55DFD84FF0AFBBE20B4782BE3883093DC927F165E9335704367575420F8DC210';
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
