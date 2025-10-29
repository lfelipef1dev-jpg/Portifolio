# 🚀 Abrir Cloudflare Pages - URL Correta
# Execute: .\abrir-cloudflare-correto.ps1

Write-Host "🚀 Abrindo Cloudflare Pages..." -ForegroundColor Cyan
Write-Host ""

# URL alternativa - ir direto para a lista de Pages
$url = "https://dash.cloudflare.com/pages"

Write-Host "🌐 Abrindo: $url" -ForegroundColor Yellow
Start-Process $url

Write-Host ""
Write-Host "✅ Navegador aberto!" -ForegroundColor Green
Write-Host ""
Write-Host "📋 PRÓXIMOS PASSOS:" -ForegroundColor Cyan
Write-Host ""
Write-Host "1. Na página do Cloudflare, procure por 'Create a project' ou botão '+' " -ForegroundColor White
Write-Host "2. OU clique em 'Workers & Pages' no menu lateral esquerdo" -ForegroundColor White
Write-Host "3. Depois clique em 'Create' ou 'Connect to Git'" -ForegroundColor White
Write-Host "4. Selecione 'GitHub'" -ForegroundColor White
Write-Host "5. Autorize (se pedir)" -ForegroundColor White
Write-Host "6. Selecione o repositório: Portifolio" -ForegroundColor White
Write-Host "7. Configure:" -ForegroundColor White
Write-Host "   - Project name: portifolio" -ForegroundColor Gray
Write-Host "   - Production branch: main" -ForegroundColor Gray
Write-Host "   - Build command: [DEIXE VAZIO]" -ForegroundColor Gray
Write-Host "   - Build output: [DEIXE VAZIO]" -ForegroundColor Gray
Write-Host "8. Clique 'Save and Deploy'" -ForegroundColor White
Write-Host ""
Write-Host "✨ Pronto! Em 1-2 minutos seu site estará online!" -ForegroundColor Green
Write-Host ""

