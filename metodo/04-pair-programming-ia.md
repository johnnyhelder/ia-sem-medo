# 04 — Pair Programming com IA: Você Pensa, Ela Executa

## O conceito

```
VOCÊ (Navegador)              IA (Piloto)
────────────────              ──────────
Define o QUÊ                  Propõe o COMO
Define o PORQUÊ               Escreve o código
Questiona decisões            Executa comandos
Corrige rota                  Roda testes
Documenta erros               Refatora sob instrução
```

> "Eu trago o quê e o porquê. O agente traz o como. O como sem o quê produz código que resolve o problema errado." — Akita

## Agente no terminal (não no chat)

A IA funciona melhor quando tem acesso direto ao seu projeto — lê ficheiros, escreve código, roda testes, navega a estrutura. Isso é diferente de copiar e colar código de uma janela de chat.

## A disciplina do desapego

**Regra: se a IA errar, NUNCA corrija à mão.**

1. Explique o erro no prompt
2. Documente no CLAUDE.md
3. Deixe a IA corrigir

Por quê? Se você corrige manualmente, a IA não "aprende" (no contexto da sessão) e vai repetir o mesmo erro. O CLAUDE.md acumula esse conhecimento para sessões futuras.

## Segurança (AI Jail)

- NUNCA rode o agente direto na sua máquina sem isolamento
- Use container Docker para o projeto
- A IA tem acesso apenas ao projeto, não ao resto do computador
- Revise e aprove cada ação que a IA quer executar
