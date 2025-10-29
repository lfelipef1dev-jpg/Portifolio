# 🚀 Abrir Cloudflare Pages automaticamente
# Execute: .\abrir-cloudflare.ps1

Write-Host "🚀 Abrindo Cloudflare Pages..." -ForegroundColor Cyan
Write-Host ""

# Abrir o link direto para criar projeto
$url = "https://dash.cloudflare.com/pages/new"

Write-Host "🌐 Abrindo no navegador: $url" -ForegroundColor Yellow
Start-Process $url

Write-Host ""
Write-Host "✅ Navegador aberto!" -ForegroundColor Green
Write-Host ""
Write-Host "📋 PRÓXIMOS PASSOS:" -ForegroundColor Cyan
Write-Host ""
Write-Host "1. Clique em 'Connect to Git'" -ForegroundColor White
Write-Host "2. Selecione 'GitHub'" -ForegroundColor White
Write-Host "3. Autorize o Cloudflare (se pedir)" -ForegroundColor White
Write-Host "4. Selecione o repositório: Portifolio" -ForegroundColor White
Write-Host "5. Configure:" -ForegroundColor White
Write-Host "   - Project name: portifolio" -ForegroundColor Gray
Write-Host "   - Production branch: main" -ForegroundColor Gray
Write-Host "   - Build command: [DEIXE VAZIO]" -ForegroundColor Gray
Write-Host "   - Build output: [DEIXE VAZIO]" -ForegroundColor Gray
Write-Host "6. Clique 'Save and Deploy'" -ForegroundColor White
Write-Host ""
Write-Host "✨ Pronto! Aguarde 1-2 minutos e seu site estará online!" -ForegroundColor Green
Write-Host ""

