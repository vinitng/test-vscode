# Detect project folder name
$projectName = Split-Path (Get-Location) -Leaf

# Kill Jupyter + Python processes quietly
Stop-Process -Name "jupyter-notebook" -Force -ErrorAction SilentlyContinue
Stop-Process -Name "python" -Force -ErrorAction SilentlyContinue

Write-Output "Jupyter Notebook for project [$projectName] stopped."
