# Instruções de Instalação

> Este ficheiro é seguido pelo agente Claude Code quando o utilizador cola o prompt mágico do README.
> Também serve de referência manual para qualquer pessoa.

---

## Filosofia: instalação LOCAL no projeto (default)

O Claude Code Super Power instala-se por default **na pasta do projeto actual** (`.claude/skills/akita-method/` e `.claude/commands/super-power/`), **não no `~/.claude/` global**.

### Porquê local?

| Vantagem | Detalhe |
|----------|---------|
| ✅ Sem auto-mode bloqueio | Não é self-modification global, é só criar ficheiros num projeto |
| ✅ Cada projeto tem versão própria | Podes ter v1 num projeto e v2 noutro sem conflitos |
| ✅ Não polui `~/.claude/` | Outros projetos não são afectados |
| ✅ Replicável via git | Quem clona o projeto recebe a skill automaticamente |
| ✅ Mais simples conceptualmente | Está aqui na pasta, não escondido |

### Quando usar global?

Se quiseres a skill activa em **todos os projetos** sem instalar em cada um:

```bash
curl -sSL .../install.sh | bash -s -- --global
```

(Mas pode ter o problema do auto-mode classifier — terás que autorizar manualmente.)

---

## O que vai ser instalado

| Destino (local) | Conteúdo |
|---------|----------|
| `./.claude/skills/akita-method/` | Skill orquestradora (SKILL.md + templates) |
| `./.claude/commands/super-power/` | 8 slash commands `/super-power:*` |

**Não toca em `~/.claude/` global.** Não toca noutros projetos.

---

## Para o agente Claude Code seguir

### Passo 1 — Confirmar contexto

Verificar que está na pasta correcta:

```bash
echo "Vou instalar em: $(pwd)/.claude/"
ls -la 2>/dev/null | head -3
```

Se a pasta parece de projeto válido (tem README, package.json, ou similar — ou está vazia para projeto novo), avançar. Se está em `$HOME` ou `/tmp`, avisar utilizador antes.

### Passo 2 — Verificar dependências

```bash
command -v git >/dev/null || echo "MISSING: git"
mkdir -p "$(pwd)/.claude/skills" "$(pwd)/.claude/commands"
```

### Passo 3 — Backup automático (se já existir)

```bash
TS=$(date +%s)
[ -d "$(pwd)/.claude/skills/akita-method" ] && \
  mv "$(pwd)/.claude/skills/akita-method" "$(pwd)/.claude/skills/akita-method.backup.$TS"
[ -d "$(pwd)/.claude/commands/super-power" ] && \
  mv "$(pwd)/.claude/commands/super-power" "$(pwd)/.claude/commands/super-power.backup.$TS"
```

### Passo 4 — Clonar repositório

```bash
TMP=$(mktemp -d -t ccsp-install-XXXXXX)
git clone --depth 1 --branch main --quiet \
  https://github.com/johnnyhelder/claude-code-super-power.git "$TMP/repo"
```

### Passo 5 — Copiar para destinos locais

```bash
cp -r "$TMP/repo/skills/akita-method" "$(pwd)/.claude/skills/akita-method"
cp -r "$TMP/repo/commands" "$(pwd)/.claude/commands/super-power"
rm -rf "$TMP"
```

### Passo 6 — Verificar instalação

```bash
[ -f "$(pwd)/.claude/skills/akita-method/SKILL.md" ] && echo "✓ Skill OK"
[ -d "$(pwd)/.claude/commands/super-power" ] && echo "✓ Commands OK"
```

### Passo 7 — Reportar sucesso

> "✓ Claude Code Super Power instalado **nesta pasta**.
>
> **Skill:** `./.claude/skills/akita-method/`
> **Slash commands:** `./.claude/commands/super-power/` (8 disponíveis)
>
> A skill está activa **apenas neste projeto** — outros não são afectados.
>
> **Próximos passos:**
> - "Que versão tenho?" — confirmar instalação
> - "Começa um projeto novo" — arrancar Fase 0
> - `/super-power:research` — slash command para pesquisa
>
> **Recomendação:** adicionar `.claude/skills/akita-method/.gitignore` ao teu `.gitignore` se NÃO quiseres versionar a skill (ou deixar versionada para replicar entre dispositivos)."

---

## Resolução de problemas

### Auto-mode classifier bloqueia mesmo com instalação local

A instalação local **NÃO deveria** disparar o auto-mode classifier (não é self-modification global). Se mesmo assim bloquear:

1. Confirmar autorização explicitamente: "Sim, autorizo. Procede."
2. Como último recurso, sair do Claude Code, abrir terminal, e correr:
   ```bash
   curl -sSL https://raw.githubusercontent.com/johnnyhelder/claude-code-super-power/main/install.sh | bash
   ```
   (Default é local — instala na pasta actual.)

### Reverter instalação local

Para desinstalar deste projeto apenas:

```
Desinstala o super-power deste projeto
```

Ou manualmente:

```bash
rm -rf .claude/skills/akita-method
rm -rf .claude/commands/super-power
```

### Instalar globalmente

Se mesmo assim queres a skill em todos os projetos (e estás disposto a autorizar o auto-mode):

```bash
curl -sSL https://raw.githubusercontent.com/johnnyhelder/claude-code-super-power/main/install.sh | bash -s -- --global
```

---

## Estrutura instalada (local — default)

```
meu-projeto/
├── .claude/
│   ├── skills/
│   │   └── akita-method/
│   │       ├── SKILL.md                 Orquestrador
│   │       └── templates/
│   │           ├── PLAN-TEMPLATE.md
│   │           ├── CLAUDE-MD-TEMPLATE.md
│   │           ├── DADOS-PROJETO-TEMPLATE.md
│   │           ├── TESTES-BASE.md
│   │           └── CI-CD-TEMPLATE.md
│   └── commands/
│       └── super-power/
│           ├── research.md     /super-power:research
│           ├── plan.md         /super-power:plan
│           ├── start.md        /super-power:start
│           ├── phase.md        /super-power:phase N
│           ├── status.md       /super-power:status
│           ├── version.md      /super-power:version
│           ├── update.md       /super-power:update
│           └── uninstall.md    /super-power:uninstall
├── PLAN.md                              (gerado por /super-power:plan)
├── CLAUDE.md                            (gerado por /super-power:plan)
├── PROJECT.md                           (gerado por /super-power:plan)
└── NOW.md                               (gerado por /super-power:plan)
```
