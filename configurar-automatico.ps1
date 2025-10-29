# 🚀 Configuração Automática Completa
# Execute: .\configurar-automatico.ps1

Write-Host "🚀 Configuração Automática do Portfólio" -ForegroundColor Cyan
Write-Host "======================================" -ForegroundColor Cyan
Write-Host ""

$env:Path += ";C:\Program Files\Git\cmd"
cd "C:\Users\lfeli\Desktop\Portifolio"

Write-Host "📋 Status atual:" -ForegroundColor Yellow
git status
Write-Host ""

Write-Host "🔍 Verificando remote..." -ForegroundColor Yellow
$remote = git remote -v 2>&1
if ($remote -match "origin") {
    Write-Host "⚠️  Remote já configurado:" -ForegroundColor Yellow
    git remote -v
    Write-Host ""
    $manter = Read-Host "Deseja reconfigurar? (S/N)"
    if ($manter -eq "S" -or $manter -eq "s") {
        git remote remove origin
    } else {
        Write-Host "✅ Mantendo remote atual" -ForegroundColor Green
        exit 0
    }
}

Write-Host ""
Write-Host "📦 Configurar Conexão com GitHub" -ForegroundColor Cyan
Write-Host "================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "⚠️  IMPORTANTE: Crie o repositório no GitHub primeiro!" -ForegroundColor Yellow
Write-Host ""
Write-Host "1. Acesse: https://github.com/new" -ForegroundColor White
Write-Host "2. Crie um repositório com nome desejado (ex: Portifolio)" -ForegroundColor White
Write-Host "3. Marque como PUBLIC" -ForegroundColor White
Write-Host '4. NAO marque nenhuma opcao (README, .gitignore, license)' -ForegroundColor White
Write-Host "5. Clique 'Create repository'" -ForegroundColor White
Write-Host ""

$githubUser = Read-Host "Digite seu usuário do GitHub (ou Enter para 'lfelipef1dev-jpg')"
if ([string]::IsNullOrWhiteSpace($githubUser)) {
    $githubUser = "lfelipef1dev-jpg"
}

$repoName = Read-Host "Digite o nome do repositório que criou no GitHub"

if ([string]::IsNullOrWhiteSpace($repoName)) {
    Write-Host ""
    Write-Host "❌ Nome do repositório é obrigatório!" -ForegroundColor Red
    exit 1
}

$repoUrl = "https://github.com/$githubUser/$repoName.git"
Write-Host ""
Write-Host "🔗 URL: $repoUrl" -ForegroundColor Cyan
Write-Host ""

# Verificar se repositório existe
Write-Host "🔍 Verificando se repositório existe..." -ForegroundColor Yellow
$testConnection = git ls-remote $repoUrl 2>&1
if ($testConnection -match "fatal" -or $testConnection -match "not found") {
    Write-Host "⚠️  Repositório não encontrado ou não acessível" -ForegroundColor Yellow
    Write-Host "Verifique se:" -ForegroundColor Yellow
    Write-Host "- O repositório foi criado no GitHub" -ForegroundColor White
    Write-Host "- O nome está correto" -ForegroundColor White
    Write-Host "- O repositório é PUBLIC ou você tem acesso" -ForegroundColor White
    Write-Host ""
    $continuar = Read-Host "Deseja continuar mesmo assim? (S/N)"
    if ($continuar -ne "S" -and $continuar -ne "s") {
        exit 1
    }
} else {
    Write-Host "✅ Repositório encontrado!" -ForegroundColor Green
}

Write-Host ""
Write-Host "🔧 Configurando remote..." -ForegroundColor Yellow
git remote add origin $repoUrl
Write-Host "✅ Remote configurado!" -ForegroundColor Green

Write-Host ""
Write-Host "📤 Verificando mudanças pendentes..." -ForegroundColor Yellow
git add . 2>$null
$status = git status --porcelain
if ($status) {
    Write-Host "💾 Fazendo commit das mudanças..." -ForegroundColor Yellow
    git commit -m "Configuração inicial limpa do portfólio"
} else {
    Write-Host "✅ Nenhuma mudança para commitar" -ForegroundColor Green
}

Write-Host ""
Write-Host "⬆️  Enviando para o GitHub..." -ForegroundColor Yellow
Write-Host "⚠️  Você pode ser solicitado a fazer login/autorizar" -ForegroundColor Yellow
Write-Host ""

git push -u origin main

if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "✅ SUCESSO! Código enviado para o GitHub!" -ForegroundColor Green
    Write-Host ""
    Write-Host "🌐 Próximos passos:" -ForegroundColor Cyan
    Write-Host "1. Acesse: https://github.com/$githubUser/$repoName" -ForegroundColor White
    Write-Host "2. Configure Cloudflare Pages (veja CONFIGURAR_PROJETO_NOVO.md)" -ForegroundColor White
    Write-Host ""
    Write-Host "🔗 Abrir Cloudflare Pages..." -ForegroundColor Yellow
    Start-Sleep -Seconds 2
    Start-Process "https://dash.cloudflare.com/pages"
    Write-Host ""
    Write-Host "✨ Configure o Cloudflare conectando com o GitHub!" -ForegroundColor Green
} else {
    Write-Host ""
    Write-Host "❌ Erro ao fazer push" -ForegroundColor Red
    Write-Host "Possíveis causas:" -ForegroundColor Yellow
    Write-Host "- Repositório não existe no GitHub" -ForegroundColor White
    Write-Host "- Problema de autenticação" -ForegroundColor White
    Write-Host "- Repositório não é público e você não tem acesso" -ForegroundColor White
    Write-Host ""
    Write-Host "💡 Dica: Crie o repositório primeiro em: https://github.com/new" -ForegroundColor Cyan
}

Write-Host ""
Write-Host "Script finalizado!" -ForegroundColor Cyan

