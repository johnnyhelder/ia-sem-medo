# 03 — TDD com IA: Testes como Rede de Segurança

> "TDD é mais importante com IA, não menos." — Akita

## Por que testar ANTES de codificar?

Sem testes, cada mudança que a IA faz é uma **aposta**. Com testes, você tem uma rede de segurança: se a IA quebrar algo, os testes pegam antes do deploy.

No projeto do Akita: **1.323 testes** permitiram **274 commits em 8 dias** com confiança.

## O fluxo

```
1. Escreva os testes (Red)      ← primeiro prompt ao agente
2. Implemente o código (Green)  ← segundo prompt
3. Refatore (Refactor)          ← terceiro prompt
4. Repita
```

## Regras

- O PRIMEIRO prompt é "escreva os testes para [feature]"
- Se a IA sugere código sem teste: **RECUSA**
- Use mocks para testar coisas que ainda não existem
- O agente deve rodar os testes ANTES de cada commit

## Por que Vibe Coding falha

No vibe coding, erros só aparecem em produção. Você pede uma feature nova, a IA implementa, outra feature para de funcionar — e você nem percebe. Com testes, isso é impossível.

## Exemplos de testes por tipo de projeto

Ver o template completo em [`templates/TESTES-BASE.md`](../templates/TESTES-BASE.md), com exemplos para sites estáticos, APIs, apps frontend e bots.
