# 📋 Passo a Passo - Criar Projeto no Cloudflare Pages

## 🎯 Você precisa criar o projeto "Portifolio" no Cloudflare!

---

## ✅ PASSO 1: Criar Aplicação

1. No Cloudflare Dashboard, você vê o botão azul **"+ Create application"**
2. **CLIQUE NELE!**

---

## ✅ PASSO 2: Escolher Pages

1. Você verá opções como "Workers", "Pages", etc.
2. **Selecione "Pages"** ou procure por "Pages Projects"
3. Ou clique em **"Create"** → **"Pages"** → **"Connect to Git"**

---

## ✅ PASSO 3: Conectar ao GitHub

1. Clique em **"Connect to Git"**
2. Selecione **"GitHub"**
3. Se for a primeira vez, você precisará autorizar o Cloudflare:
   - Será redirecionado para o GitHub
   - Clique em **"Authorize Cloudflare"**
   - Ou **"Authorize Cloudflare Pages"**
4. Volte para o Cloudflare

---

## ✅ PASSO 4: Selecionar Repositório

1. Agora você verá uma lista dos seus repositórios GitHub
2. **Procure e selecione**: `Portifolio`
   - Nome: `lfelipef1dev-jpg/Portifolio`
3. Clique no repositório para selecionar

---

## ✅ PASSO 5: Configurar Projeto

1. **Project name**: 
   - Pode usar: `portifolio` ou `portfolio-felipe` (escolha um nome)
   
2. **Production branch**: 
   - Selecione: **`main`** ⚠️ IMPORTANTE!

3. **Framework preset**: 
   - Selecione: **"None"** ou **"Plain HTML"** ou **"Static"**

4. **Build command**: 
   - **DEIXE TOTALMENTE VAZIO** ⚠️ (site estático não precisa build)

5. **Build output directory**: 
   - **DEIXE VAZIO** ou digite `./` (ponto barra)

6. Clique em **"Save and Deploy"**

---

## ✅ PASSO 6: Aguardar Deploy

1. Você verá uma tela de progresso
2. Aguarde 1-2 minutos
3. O deploy vai acontecer automaticamente

---

## ✅ PASSO 7: Ver seu Site!

1. Após o deploy, você verá:
   - Status: **"Published"** (Publicado)
   - Uma URL tipo: `https://portifolio.pages.dev` (ou outro nome)
   
2. **CLIQUE NA URL** para ver seu site online! 🎉

---

## 📌 IMPORTANTE:

Se você NÃO ver a opção "Connect to Git":

1. Tente ir direto em: **Workers & Pages** (menu lateral)
2. Ou acesse: https://dash.cloudflare.com/pages
3. Clique em **"Create a project"**

---

## 🔍 Se o Repositório Não Aparecer:

1. Verifique se você autorizou o Cloudflare no GitHub
2. Verifique se o repositório está como **"Public"** no GitHub
3. Tente desconectar e reconectar o GitHub no Cloudflare

---

**Qualquer problema, me avise!**

