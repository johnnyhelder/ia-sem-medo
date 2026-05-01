# Instalar Firecrawl no Claude Code

> Necessário **APENAS se** quiseres importar pesquisas externas (ex: relatórios do Gemini Deep Research) via link público que seja SPA pesado.
> Para a maioria dos casos, o `WebFetch` built-in do Claude Code é suficiente — não precisas instalar nada.

---

## Quando precisas de Firecrawl

| Cenário | Precisa Firecrawl? |
|---|---|
| Pesquisa A (Claude faz dentro do Claude Code) | ❌ Não — WebSearch built-in chega |
| Pesquisa B com Gemini, importas conteúdo colado | ❌ Não — Claude lê o texto direto |
| Pesquisa B com Gemini, importas via link público estático | ❌ Não — `WebFetch` resolve |
| Pesquisa B com Gemini, link é SPA / JS-pesado e WebFetch falha | ✅ Sim |
| Scraping regular de sites de concorrentes (Fase 5) | ✅ Sim, ajuda |

**Regra prática:** instala apenas se o `WebFetch` falhar.

---

## Pré-requisito: chave API gratuita

1. Vai a [firecrawl.dev](https://firecrawl.dev)
2. Cria conta (gratuita, basta email)
3. No dashboard, copia a tua **API key** (começa com `fc-`)

**Free tier:** 500 requests/mês. Mais que suficiente para importar 1-2 pesquisas por mês.

---

## Instalação no Claude Code (via MCP)

### Opção 1 — Via comando `claude mcp add` (recomendado)

No terminal, fora do Claude Code:

```bash
claude mcp add firecrawl npx -- -y firecrawl-mcp
```

Quando o Claude Code pedir a chave API, cola a tua `fc-xxxxxxxx`.

### Opção 2 — Via prompt mágico no Claude Code

Abre o Claude Code numa pasta qualquer e cola:

```
Instala o Firecrawl MCP para mim. 
A minha API key é: fc-xxxxxxxxxxxxxxxxx

Configura como MCP server stdio para que eu possa usar firecrawl_scrape, 
firecrawl_search e firecrawl_extract dentro do Claude Code.
```

(Substitui `fc-xxx...` pela tua chave real.)

### Opção 3 — Manual (se as anteriores falharem)

Edita `~/.claude/mcp_servers.json`:

```json
{
  "firecrawl": {
    "command": "npx",
    "args": ["-y", "firecrawl-mcp"],
    "env": {
      "FIRECRAWL_API_KEY": "fc-xxxxxxxxxxxxxxxxx"
    }
  }
}
```

Reinicia o Claude Code.

---

## Validar instalação

Dentro do Claude Code, pede:

```
Faz um scrape rápido de https://firecrawl.dev e mostra-me o título da página.
```

Se voltar com o título correto ("Firecrawl — Turn Websites into LLM-Ready Data" ou similar), está a funcionar.

---

## Custo real

| Plano | Preço | Requests | Útil para |
|---|---|---|---|
| Free | €0 | 500/mês | Importação ocasional, hobby |
| Hobby | $19/mês | 3000/mês | Uso regular |
| Standard | $99/mês | 100k/mês | Produção / agência |

Para o nosso caso (importar 1 pesquisa de Gemini de vez em quando), o **Free** chega.

---

## Alternativa: Playwright (se preferires evitar SaaS)

Se não quiseres usar serviços externos:

```bash
npm install -g playwright
npx playwright install chromium
```

Depois pede ao Claude Code:

```
Usa Playwright headless para abrir [URL], esperar 5s, extrair o texto 
visível e salvar em pesquisas/00-deep-research.md.
```

**Trade-off:**
- ✅ Zero custo, zero rate limits
- ❌ ~300MB de download
- ❌ Mais lento que Firecrawl (renderiza browser real)
- ❌ Requer Node + Chromium instalados

**Recomendação:** começa com Firecrawl free tier. Só migra para Playwright se ultrapassares 500 reqs/mês.

---

## Desinstalar Firecrawl

Se quiseres remover:

```bash
claude mcp remove firecrawl
```

Ou edita `~/.claude/mcp_servers.json` e remove a entrada `firecrawl`.

---

## Resolução de problemas

### "command not found: claude mcp"

Estás numa versão antiga do Claude Code. Atualiza para a versão mais recente.

### "API key invalid"

Verifica que copiaste a chave inteira (incluindo o prefixo `fc-`). Sem espaços antes/depois.

### "rate limit exceeded"

Atingiste o limite mensal do free tier. Espera o início do mês ou faz upgrade.

### Firecrawl falha em alguns sites específicos

Sites com proteção anti-bot agressiva (Cloudflare alto-nível) podem bloquear. Tenta:
- Adicionar `proxy: "stealth"` aos parâmetros do scrape
- Ou usar Playwright como fallback
