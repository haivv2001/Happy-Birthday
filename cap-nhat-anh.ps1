Set-Location $PSScriptRoot
$files = Get-ChildItem 'anh' -File | Where-Object { $_.Extension -match '^\.(jpe?g|png|webp|gif)$' } | Sort-Object Name
$lines = @('// Tu tao boi cap-nhat-anh.bat - dung sua tay', 'const PHOTOS = [')
foreach ($f in $files) { $lines += "  'anh/$($f.Name)'," }
$lines += '];'
[IO.File]::WriteAllText("$PSScriptRoot\photos.js", ($lines -join "`n") + "`n", (New-Object Text.UTF8Encoding $false))
Write-Host "Da cap nhat photos.js voi $($files.Count) anh"
