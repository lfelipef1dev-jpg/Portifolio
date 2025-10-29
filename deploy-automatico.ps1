# 🚀 Script Automatizado - Deploy do Portfólio para GitHub
# Execute: .\deploy-automatico.ps1

Write-Host "🚀 Script de Deploy Automatizado" -ForegroundColor Cyan
Write-Host "================================" -ForegroundColor Cyan
Write-Host ""

# Configurar PATH do Git
$env:Path += ";C:\Program Files\Git\cmd"

# Verificar se Git está instalado
try {
    $gitVersion = git --version 2>&1
    Write-Host "✅ Git encontrado: $gitVersion" -ForegroundColor Green
} catch {
    Write-Host "❌ Erro: Git não encontrado!" -ForegroundColor Red
    Write-Host "Instale o Git primeiro: https://git-scm.com/download/win" -ForegroundColor Yellow
    exit 1
}

# Navegar para a pasta do projeto
$projectPath = "C:\Users\lfeli\Desktop\Portifolio"
if (-not (Test-Path $projectPath)) {
    Write-Host "❌ Erro: Pasta do projeto não encontrada!" -ForegroundColor Red
    exit 1
}

Set-Location $projectPath
Write-Host "📁 Pasta do projeto: $projectPath" -ForegroundColor Yellow
Write-Host ""

# Verificar se é um repositório Git
if (-not (Test-Path .git)) {
    Write-Host "⚠️  Repositório Git não encontrado. Inicializando..." -ForegroundColor Yellow
    git init
    git branch -M main
}

# Verificar remote atual
$remoteExists = git remote -v 2>&1
if ($remoteExists -match "origin") {
    Write-Host "⚠️  Repositório remoto já configurado:" -ForegroundColor Yellow
    git remote -v
    Write-Host ""
    $manter = Read-Host "Deseja manter a configuração atual? (S/N)"
    if ($manter -eq "N" -or $manter -eq "n") {
        git remote remove origin
        $configurar = $true
    } else {
        $configurar = $false
    }
} else {
    $configurar = $true
}

# Configurar remote se necessário
if ($configurar) {
    Write-Host ""
    Write-Host "📝 Configuração do Repositório GitHub" -ForegroundColor Cyan
    Write-Host "====================================" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "Para encontrar seu usuário do GitHub:" -ForegroundColor Yellow
    Write-Host "1. Acesse: https://github.com" -ForegroundColor White
    Write-Host "2. Seu usuário aparece no canto superior direito" -ForegroundColor White
    Write-Host "3. Ou veja na URL: https://github.com/SEU-USUARIO" -ForegroundColor White
    Write-Host ""
    
    $githubUser = Read-Host "Digite seu usuário do GitHub"
    $repoName = Read-Host "Digite o nome do repositório (pressione Enter para 'Portifolio')"
    
    if ([string]::IsNullOrWhiteSpace($repoName)) {
        $repoName = "Portifolio"
    }
    
    $repoUrl = "https://github.com/$githubUser/$repoName.git"
    Write-Host ""
    Write-Host "🔗 URL do repositório: $repoUrl" -ForegroundColor Cyan
    Write-Host ""
    
    $confirmar = Read-Host "Confirma essa URL? (S/N)"
    if ($confirmar -ne "S" -and $confirmar -ne "s") {
        Write-Host "❌ Operação cancelada." -ForegroundColor Red
        exit 1
    }
    
    Write-Host ""
    Write-Host "➕ Adicionando repositório remoto..." -ForegroundColor Yellow
    try {
        git remote add origin $repoUrl
        Write-Host "✅ Repositório remoto configurado!" -ForegroundColor Green
    } catch {
        Write-Host "❌ Erro ao adicionar remote. Tentando remover e adicionar novamente..." -ForegroundColor Yellow
        git remote remove origin 2>$null
        git remote add origin $repoUrl
    }
}

# Verificar mudanças
Write-Host ""
Write-Host "📋 Verificando mudanças..." -ForegroundColor Yellow
git status

# Adicionar todas as mudanças
Write-Host ""
Write-Host "➕ Adicionando arquivos..." -ForegroundColor Yellow
git add .

# Verificar se há mudanças para commitar
$status = git status --porcelain
if ([string]::IsNullOrWhiteSpace($status)) {
    Write-Host "✅ Nenhuma mudança para commitar." -ForegroundColor Green
} else {
    Write-Host ""
    $commitMsg = Read-Host "Digite a mensagem do commit (ou pressione Enter para 'Atualização do portfólio')"
    if ([string]::IsNullOrWhiteSpace($commitMsg)) {
        $commitMsg = "Atualização do portfólio"
    }
    
    Write-Host ""
    Write-Host "💾 Fazendo commit: '$commitMsg'..." -ForegroundColor Yellow
    git commit -m $commitMsg
}

# Fazer push
Write-Host ""
Write-Host "⬆️  Enviando para o GitHub..." -ForegroundColor Yellow
Write-Host "⚠️  Você pode ser solicitado a fazer login no GitHub." -ForegroundColor Yellow
Write-Host ""

try {
    git push -u origin main
    
    if ($LASTEXITCODE -eq 0) {
        Write-Host ""
        Write-Host "✅ SUCESSO! Arquivos enviados para o GitHub!" -ForegroundColor Green
        Write-Host ""
        Write-Host "🌐 Próximos passos:" -ForegroundColor Cyan
        Write-Host "1. Acesse: https://github.com/$githubUser/$repoName" -ForegroundColor White
        Write-Host "2. Configure GitHub Pages ou Cloudflare Pages" -ForegroundColor White
        Write-Host "3. Veja o arquivo GUIA_DEPLOY.md para detalhes" -ForegroundColor White
        Write-Host ""
    } else {
        Write-Host ""
        Write-Host "❌ Erro ao fazer push. Verifique:" -ForegroundColor Red
        Write-Host "- Sua conexão com a internet" -ForegroundColor Yellow
        Write-Host "- Credenciais do GitHub (pode precisar gerar token)" -ForegroundColor Yellow
        Write-Host "- Se o repositório existe no GitHub" -ForegroundColor Yellow
        Write-Host ""
        Write-Host "💡 Dica: Se pedir autenticação, você pode precisar:" -ForegroundColor Cyan
        Write-Host "   - Gerar um Personal Access Token no GitHub" -ForegroundColor White
        Write-Host "   - Usar o token como senha ao fazer push" -ForegroundColor White
    }
} catch {
    Write-Host ""
    Write-Host "❌ Erro: $($_.Exception.Message)" -ForegroundColor Red
}

Write-Host ""
Write-Host "✨ Script finalizado!" -ForegroundColor Cyan

