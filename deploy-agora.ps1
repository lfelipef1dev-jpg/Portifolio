# Deploy Rápido - Execute e digite seu usuário do GitHub

$env:Path += ";C:\Program Files\Git\cmd"
cd "C:\Users\lfeli\Desktop\Portifolio"

Write-Host "=== DEPLOY AUTOMATICO ===" -ForegroundColor Cyan
Write-Host ""
$user = Read-Host "Digite seu usuario do GitHub (ex: luizfelipe)"
$repo = Read-Host "Nome do repositorio (Enter para 'Portifolio')"

if (!$repo) { $repo = "Portifolio" }

Write-Host ""
Write-Host "Configurando: github.com/$user/$repo" -ForegroundColor Yellow

git remote remove origin 2>$null
git remote add origin "https://github.com/$user/$repo.git"
git add .
git commit -m "Deploy inicial" 2>$null
git push -u origin main

Write-Host ""
Write-Host "PRONTO! Acesse: https://github.com/$user/$repo" -ForegroundColor Green

