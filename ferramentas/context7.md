# Context7 — Docs sempre frescas para qualquer lib

> MCP server que busca documentação atualizada de qualquer biblioteca, framework, SDK, API, CLI ou serviço cloud — em vez de o agente confiar em dados de treino.
> Repositório: [upstash/context7](https://github.com/upstash/context7).

---

## Por que usar

LLMs têm cutoff de conhecimento. Quando o agente sugere `useEffect` com a sintaxe de 2022 e você está em React 19, isso quebra. Context7 resolve isso buscando docs reais ao vivo.

Use sempre que tocar em:
- Setup de bibliotecas/frameworks (React, Next.js, Prisma, Tailwind, Django, Spring)
- Migração entre versões (React 18 → 19, Next 13 → 14)
- API references específicas de versão
- Configuração de CLI tools
- Debugging de comportamento específico de uma lib

NÃO use para:
- Refatoração de código próprio
- Scripts do zero
- Debug de lógica de negócio
- Conceitos gerais de programação

---

## Como instalar

### No Claude Code

Adicionar ao seu `~/.claude/mcp_servers.json` (ou usar `claude mcp add`):

```json
{
  "context7": {
    "command": "npx",
    "args": ["-y", "@upstash/context7-mcp"]
  }
}
```

Reiniciar o Claude Code. O MCP fica disponível com 2 ferramentas:
- `resolve-library-id` — encontra o ID da lib
- `query-docs` — busca docs com a tua pergunta

### No Claude.ai (browser)

Configurações → Connectors → MCP servers → Add. Cole a configuração acima.

---

## Como o agente usa

Quando você tem o Context7 ligado e o `~/.claude/rules/context7.md` carregado, o agente faz isto automaticamente:

1. Você pergunta: "Como é que faço streaming com AI SDK 5?"
2. Agente chama `resolve-library-id("ai-sdk")` → encontra `vercel/ai-sdk@5`
3. Agente chama `query-docs("vercel/ai-sdk@5", "streaming chat completion")`
4. Agente responde com código baseado nas docs reais da v5, não na memória

Você não precisa pedir explicitamente. Se o `context7.md` está nas regras globais (`~/.claude/rules/`), o agente busca docs sempre que vê uma lib.

---

## Quando usar no método

| Fase | Caso de uso |
|------|-------------|
| **Fase 0** | "Decidi usar Astro 5. Quais as APIs novas vs Astro 4?" — agente busca docs reais |
| **Fase 1** | Setup de qualquer framework — agente nunca mais sugere passos obsoletos |
| **Fase 4** | Implementação — `query-docs` antes de cada feature nova com lib externa |
| **Fase 7** | Deploy — configuração de Vercel/Cloudflare/Netlify sempre actualizada |

---

## Regra recomendada (cole em `~/.claude/rules/context7.md`)

```markdown
When working with libraries, frameworks, or APIs — use Context7 MCP
to fetch current documentation instead of relying on training data.

## Steps

1. Call `resolve-library-id` with the library name and the user's question
2. Pick the best match — prefer exact names and version-specific IDs
3. Call `query-docs` with the selected library ID and the question
4. Answer using the fetched docs — include code examples and cite the version
```

Esta regra activa o Context7 automaticamente em qualquer projeto local.

---

## Crédito

Criado e mantido por [Upstash](https://upstash.com). MCP open source.
