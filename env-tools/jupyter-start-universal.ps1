# Detect project folder name
$projectName = Split-Path (Get-Location) -Leaf

# Candidate venv locations
$venvCandidates = @(
    ".\$projectName\Scripts\Activate.ps1",  # venv named after project
    ".\.venv\Scripts\Activate.ps1",         # .venv
    ".\venv\Scripts\Activate.ps1",          # venv
    ".\env\Scripts\Activate.ps1",           # env
    ".\Scripts\Activate.ps1"                # direct Scripts folder
)

# Find the first existing venv
$venvPath = $venvCandidates | Where-Object { Test-Path $_ } | Select-Object -First 1

if ($venvPath) {
    & $venvPath
    Write-Output "Starting Jupyter Notebook for project [$projectName]..."

    # Register kernel (only needed once per project)
    python -m ipykernel install --user --name=$projectName --display-name "Jupyter ($projectName)" | Out-Null

    # Launch notebook
    jupyter notebook
} else {
    Write-Output "No virtual environment found in $projectName. Checked: $($venvCandidates -join ', ')"
}
