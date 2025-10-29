# Setup Completo do Portifolio
$env:Path += ";C:\Program Files\Git\cmd"
cd "C:\Users\lfeli\Desktop\Portifolio"

Write-Host "=== CONFIGURACAO AUTOMATICA ===" -ForegroundColor Cyan
Write-Host ""

# Verificar se tem remote
$remote = git remote -v 2>&1
if ($remote -notmatch "origin") {
    Write-Host "Criar repositorio no GitHub primeiro: https://github.com/new" -ForegroundColor Yellow
    $user = Read-Host "Usuario GitHub"
    $repo = Read-Host "Nome do repositorio"
    
    if ($user -and $repo) {
        git remote add origin "https://github.com/$user/$repo.git"
        Write-Host "Remote configurado!" -ForegroundColor Green
    }
}

# Adicionar e commitar
git add . 2>$null
git commit -m "Setup completo" 2>$null

# Push
Write-Host ""
Write-Host "Enviando para GitHub..." -ForegroundColor Yellow
git push -u origin main

Write-Host ""
Write-Host "Abrindo Cloudflare..." -ForegroundColor Cyan
Start-Process "https://dash.cloudflare.com/pages"

Write-Host ""
Write-Host "Configure o Cloudflare conectando com GitHub!" -ForegroundColor Green

