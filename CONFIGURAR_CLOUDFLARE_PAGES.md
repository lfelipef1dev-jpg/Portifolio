# ✅ Configurar Cloudflare Pages - Passo a Passo

## 🎯 Seu repositório já está no GitHub!
**URL**: https://github.com/lfelipef1dev-jpg/Portifolio

---

## 📋 Passos para Publicar no Cloudflare Pages:

### 1️⃣ Acessar Cloudflare Dashboard
1. Acesse: https://dash.cloudflare.com
2. Faça login na sua conta

### 2️⃣ Criar Projeto no Pages
1. No menu lateral, clique em **"Workers & Pages"**
2. Clique em **"Create application"** ou na aba **"Pages"**
3. Clique em **"Connect to Git"**

### 3️⃣ Conectar com GitHub
1. Selecione **"GitHub"**
2. Autorize o Cloudflare a acessar seus repositórios
3. Procure e selecione o repositório **"Portifolio"**

### 4️⃣ Configurar Build
1. **Project name**: `portifolio` (ou outro nome que preferir)
2. **Production branch**: `main` ⚠️
3. **Build command**: **DEIXE VAZIO** (site estático, não precisa build)
4. **Build output directory**: **DEIXE VAZIO** ou `./` (raiz do projeto)
5. Clique em **"Save and Deploy"**

### 5️⃣ Aguardar Deploy
- O Cloudflare vai começar a fazer o deploy
- Aguarde 1-2 minutos
- Você verá o progresso na tela

### 6️⃣ Acessar seu Site! 🎉
- Após o deploy, você receberá uma URL tipo:
- `https://portifolio.pages.dev` (ou outro nome que você escolheu)
- Seu site estará **ONLINE**! 🌐

---

## ✅ Pronto!

Depois disso, sempre que você fizer `git push`, o Cloudflare Pages vai atualizar automaticamente em 30 segundos a 2 minutos!

---

## 🔄 Para Atualizar o Site no Futuro:

Sempre que mudar algo no código, execute:

```powershell
cd C:\Users\lfeli\Desktop\Portifolio
$env:Path += ";C:\Program Files\Git\cmd"

git add .
git commit -m "Descrição da mudança"
git push
```

O Cloudflare Pages atualiza automaticamente! 🚀

---

## 📊 Onde Ver Seu Site:

- **GitHub**: https://github.com/lfelipef1dev-jpg/Portifolio
- **Cloudflare Pages**: (você receberá a URL após configurar)
- **Cloudflare Dashboard**: Workers & Pages → Seu projeto

---

## 💡 Dica: Configurar Domínio Personalizado

1. No projeto Cloudflare Pages, clique em **"Custom domains"**
2. Clique em **"Set up a custom domain"**
3. Digite seu domínio (ex: `meusite.com.br`)
4. Siga as instruções para configurar DNS

---

## ⚙️ Configurações Importantes:

- ✅ Build command: **VAZIO** (importante!)
- ✅ Build output directory: **VAZIO** ou `./`
- ✅ Branch: `main`
- ✅ Framework preset: **None** ou **Plain HTML**

---

**Qualquer dúvida, consulte o arquivo `GUIA_DEPLOY.md`!**

