# 🚀 Script Interativo - Deploy para GitHub
# Execute: .\deploy-interativo.ps1

Write-Host "🚀 Deploy do Portfólio para GitHub" -ForegroundColor Cyan
Write-Host "===================================" -ForegroundColor Cyan
Write-Host ""

# Configurar PATH
$env:Path += ";C:\Program Files\Git\cmd"
Set-Location "C:\Users\lfeli\Desktop\Portifolio"

# Pedir usuário do GitHub
Write-Host "Para encontrar seu usuário:" -ForegroundColor Yellow
Write-Host "- Acesse https://github.com" -ForegroundColor White
Write-Host "- Seu usuário está no canto superior direito" -ForegroundColor White
Write-Host "- Ou na URL: https://github.com/SEU-USUARIO" -ForegroundColor White
Write-Host ""

$githubUser = Read-Host "Digite seu usuário do GitHub"
$repoName = Read-Host "Digite o nome do repositório (Enter para 'Portifolio')"

if ([string]::IsNullOrWhiteSpace($repoName)) {
    $repoName = "Portifolio"
}

Write-Host ""
Write-Host "Configurando para: https://github.com/$githubUser/$repoName" -ForegroundColor Cyan
Write-Host ""

# Remover remote anterior se existir
git remote remove origin 2>$null

# Adicionar novo remote
git remote add origin "https://github.com/$githubUser/$repoName.git"

# Adicionar e commitar mudanças
Write-Host "Adicionando arquivos..." -ForegroundColor Yellow
git add .

$hasChanges = git status --porcelain
if ($hasChanges) {
    git commit -m "Atualização automática"
}

# Push
Write-Host ""
Write-Host "Enviando para o GitHub..." -ForegroundColor Yellow
git push -u origin main

if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "✅ SUCESSO! Portfólio no GitHub!" -ForegroundColor Green
    Write-Host "🌐 URL: https://github.com/$githubUser/$repoName" -ForegroundColor Cyan
} else {
    Write-Host ""
    Write-Host "❌ Erro. Verifique suas credenciais do GitHub." -ForegroundColor Red
}

