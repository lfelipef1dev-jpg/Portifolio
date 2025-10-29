# Script para atualizar o site no GitHub Pages
# Use: .\atualizar-site.ps1 "mensagem do commit"

param(
    [Parameter(Mandatory=$true)]
    [string]$Mensagem
)

Write-Host "🚀 Iniciando atualização do site..." -ForegroundColor Cyan

# Verificar se está em um repositório Git
if (-not (Test-Path .git)) {
    Write-Host "❌ Erro: Esta pasta não é um repositório Git!" -ForegroundColor Red
    Write-Host "Execute 'git init' primeiro." -ForegroundColor Yellow
    exit 1
}

# Verificar mudanças
Write-Host "`n📋 Verificando mudanças..." -ForegroundColor Yellow
git status

# Adicionar todas as mudanças
Write-Host "`n➕ Adicionando arquivos..." -ForegroundColor Yellow
git add .

# Fazer commit
Write-Host "`n💾 Fazendo commit: '$Mensagem'..." -ForegroundColor Yellow
git commit -m $Mensagem

if ($LASTEXITCODE -eq 0) {
    # Fazer push
    Write-Host "`n⬆️ Enviando para o GitHub..." -ForegroundColor Yellow
    git push
    
    if ($LASTEXITCODE -eq 0) {
        Write-Host "`n✅ Sucesso! Seu site será atualizado em alguns minutos." -ForegroundColor Green
        Write-Host "🌐 Acesse: https://seu-usuario.github.io/Portifolio/" -ForegroundColor Cyan
    } else {
        Write-Host "`n❌ Erro ao fazer push. Verifique sua conexão e credenciais." -ForegroundColor Red
    }
} else {
    Write-Host "`n❌ Erro ao fazer commit. Verifique se há mudanças para commitar." -ForegroundColor Red
}

