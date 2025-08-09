
#!/usr/bin/env pwsh

param(
    [string]$ConfigFile = "downloads.txt"
)

# Create All Lectures directory
$baseDir = "All Lectures"
if (-not (Test-Path $baseDir)) {
    New-Item -ItemType Directory -Path $baseDir -Force | Out-Null
}

# Check if config file exists
if (-not (Test-Path $ConfigFile)) {
    $sampleConfig = @"
# Format: URL|filename.mp4
https://example.com/stream1.m3u8|lecture1.mp4
https://example.com/stream2.m3u8|lecture2.mp4
https://example.com/stream3.m3u8|lecture3.mp4
"@
    $sampleConfig | Out-File -FilePath $ConfigFile -Encoding UTF8
    Write-Host "Created sample config file: $ConfigFile"
    Write-Host "Edit it with your URLs and run again."
    exit
}

# Read and process downloads
$downloads = Get-Content $ConfigFile | Where-Object { $_ -and !$_.StartsWith("#") }

foreach ($line in $downloads) {
    $parts = $line.Split("|")
    if ($parts.Length -lt 2) { continue }
    
    $url = $parts[0].Trim()
    $filename = $parts[1].Trim()
    
    # Sanitize filename (remove invalid characters)
    $invalidChars = [System.IO.Path]::GetInvalidFileNameChars()
    $safeFilename = $filename
    foreach ($char in $invalidChars) {
        $safeFilename = $safeFilename.Replace($char, '_')
    }
    # Also remove quotes
    $safeFilename = $safeFilename.Replace('"', '')
    $outputPath = Join-Path $baseDir $safeFilename
    
    # Create subfolder if needed
    $outputDir = Split-Path $outputPath -Parent
    if ($outputDir -and (-not (Test-Path $outputDir))) {
        New-Item -ItemType Directory -Path $outputDir -Force | Out-Null
    }
    
    Write-Host "Downloading: $safeFilename"
    
    # Run ffmpeg command
    & ffmpeg-progress-yield.exe -p "C:\tools\ffmpeg.exe" -i $url -codec copy $outputPath
}

Write-Host "Downloads completed in: $baseDir"
