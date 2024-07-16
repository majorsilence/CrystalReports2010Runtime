$package = 'CrystalReports2010Runtime'

$url32 = 'https://origin.softwaredownloads.sap.com/public/file/0020000000638692024'
$url64 = 'https://origin.softwaredownloads.sap.com/public/file/0020000000638682024'
$fileName32 = 'CR13SP36MSI32_0-80007712.msi'
$fileName64 = 'CR13SP36MSI64_0-80007712.msi'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$filePath32 = Join-Path $toolsDir $fileName32
$filePath64 = Join-Path $toolsDir $fileName64

# Download and install the 32-bit version
$packageArgs32 = @{
    packageName    = $package
    fileType       = 'msi'
    url            = $url32
    file           = $filePath32
    checksum       = 'A78D7288E4C01C081FD200F148873DCAC1717435A9178BB104D6995BEEC56020'
    checksumType   = 'sha256' 
    silentArgs     = '/quiet /norestart'
    validExitCodes = @(0, 3010, 1641)
}

Get-ChocolateyWebFile @packageArgs32
Install-ChocolateyInstallPackage @packageArgs32

# Download and install the 64-bit version
$packageArgs64 = @{
    packageName    = $package
    fileType       = 'msi'
    url            = $url64
    file           = $filePath64
    checksum       = '55DFD84FF0AFBBE20B4782BE3883093DC927F165E9335704367575420F8DC210'  
    checksumType   = 'sha256'  
    silentArgs     = '/quiet /norestart'
    validExitCodes = @(0, 3010, 1641)
}

Get-ChocolateyWebFile @packageArgs64
Install-ChocolateyInstallPackage @packageArgs64

