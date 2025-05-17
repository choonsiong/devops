# PowerShell script to continuously convert Markdown files to PDF using pandoc

while ($true) {
    # Get all .md files in the current directory
    Get-ChildItem -Filter *.md | ForEach-Object {
        $mdFile = $_.FullName
        $pdfFile = [System.IO.Path]::ChangeExtension($mdFile, ".pdf")
        # If the Markdown file is newer than the PDF or the PDF doesn't exist
        if (!(Test-Path $pdfFile) -or ((Get-Item $mdFile).LastWriteTime -gt (Get-Item $pdfFile).LastWriteTime)) {
            Write-Host $mdFile
            pandoc $mdFile -o $pdfFile
        }
    }
    # Wait for 1 second before checking again
    Start-Sleep -Seconds 1
}

while ($true) {
    Get-ChildItem -Filter *.md | ForEach-Object {
        $mdFile = $_
        $pdfFile = "$($mdFile.BaseName).pdf"

        if (-Not (Test-Path $pdfFile) -or (Get-Item $mdFile).LastWriteTime -gt (Get-Item $pdfFile).LastWriteTime) {
            Write-Output $mdFile
            pandoc $mdFile -o $pdfFile
        }
    }
    Start-Sleep -Seconds 1
}