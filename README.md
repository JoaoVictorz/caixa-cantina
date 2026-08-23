# Caixa da Cantina

App de controle de vendas, gastos e retorno da cantina, com dados salvos no Supabase.

## 1. Configurar o Supabase

1. Crie uma conta em https://supabase.com e clique em **New Project**
2. Depois que o projeto for criado, vá em **SQL Editor** (menu lateral) → **New query**
3. Cole todo o conteúdo do arquivo `supabase.sql` e clique em **Run**
4. Vá em **Project Settings** → **API**
5. Copie a **Project URL** e a chave **anon public**

## 2. Configurar o index.html

Abra o arquivo `index.html` e substitua estas duas linhas com os valores copiados do Supabase:

```js
const SUPABASE_URL = 'COLE_AQUI_SUA_SUPABASE_URL';
const SUPABASE_ANON_KEY = 'COLE_AQUI_SUA_SUPABASE_ANON_KEY';
```

## 3. Subir no GitHub

```bash
git init
git add .
git commit -m "primeiro commit - caixa da cantina"
git branch -M main
git remote add origin https://github.com/SEU-USUARIO/caixa-cantina.git
git push -u origin main
```

(Crie o repositório vazio em https://github.com/new antes de rodar o `git remote add`.)

## 4. Publicar no Vercel

1. Crie uma conta em https://vercel.com (dá pra entrar direto com o GitHub)
2. Clique em **Add New → Project**
3. Selecione o repositório `caixa-cantina`
4. Em "Framework Preset" deixe como **Other** — não precisa de build command nem output directory
5. Clique em **Deploy**

Pronto — a Vercel gera um link tipo `caixa-cantina.vercel.app`. É esse link que você abre no Safari do iPhone e usa "Adicionar à Tela de Início".

## Aviso de segurança

Como o app não tem login, qualquer pessoa que tiver o link consegue ver e editar os dados (por causa da policy "allow all" no Supabase). Para uso pessoal isso normalmente é aceitável, mas não compartilhe o link publicamente. Se quiser, posso te ajudar depois a adicionar uma tela de senha simples.
