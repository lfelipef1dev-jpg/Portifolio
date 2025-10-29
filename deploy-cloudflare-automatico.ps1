# 🚀 Script Automatizado - Criar Projeto no Cloudflare Pages via API
# Execute: .\deploy-cloudflare-automatico.ps1

Write-Host "🚀 Criação Automática de Projeto no Cloudflare Pages" -ForegroundColor Cyan
Write-Host "===================================================" -ForegroundColor Cyan
Write-Host ""

# Configurar PATH do Git
$env:Path += ";C:\Program Files\Git\cmd"

# Configurações
$githubUser = "lfelipef1dev-jpg"
$repoName = "Portifolio"
$projectName = "portifolio"

Write-Host "📋 Configurações:" -ForegroundColor Yellow
Write-Host "   GitHub User: $githubUser" -ForegroundColor White
Write-Host "   Repositório: $repoName" -ForegroundColor White
Write-Host "   Nome do Projeto: $projectName" -ForegroundColor White
Write-Host ""

# Pedir API Token do Cloudflare
Write-Host "⚠️  Para automatizar, você precisa de um API Token do Cloudflare" -ForegroundColor Yellow
Write-Host ""
Write-Host "Como obter o token:" -ForegroundColor Cyan
Write-Host "1. Acesse: https://dash.cloudflare.com/profile/api-tokens" -ForegroundColor White
Write-Host "2. Clique em 'Create Token'" -ForegroundColor White
Write-Host "3. Use o template: 'Edit Cloudflare Workers'" -ForegroundColor White
Write-Host "4. Ou crie customizado com permissões:" -ForegroundColor White
Write-Host "   - Account: Cloudflare Pages:Edit" -ForegroundColor Gray
Write-Host "   - Zone: Workers Scripts:Edit (opcional)" -ForegroundColor Gray
Write-Host "5. Copie o token gerado" -ForegroundColor White
Write-Host ""

$apiToken = Read-Host "Cole seu Cloudflare API Token aqui (ou pressione Enter para fazer manualmente)"

if ([string]::IsNullOrWhiteSpace($apiToken)) {
    Write-Host ""
    Write-Host "❌ Token não fornecido. Fazendo manualmente..." -ForegroundColor Yellow
    Write-Host ""
    Write-Host "🌐 Abra no navegador:" -ForegroundColor Cyan
    Write-Host "https://dash.cloudflare.com/pages/new" -ForegroundColor White
    Write-Host ""
    Write-Host "Depois siga os passos do arquivo PASSO_A_PASSO_CLOUDFLARE.md" -ForegroundColor Yellow
    exit 0
}

Write-Host ""
Write-Host "🔍 Obtendo informações da conta..." -ForegroundColor Yellow

# Tentar obter Account ID automaticamente
try {
    $headers = @{
        "Authorization" = "Bearer $apiToken"
        "Content-Type" = "application/json"
    }
    
    # Obter lista de accounts
    $accountsResponse = Invoke-RestMethod -Uri "https://api.cloudflare.com/client/v4/accounts" -Method Get -Headers $headers
    
    if ($accountsResponse.success -and $accountsResponse.result.Count -gt 0) {
        $accountId = $accountsResponse.result[0].id
        Write-Host "✅ Account ID encontrado: $accountId" -ForegroundColor Green
    } else {
        Write-Host "❌ Não foi possível obter Account ID automaticamente" -ForegroundColor Red
        $accountId = Read-Host "Digite seu Cloudflare Account ID (encontre em: dash.cloudflare.com → direito inferior)"
    }
} catch {
    Write-Host "⚠️  Erro ao obter Account ID: $($_.Exception.Message)" -ForegroundColor Yellow
    $accountId = Read-Host "Digite seu Cloudflare Account ID manualmente"
}

Write-Host ""
Write-Host "🔧 Criando projeto no Cloudflare Pages..." -ForegroundColor Yellow

# Configuração do projeto
$body = @{
    name = $projectName
    production_branch = "main"
    build_config = @{
        build_command = ""
        destination_dir = ""
        root_dir = ""
    }
} | ConvertTo-Json -Depth 10

# Criar projeto via API do Cloudflare Pages
try {
    $createUrl = "https://api.cloudflare.com/client/v4/accounts/$accountId/pages/projects"
    
    $response = Invoke-RestMethod -Uri $createUrl -Method Post -Headers $headers -Body $body
    
    if ($response.success) {
        Write-Host ""
        Write-Host "✅ Projeto criado com sucesso!" -ForegroundColor Green
        Write-Host "   Nome: $($response.result.name)" -ForegroundColor White
        Write-Host ""
        
        # Agora conectar com Git
        Write-Host "🔗 Conectando com GitHub..." -ForegroundColor Yellow
        
        $gitBody = @{
            type = "github"
            repo = @{
                owner = $githubUser
                name = $repoName
            }
            production_branch = "main"
        } | ConvertTo-Json -Depth 10
        
        $connectUrl = "https://api.cloudflare.com/client/v4/accounts/$accountId/pages/projects/$projectName/deployments"
        
        # Nota: A conexão com Git pode requerer autorização manual via OAuth
        Write-Host ""
        Write-Host "⚠️  Para conectar com GitHub, você precisa:" -ForegroundColor Yellow
        Write-Host "1. Acessar: https://dash.cloudflare.com/pages/$projectName" -ForegroundColor White
        Write-Host "2. Clicar em 'Connect to Git'" -ForegroundColor White
        Write-Host "3. Autorizar o GitHub" -ForegroundColor White
        Write-Host "4. Selecionar o repositório: $repoName" -ForegroundColor White
        Write-Host ""
        
        Write-Host "🌐 Seu projeto está em:" -ForegroundColor Cyan
        Write-Host "https://dash.cloudflare.com/pages/$projectName" -ForegroundColor White
        
    } else {
        Write-Host ""
        Write-Host "❌ Erro ao criar projeto" -ForegroundColor Red
        Write-Host "Resposta: $($response | ConvertTo-Json)" -ForegroundColor Yellow
    }
    
} catch {
    Write-Host ""
    Write-Host "❌ Erro: $($_.Exception.Message)" -ForegroundColor Red
    
    if ($_.Exception.Response) {
        $reader = New-Object System.IO.StreamReader($_.Exception.Response.GetResponseStream())
        $responseBody = $reader.ReadToEnd()
        Write-Host "Detalhes: $responseBody" -ForegroundColor Yellow
    }
    
    Write-Host ""
    Write-Host "💡 Dica: A criação pode precisar ser feita manualmente via navegador" -ForegroundColor Cyan
    Write-Host "Acesse: https://dash.cloudflare.com/pages/new" -ForegroundColor White
}

Write-Host ""
Write-Host "✨ Script finalizado!" -ForegroundColor Cyan

