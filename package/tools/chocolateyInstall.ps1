$package = 'CrystalReports2010Runtime'

# SP 33
$params = @{
  packageName = $package;
  fileType = 'msi';
  silentArgs = '/quiet';
  url = 'https://origin-az.softwaredownloads.sap.com/public/file/0020000001649922022';
  url64bit = 'https://origin-az.softwaredownloads.sap.com/public/file/0020000001649962022';

  checksum = '1E45411FEAE93DD98DF95476CE8F74A0495D2C4057F5AD20061D1239223360AB';
  checksumType = 'sha256';
  checksum64 = 'DF193303F798D5800D7EEF23F40FDBDADC6E9DA6B34B010E7C2FA9AD396262DC';
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
