# 04 — Pair Programming com IA

## O conceito clássico

Pair Programming vem do Extreme Programming: duas pessoas, uma pensa (navegador) e outra escreve código (piloto). O navegador guia a direção, questiona decisões, corrige rota. O piloto executa.

## A adaptação para IA

```
VOCÊ (Navegador)                IA / Agente (Piloto)
────────────────                ────────────────────
Define o QUÊ                   Propõe o COMO
Define o PORQUÊ                Escreve o código
Questiona decisões             Executa comandos
Corrige rota                   Roda testes
Documenta erros                Refatora sob instrução
```

A frase-chave do Akita:

> "Eu trago o quê e o porquê. O agente traz o como. O como sem o quê produz código que resolve o problema errado. O quê sem o como produz specs que nunca saem do papel."

## Agente no terminal vs chat no browser

O Akita prefere rodar a IA no terminal (ex: Claude Code) em vez de usar chat no browser. Motivos:

- **Acesso ao projeto inteiro** — a IA lê, escreve e navega todos os ficheiros
- **Execução direta** — roda testes, builds e comandos sem copiar/colar
- **Contexto do monorepo** — enxerga todos os serviços de uma vez

Se você não tem acesso a um agente no terminal, o método funciona com chat também — só é mais manual (precisa copiar/colar código entre o chat e o editor).

## A disciplina do desapego

Esta é a regra mais difícil de seguir, mas a mais importante:

### Se a IA errar, NÃO corrija o código à mão.

Em vez disso:
1. Explique o erro no prompt (para a IA)
2. Documente o erro no CLAUDE.md (seção "Erros Conhecidos da IA")
3. Deixe a IA corrigir

### Por quê?
- Se você corrige à mão, a IA não "aprende" (no contexto da sessão)
- Na próxima vez, ela vai repetir o mesmo erro
- O CLAUDE.md acumula conhecimento para sessões futuras
- Alterações manuais dessincronizam o modelo mental da IA

### É difícil?
Sim. Dá vontade de "ir lá e arrumar rapidinho". Mas a prática mostra que explicar o erro para a IA é um investimento: ela corrige agora E nas próximas vezes.

## Segurança: AI Jail

A IA tem acesso ao seu projeto. Isso é poderoso mas também perigoso. Práticas de segurança:

- **Rodar em container Docker** — se a IA executar algo destrutivo, só afeta o container
- **Permission model** — ferramentas como Claude Code pedem permissão antes de cada ação
- **Nunca modo "faça o que quiser"** — sempre revisar o que a IA vai executar
- **Variáveis de ambiente separadas** — nunca expor chaves de produção ao agente

Se não usa Docker, no mínimo: pasta isolada, backup do projeto antes de sessões longas, e atenção ao que a IA executa.

---

> **Fonte:** Baseado nos conteúdos públicos de Fábio Akita. Ver [CREDITOS.md](../CREDITOS.md).
