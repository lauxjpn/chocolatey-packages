Import-Module Chocolatey-AU

$releases = 'https://veusz.github.io/download/'

function global:au_BeforeUpdate { Get-RemoteFiles -NoSuffix -Purge }

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

    #veusz-3.0.1.1-windows-setup.exe
    $re  = "/veusz-(.+\d)-x64-windows-setup.exe"
    $versionre  = "download/.+/veusz-(.+\d)-x64-windows-setup.exe"
    $url = $download_page.links | Where-Object href -match $re | Select-Object -First 1 -expand href
    $url = $url -replace "\n"

    $version = ([regex]::Match($url,$versionre)).Captures.Groups[1].value

    return @{
        URL32 = $url
        Version = $version
        FileType = 'exe'
    }
}

function global:au_SearchReplace {
  return @{
    ".\tools\chocolateyInstall.ps1" = @{
      "(?i)(^\s*file\s*=\s*`"[$]toolsDir\\).*"   = "`${1}$($Latest.FileName32)`""
    }
    ".\legal\VERIFICATION.txt" = @{
      "(?i)(listed on\s*)\<.*\>" = "`${1}<$releases>"
      "(?i)(32-Bit.+)\<.*\>"     = "`${1}<$($Latest.URL32)>"
      "(?i)(checksum type:).*"   = "`${1} $($Latest.ChecksumType32)"
      "(?i)(checksum32:).*"      = "`${1} $($Latest.Checksum32)"
    }
  }
}

if ($MyInvocation.InvocationName -ne '.') {
  update -ChecksumFor None
}
