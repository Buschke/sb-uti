# oh-my-posh init pwsh | Invoke-Expression
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/jandedobbeleer.omp.json" | Invoke-Expression
Set-Alias -Name ll -Value ls
Set-Alias -Name g -Value git

# conda activate svenAI
fnm env --use-on-cd | Out-String | Invoke-Expression
C:\Users\sven\.virtualenvs\svenAIvenv\Scripts\Activate.ps1
Set-Alias -Name trash -Value Remove-ItemSafely

# Start the ssh-agent service
Start-Service ssh-agent

# Add your SSH keys to the agent
ssh-add C:\Users\sven\.ssh\id_ed25519

function dc { Set-Location ~\Documents\myDev\DailyChallenge }

function flc {
    param (
        [Parameter(ValueFromRemainingArguments=$true)] $args
    )
    flutter create -e --org com.buschke --description "A new Flutter project by SvenSoft & BuscByte Innovation Forge"  @args
}

function flcs {
    param (
        [Parameter(Mandatory=$true)] [string] $sample_name,
        [Parameter(Mandatory=$true)] [string] $project_name
    )
    flutter create --sample $sample_name --org com.buschke --description "A new Flutter project by SvenSoft & BuscByte Innovation Forge" $project_name
}
