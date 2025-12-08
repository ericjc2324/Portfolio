param([string]$PublicDir)
# Rewrite src-relative paths to public-relative paths in copied HTML files
Get-ChildItem -Path (Join-Path $PublicDir '*.html') | ForEach-Object {
  $content = Get-Content -Raw $_.FullName
  $content = $content.Replace('../styles/', 'styles/')
  $content = $content.Replace('../assets/images/', 'assets/images/')
  Set-Content -Path $_.FullName -Value $content
}
