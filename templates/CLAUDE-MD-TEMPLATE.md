# Template: CLAUDE.md

> Copiar, renomear para CLAUDE.md, e preencher com 200+ linhas de contexto.
> Este é o cérebro do agente. Quanto mais detalhado, menos alucinações.
> Atualizar SEMPRE que a IA errar ou que uma decisão mudar.

---

# CLAUDE.md — [Nome do Projeto]

## Sobre o Projeto

(2-3 frases: o que é, para quem, qual problema resolve)

## Stack Técnico

| Camada | Tecnologia | Versão |
|--------|-----------|--------|
| Linguagem | | |
| Framework | | |
| Estilos | | |
| Banco de dados | | |
| Deploy | | |
| CI/CD | | |
| Testes | | |

## Estrutura do Projeto

```
projeto/
├── README.md
├── PLAN.md
├── CLAUDE.md
├── src/
│   ├── (descrever cada pasta e o que contém)
│   └── ...
├── tests/
│   └── ...
├── docs/
│   └── ...
├── docker-compose.yml (se aplicável)
└── .github/workflows/ (se aplicável)
```

## Variáveis de Ambiente

| Variável | Descrição | Exemplo |
|----------|-----------|---------|
| | | |

> ⚠️ NUNCA commitar valores reais. Usar .env.example com valores de exemplo.

## Regras de Código

### Obrigatórias:
- (Regras de nomenclatura: ficheiros, variáveis, classes, etc.)
- (Regras de formatação: tabs vs spaces, max line length, etc.)
- (Regras de organização: onde colocar models, services, utils, etc.)
- (Regras de commits: conventional commits, tamanho, frequência)

### Proibidas:
- (O que a IA NÃO deve fazer: ex: "nunca usar any em TypeScript")
- (Padrões a evitar: ex: "nunca criar God classes com +500 linhas")
- (Dependências proibidas: ex: "não instalar jQuery")

## Regras de Domínio / Negócio

(Regras específicas do negócio que a IA precisa saber)

Exemplo:
- "O nome correto é 'Diene Marinho', NÃO 'Dienne'"
- "Preços sempre em euros (€), formato: €XX,XX"
- "Tom de comunicação: profissional mas acolhedor"

## Regras de Conteúdo (se o projeto tem blog/textos)

- (Template de artigo: estrutura, tamanho, etc.)
- (Regras de SEO: keywords, meta tags, etc.)
- (Regras de tom: formal, informal, educativo, etc.)
- (Marcações internas: se usa algum sistema de tags)

## Integrações Externas

| Serviço | Uso | Documentação | Limites |
|---------|-----|-------------|---------|
| | | | |

## Comandos Frequentes

```bash
# Desenvolvimento
(comando para iniciar dev server)

# Testes
(comando para rodar testes)

# Build
(comando para fazer build)

# Deploy
(comando para deploy, se manual)

# Lint
(comando para verificar qualidade do código)
```

## Estado Atual do Projeto

(Atualizar esta seção à medida que o projeto evolui)

### Fases concluídas:
- [ ] Fase 0 — Coleta
- [ ] Fase 1 — Isolamento
- [ ] Fase 2 — Fundação
- [ ] Fase 3 — Testes
- [ ] Fase 4 — Implementação
- [ ] Fase 5 — Otimização
- [ ] Fase 6 — Interface
- [ ] Fase 7 — Deploy

### Features implementadas:
- [ ] (feature 1)
- [ ] (feature 2)

### Pendências:
- (o que falta fazer)

## Erros Conhecidos da IA

> ⚠️ SEÇÃO CRÍTICA — Atualizar TODA VEZ que a IA alucinar ou errar.
> Isso evita que o mesmo erro se repita.

| Data | Erro | Correção | Contexto |
|------|------|----------|----------|
| | | | |

Exemplo:
| 2026-03-09 | IA usou import de módulo que não existe | Explicar que só usar imports nativos do framework | Tentou importar lib não instalada |

## Notas Importantes

- (Qualquer contexto adicional que ajude a IA a trabalhar melhor)
- (Decisões tomadas que não são óbvias)
- (Links úteis para documentação)
