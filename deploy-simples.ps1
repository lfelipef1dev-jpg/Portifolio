# 🚀 Script Simples - Deploy para GitHub
# Uso: .\deploy-simples.ps1 "seu-usuario-github"

param(
    [Parameter(Mandatory=$true)]
    [string]$GitHubUser,
    
    [Parameter(Mandatory=$false)]
    [string]$RepoName = "Portifolio"
)

Write-Host "🚀 Deploy Automatizado do Portfólio" -ForegroundColor Cyan
Write-Host "===================================" -ForegroundColor Cyan
Write-Host ""

# Configurar PATH do Git
$env:Path += ";C:\Program Files\Git\cmd"

# Navegar para a pasta
Set-Location "C:\Users\lfeli\Desktop\Portifolio"

# URL do repositório
$repoUrl = "https://github.com/$GitHubUser/$RepoName.git"

Write-Host "👤 Usuário GitHub: $GitHubUser" -ForegroundColor Yellow
Write-Host "📦 Repositório: $RepoName" -ForegroundColor Yellow
Write-Host "🔗 URL: $repoUrl" -ForegroundColor Yellow
Write-Host ""

# Remover remote se existir
Write-Host "🔧 Configurando repositório remoto..." -ForegroundColor Yellow
$existingRemote = git remote get-url origin 2>$null
if ($existingRemote) {
    Write-Host "   Removendo remote anterior..." -ForegroundColor Gray
    git remote remove origin
}
git remote add origin $repoUrl
Write-Host "✅ Remote configurado!" -ForegroundColor Green
Write-Host ""

# Verificar e adicionar mudanças
Write-Host "📋 Verificando mudanças..." -ForegroundColor Yellow
git add .

$status = git status --porcelain
if (-not [string]::IsNullOrWhiteSpace($status)) {
    Write-Host "💾 Fazendo commit..." -ForegroundColor Yellow
    git commit -m "Atualização do portfólio"
}

# Fazer push
Write-Host ""
Write-Host "⬆️  Enviando para o GitHub..." -ForegroundColor Yellow
Write-Host "⚠️  Você pode ser solicitado a fazer login/autorizar" -ForegroundColor Yellow
Write-Host ""

git push -u origin main

if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "✅ SUCESSO! Portfólio enviado para o GitHub!" -ForegroundColor Green
    Write-Host ""
    Write-Host "🎉 Próximos passos:" -ForegroundColor Cyan
    Write-Host "1. Acesse: https://github.com/$GitHubUser/$RepoName" -ForegroundColor White
    Write-Host "2. Configure Cloudflare Pages ou GitHub Pages" -ForegroundColor White
    Write-Host ""
} else {
    Write-Host ""
    Write-Host "❌ Erro ao fazer push." -ForegroundColor Red
    Write-Host "Verifique suas credenciais do GitHub." -ForegroundColor Yellow
}

