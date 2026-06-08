# Jupyter Notebook environment

py -3 -m venv test-vscode;
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass

.\test-vscode\Scripts\Activate.ps1
# Jupyter Notebook environment

pip install -r requirements.txt
# Jupyter Notebook environment

pip freeze > requirements1.txt

For note book
# Jupyter Notebook environment

pip install jupyter notebook

python -m ipykernel install --user --name=test-vscode --display-name "Python (test-vscode)"
(test-vscode) PS E:\v-repo-vscode\test-vscode> .\test-vscode\Scripts\jupyter-stop.ps1

# PowerShell script to stop Jupyter Notebook
Get-Process jupyter-notebook -ErrorAction SilentlyContinue | ForEach-Object { $_.Kill() }
Get-Process python -ErrorAction SilentlyContinue | ForEach-Object { $_.Kill() }
Write-Output "✅ Jupyter Notebook server stopped."

.\env-tools\jupyter-start.ps1
.\env-tools\jupyter-stop.ps1
