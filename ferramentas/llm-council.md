# LLM Council — Conselho de 5 conselheiros para decisões caras

> Skill que transforma qualquer pergunta numa análise de 5 conselheiros virtuais com revisão por pares anónima e veredito final.
> Baseada na metodologia [LLM Council do Karpathy](https://github.com/karpathy/llm-council).
> Versão PT-BR: [gestordeaudiencia/llm-council-skill-ptbr](https://github.com/gestordeaudiencia/llm-council-skill-ptbr).

---

## O que faz

Quando você tem uma decisão difícil, a skill convoca 5 conselheiros virtuais. Cada um analisa pelo seu ângulo. Eles revisam o que os outros falaram (revisão por pares anónima). No final, um presidente entrega o veredito: onde concordam, onde brigam e o que você deve fazer.

---

## Quando usar (e quando NÃO usar)

### USE quando:

- Você tem uma decisão **cara e ambígua**
- Lançar um produto de R$ 97 ou de R$ 497
- Contratar VA ou criar automação primeiro
- Mudar o posicionamento do negócio
- Revisar a copy de uma página de vendas
- Escolher entre duas stacks técnicas com trade-offs reais

### NÃO use quando:

- Pergunta de fato simples ("qual a capital de Portugal")
- Tarefa de execução criativa ("escreve um post sobre X")
- Decisão sem trade-offs reais ("devo usar markdown")

> Conselho sem contexto é palpite com voz grossa.

---

## Como instalar (3 minutos, zero terminal)

### Método A — Prompt mágico (recomendado)

1. Abrir [claude.ai](https://claude.ai) ou app desktop
2. Começar conversa nova
3. Colar este prompt:

```
Por favor, instale esta Claude Skill pra mim.
O arquivo SKILL.md está neste repositório do GitHub:
https://github.com/gestordeaudiencia/llm-council-skill-ptbr

Configura tudo pra eu já poder usar. Me avisa
qualquer coisa que precisar de mim.
```

4. Responder o que o Claude pedir (autorizar acesso ao link)
5. Testar: `convoca o conselho sobre devo lançar curso ou workshop primeiro?`

### Método B — Upload manual (fallback)

Se o método A falhar:

1. Abrir [github.com/gestordeaudiencia/llm-council-skill-ptbr](https://github.com/gestordeaudiencia/llm-council-skill-ptbr)
2. Baixar o ficheiro `SKILL.md`
3. No Claude, colar este prompt e anexar o `SKILL.md`:

```
Acabei de baixar um arquivo chamado SKILL.md
da skill Conselho de LLMs.
Você consegue instalar ela pra mim?
Me guia até o lugar certo onde preciso colocar
esse arquivo, passo a passo.
```

---

## Frases gatilho

Decore uma destas e use no início da conversa:

| Frase | Quando usar |
|-------|-------------|
| `convoca o conselho sobre [pergunta]` | Forma direta, no início da conversa |
| `roda o conselho sobre [pergunta]` | Variação |
| `leva isto pro conselho` | Depois de colar uma copy/proposta/plano |
| `stress-test isto` | Quando quer que caçem furos, não que validem |
| `war room isto` | Trate como decisão de alto risco |
| `submete ao conselho` | Variação formal |
| `council this` | Versão original em inglês — funciona igual |

---

## Quando usar no método

| Fase | Caso de uso |
|------|-------------|
| **Fase 0** (Pesquisa) | Estou entre Next.js e Astro. `convoca o conselho` |
| **Fase 1** (Setup) | Devo usar Postgres ou SQLite? `convoca o conselho` |
| **Fase 6** (Interface) | Tenho duas versões de homepage. `leva isto pro conselho` |
| **Pós-deploy** | A landing converte mal. `stress-test isto` (cola a copy) |

---

## Dica de ouro

Quanto mais contexto você der antes de chamar o conselho — público, oferta, números, restrições — mais certeira a resposta dos 5 conselheiros.

E prepare o emocional: se você já decidiu e só busca validação, o conselho provavelmente vai te dizer coisa que não quer ouvir. **Esse é o ponto.** Vai te poupar de erro caro.

---

## Crédito

- **Andrej Karpathy** — Metodologia original LLM Council
- **Gestor de Audiência** ([@gestordeaudiencia](https://instagram.com/gestordeaudiencia)) — Versão PT-BR + tutorial passo-a-passo de instalação que inspirou este guia
