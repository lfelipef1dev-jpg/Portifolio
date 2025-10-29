# 🧹 Script para Limpar e Preparar Projeto do Zero
# Execute: .\limpar-e-preparar.ps1

Write-Host "🧹 Limpando e Preparando Projeto do Zero" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

$env:Path += ";C:\Program Files\Git\cmd"
cd "C:\Users\lfeli\Desktop\Portifolio"

Write-Host "📋 Status atual:" -ForegroundColor Yellow
git remote -v
Write-Host ""

$opcao = Read-Host "O que deseja fazer? (1) Remover remote do Git, (2) Ver status, (3) Nada - apenas verificar"

switch ($opcao) {
    "1" {
        Write-Host ""
        Write-Host "🗑️  Removendo remote..." -ForegroundColor Yellow
        git remote remove origin 2>$null
        Write-Host "✅ Remote removido!" -ForegroundColor Green
        Write-Host ""
        Write-Host "Agora você pode:" -ForegroundColor Cyan
        Write-Host "1. Criar um repositório NOVO no GitHub" -ForegroundColor White
        Write-Host "2. Configurar o remote novamente com: git remote add origin https://github.com/lfelipef1dev-jpg/NOVO-REPO.git" -ForegroundColor White
        Write-Host "3. Fazer push: git push -u origin main" -ForegroundColor White
    }
    "2" {
        Write-Host ""
        Write-Host "📊 Status do repositório:" -ForegroundColor Yellow
        git status
        Write-Host ""
        git remote -v
    }
    "3" {
        Write-Host ""
        Write-Host "✅ Nada foi alterado." -ForegroundColor Green
    }
    default {
        Write-Host ""
        Write-Host "⚠️  Opção inválida" -ForegroundColor Yellow
    }
}

Write-Host ""
Write-Host "📚 Guias criados:" -ForegroundColor Cyan
Write-Host "- LIMPAR_TUDO.md (como limpar Cloudflare e GitHub)" -ForegroundColor White
Write-Host "- CONFIGURAR_PROJETO_NOVO.md (como configurar do zero)" -ForegroundColor White
Write-Host ""
Write-Host "🌐 Links importantes:" -ForegroundColor Cyan
Write-Host "- Cloudflare Pages: https://dash.cloudflare.com/pages" -ForegroundColor White
Write-Host "- GitHub Repositórios: https://github.com/lfelipef1dev-jpg?tab=repositories" -ForegroundColor White
Write-Host "- Criar Repositório: https://github.com/new" -ForegroundColor White
Write-Host ""

