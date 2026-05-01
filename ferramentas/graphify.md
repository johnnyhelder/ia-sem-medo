# Graphify — Mapeie qualquer corpus em grafo navegável

> Skill que transforma uma pasta de ficheiros (código, docs, papers, imagens, vídeos) num grafo de conhecimento navegável com detecção de comunidades e auditoria honesta.
> Repositório oficial: [safishamsi/graphify](https://github.com/safishamsi/graphify)
> Inspirada na workflow `/raw` folder do Karpathy.

---

## O que faz

Três coisas que o Claude sozinho não consegue:

1. **Grafo persistente** — relacionamentos guardados em `graphify-out/graph.json` e sobrevivem entre sessões. Faça perguntas semanas depois sem reler tudo.
2. **Auditoria honesta** — cada aresta tem tag `EXTRACTED`, `INFERRED` ou `AMBIGUOUS`. Você sabe o que foi encontrado vs inventado.
3. **Surpresa cross-document** — detecção de comunidades encontra ligações entre conceitos em ficheiros diferentes que você nunca pensaria perguntar.

---

## Quando usar no método

| Fase | Caso de uso |
|------|-------------|
| **Fase 0** (Pesquisa) | Você tem uma pasta `/raw` com transcrições, papers, screenshots, tweets. Roda `/graphify` para descobrir o que está conectado antes de começar a escrever |
| **Fase 1** (Setup) | Você está a herdar um codebase. Roda `/graphify .` para mapear arquitetura ANTES de tocar em qualquer coisa |
| **Fase 5** (Otimização) | Você quer ver god-nodes (funções com muitas dependências) e candidatos a refatoração baseados em estrutura real do grafo |

---

## Como instalar

Graphify é uma skill Python distribuída no [GitHub](https://github.com/safishamsi/graphify). A skill auto-instala na primeira execução:

```bash
# 1. Adicionar a skill ao Claude Code (uma vez)
mkdir -p ~/.claude/skills/graphify
curl -L https://raw.githubusercontent.com/safishamsi/graphify/main/SKILL.md \
  -o ~/.claude/skills/graphify/SKILL.md

# 2. No Claude Code, na pasta do projeto, executar:
/graphify
```

A skill detecta a interpretação Python correta (`uv tool`, `pipx`, `venv`, sistema), instala o pacote `graphifyy` se necessário e prossegue.

---

## Comandos principais

```
/graphify                  # pipeline completo na pasta atual
/graphify <path>           # pipeline numa pasta específica
/graphify <path> --update  # incremental — só re-extrai ficheiros novos/alterados
/graphify <path> --watch   # observa pasta, auto-rebuild em mudanças de código
/graphify query "<pergunta>"        # BFS — contexto largo
/graphify path "AuthModule" "DB"    # caminho mais curto entre dois conceitos
/graphify explain "TokenValidator"  # explicação de um nó
/graphify add <url>        # busca URL, salva em ./raw, atualiza grafo
```

---

## Outputs

Após rodar `/graphify .`, a pasta `graphify-out/` contém:

- `graph.html` — grafo interativo, abrir no browser, sem servidor
- `graph.json` — dados em formato GraphRAG-ready
- `GRAPH_REPORT.md` — relatório com god-nodes, comunidades, ligações surpreendentes, perguntas sugeridas

Para corpus grande (>5000 palavras), também gera benchmark de redução de tokens.

---

## Honestidade do método

Cada aresta no grafo tem tag de confiança:

- `EXTRACTED` — relação explícita na fonte (import, citação, "ver §3.2")
- `INFERRED` — inferência razoável (estrutura partilhada, dependência implícita)
- `AMBIGUOUS` — incerto, marcado para revisão

Isto evita o problema clássico de grafos automáticos: tudo parece igual e você não sabe o que confiar.

---

## Exemplo no contexto deste método

Se você herdou um projeto Next.js de outra pessoa:

```bash
cd projeto-herdado
claude   # abre Claude Code
> /graphify .
```

Após ~5-10 minutos (depende do tamanho), você tem:
- Mapa visual de qual ficheiro depende de qual
- Lista de god-nodes (candidatos óbvios para refatoração)
- Comunidades detectadas (módulos lógicos)
- Perguntas sugeridas como "Como o auth conecta ao admin panel?"

É a Fase 0 retroativa — pesquisa antes de tocar.

---

## Crédito

Criada por **Safi Shamsi** ([@safishamsi](https://github.com/safishamsi)). Licença open source. Se a ferramenta poupar tempo, considere [apoiar o projeto](https://github.com/sponsors/safishamsi).
