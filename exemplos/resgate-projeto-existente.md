# Como Aplicar em Projetos Existentes (Resgate)

## O cenário

Você já tem um projeto rodando — talvez até em produção. O problema: sem testes, sem CI/CD, sem documentação. Qualquer mudança pode quebrar algo.

## O fluxo de resgate

### 1. Diagnóstico

Mapeie o estado real do projeto:

| O que verificar | Existe? |
|-----------------|---------|
| Testes automatizados | ❌ / ✅ |
| Pipeline CI/CD | ❌ / ✅ |
| CLAUDE.md ou documentação | ❌ / ✅ |
| Lint / formatação | ❌ / ✅ |
| Deploy automatizado | ❌ / ✅ |

### 2. Sprint 1 — Testes (PRIORIDADE MÁXIMA)

Instale um framework de testes e crie 15-20 testes básicos que cobrem:
- Build compila sem erros
- Páginas/endpoints respondem
- Dados obrigatórios estão presentes
- SEO básico (se for site)
- Nenhum secret exposto

**Por que é prioridade:** Sem testes, tudo o resto é arriscado. Os testes são a rede de segurança que permite fazer tudo o que vem depois com confiança.

### 3. Sprint 2 — CI/CD

Crie uma pipeline que bloqueia deploy se algo falhar:
```
push → lint → testes → build → deploy
```

### 4. Sprint 3 — Documentação retroativa

Crie o CLAUDE.md documentando o projeto COMO ELE É HOJE:
- Stack atual
- Estrutura de pastas
- APIs e endpoints
- Regras de negócio
- Decisões já tomadas (e por quê)

### 5. A partir daqui: método normal

Com testes, CI/CD e documentação, o projeto está "resgatado". Novas features seguem o fluxo normal: teste primeiro, depois código.

## Caso real

Testamos este processo em dois projetos reais:
- **Site estático (Astro):** de 0 testes para 15+ testes em 1 sprint
- **App completa (Next.js + Prisma + AI SDK):** de 0 testes para 28+ testes em 1 sprint

Ambos os projetos estavam em produção e funcionavam. Mas qualquer mudança era "no escuro". Depois do resgate, mudanças passaram a ser validadas automaticamente.
