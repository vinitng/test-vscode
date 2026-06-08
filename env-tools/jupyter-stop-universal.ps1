# Detect project folder name
$projectName = Split-Path (Get-Location) -Leaf

# Kill Jupyter + Python processes
Get-Process jupyter-notebook -ErrorAction SilentlyContinue | ForEach-Object { $_.Kill() }
Get-Process python -ErrorAction SilentlyContinue | ForEach-Object { $_.Kill() }

Write-Output "Jupyter Notebook for project [$projectName] stopped."
