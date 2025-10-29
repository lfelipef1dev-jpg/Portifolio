# 🚀 Configurar Projeto NOVO do Zero

## Após limpar Cloudflare e GitHub, siga estes passos:

---

## 📦 PASSO 1: Criar Repositório no GitHub

1. **Acesse**: https://github.com/new
2. **Preencha**:
   - **Repository name**: `Portifolio` (ou outro nome)
   - **Description**: "Meu portfólio profissional"
   - **Marque**: ✅ **Public** (importante para Cloudflare grátis)
   - **NÃO marque**: ❌ Add a README file
   - **NÃO marque**: ❌ Add .gitignore
   - **NÃO marque**: ❌ Choose a license
3. **Clique**: **"Create repository"**

---

## 📤 PASSO 2: Enviar Código para o GitHub

Execute no PowerShell:

```powershell
cd C:\Users\lfeli\Desktop\Portifolio
$env:Path += ";C:\Program Files\Git\cmd"

# Configurar remote (se ainda não tem)
git remote remove origin 2>$null
git remote add origin https://github.com/lfelipef1dev-jpg/NOME-DO-REPO.git

# Adicionar e commitar
git add .
git commit -m "Portfólio completo inicial"

# Enviar
git push -u origin main
```

**⚠️ Substitua `NOME-DO-REPO` pelo nome que você criou!**

---

## ☁️ PASSO 3: Criar Projeto no Cloudflare Pages

### Método Rápido:

1. **Acesse**: https://dash.cloudflare.com
2. **Menu lateral**: **"Workers & Pages"**
3. **Clique em**: **"Create application"** (botão azul/green)
4. **Escolha**: **"Pages"** (aba ou opção)
5. **Clique**: **"Connect to Git"** ou **"Importar um repositório"**
6. **Selecione**: **"GitHub"**
7. **Autorize** o Cloudflare (se pedir)
8. **Procure e selecione**: Seu repositório **"Portifolio"**

### Configurar Build:

- **Project name**: `portifolio` (ou outro nome)
- **Production branch**: `main` ✅
- **Framework preset**: **None** ou **Plain HTML**
- **Build command**: **[DEIXE VAZIO]** ⚠️
- **Build output directory**: **[DEIXE VAZIO]** ou `./` ⚠️

### Deploy:

9. **Clique**: **"Save and Deploy"**
10. **Aguarde**: 1-2 minutos
11. **Pronto!** Seu site estará em: `https://portifolio.pages.dev`

---

## ✅ TUDO PRONTO!

Depois disso:
- ✅ Código no GitHub
- ✅ Site online no Cloudflare
- ✅ Atualizações automáticas a cada `git push`

---

## 🔄 Para Atualizar no Futuro:

```powershell
git add .
git commit -m "Descrição da mudança"
git push
```

O Cloudflare atualiza automaticamente em 30s-2min! 🚀

