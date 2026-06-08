# Detect project folder name
$projectName = Split-Path (Get-Location) -Leaf

# Path to venv activation script (venv folder = project name)
$venvPath = ".\$projectName\Scripts\Activate.ps1"

if (Test-Path $venvPath) {
    & $venvPath
    Write-Output "Starting Jupyter Notebook for project [$projectName]..."

    # Register kernel (only needed once per project)
    python -m ipykernel install --user --name=$projectName --display-name "Jupyter ($projectName)" | Out-Null

    # Launch notebook
    jupyter notebook
} else {
    Write-Output "No virtual environment found in $projectName. Expected $projectName\Scripts\Activate.ps1"
}
