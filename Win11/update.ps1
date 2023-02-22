Write-Host "`r`nUpdating System"
Write-Host "===============`r`n"
# Write-Host "`r`nUpdating with scoop:"
# Write-Host "--------------------`r`n"
# scoop update *
# scoop cleanup *
# scoop cache show
# scoop cache rm *
# scoop cache show
Write-Host "`r`nUpdating with winget upgrade --all"
Write-Host "--------------------`r`n"
winget upgrade --all

Write-Host "`r`nUpdating conda:"
Write-Host "---------------`r`n"
conda update conda --yes
conda update --all --yes
conda activate py39
conda update --all --yes
conda deactivate
conda activate svenAI
conda update --all --yes
conda deactivate
conda clean -a --yes
conda activate py39

Write-Host "`r`nUpdating pip:"
Write-Host "---------------`r`n"
Write-Host "`nUpdating py39env`n"
pushd $venv
py39venv\Scripts\activate
Write-Host "pip list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1 | xargs -n1 pip install -U"
pip list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1 | xargs -n1 pip install -U
pip cache purge
deactivate
Write-Host "`nUpdating svenAIenv"
svenAIvenv\Scripts\activate
Write-Host "pip list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1 | xargs -n1 pip install -U"
pip list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1 | xargs -n1 pip install -U
pip cache purge
deactivate
py39venv\Scripts\activate
popd

Write-Host "`r`nUpdate node:"
Write-Host "------------`r`n"
pnpm add -g pnpm
pnpm update -g
nvm list available
nvm list