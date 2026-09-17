# TADaManager Build Script for Windows
[CmdletBinding()]
param (
    [ValidateSet("debug", "release")]
    [string]$BuildType = "debug",
    [switch]$Clean
)

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "       TADaManager Build Script         " -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan

# Check Java version
Write-Host "[1/3] Checking Java environment..." -ForegroundColor Yellow
$javaCmd = Get-Command java -ErrorAction SilentlyContinue
if (-not $javaCmd) {
    Write-Error "Java is not found in PATH. Please install JDK 17 or JDK 21."
    exit 1
}

# Check Android SDK
Write-Host "[2/3] Checking Android SDK..." -ForegroundColor Yellow
$androidSdk = $env:ANDROID_HOME
if (-not $androidSdk) {
    $androidSdk = $env:ANDROID_SDK_ROOT
}
if (-not $androidSdk -and (Test-Path "$env:LOCALAPPDATA\Android\Sdk")) {
    $androidSdk = "$env:LOCALAPPDATA\Android\Sdk"
    $env:ANDROID_HOME = $androidSdk
}

if ($androidSdk) {
    Write-Host "Android SDK located at: $androidSdk" -ForegroundColor Green
} else {
    Write-Warning "ANDROID_HOME is not set. Gradle may require Android SDK configured in local.properties."
}

# Build APK
Write-Host "[3/3] Running Gradle build ($BuildType)..." -ForegroundColor Yellow

$gradleTask = if ($BuildType -eq "release") { "assembleRelease" } else { "assembleDebug" }
$gradleArgs = @($gradleTask, "-PsignAsDebug", "--stacktrace")

if ($Clean) {
    $gradleArgs = @("clean") + $gradleArgs
}

& ".\gradlew.bat" @gradleArgs

if ($LASTEXITCODE -eq 0) {
    Write-Host "`nBuild succeeded!" -ForegroundColor Green
    $outputDir = "app\build\outputs\apk\$BuildType"
    if (Test-Path $outputDir) {
        $apks = Get-ChildItem -Path $outputDir -Filter "*.apk"
        Write-Host "Generated APK(s):" -ForegroundColor Cyan
        $apks | ForEach-Object { Write-Host "  -> $($_.FullName)" -ForegroundColor White }
    }
} else {
    Write-Error "`nBuild failed with exit code $LASTEXITCODE."
}
