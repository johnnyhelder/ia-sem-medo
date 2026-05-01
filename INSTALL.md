# Instruções de Instalação

> Este ficheiro é seguido pelo agente Claude Code quando o utilizador cola o prompt mágico do README.
> Também serve de referência manual para qualquer pessoa.

---

## O que vai ser instalado

| Destino | Conteúdo |
|---------|----------|
| `~/.claude/skills/akita-method/` | Skill orquestradora do método (SKILL.md + templates) |
| `~/.claude/commands/super-power/` | 5 slash commands `/super-power:*` |

**Não toca nos seus projetos.** Só configura o `~/.claude/` global do utilizador.

---

## Para o agente Claude Code seguir

### Passo 1 — Confirmar com o utilizador

Antes de qualquer ação destrutiva, perguntar:

> "Vou instalar o Claude Code Super Power. Isto cria duas pastas em `~/.claude/`:
> - `~/.claude/skills/akita-method/` (skill orquestradora do método)
> - `~/.claude/commands/super-power/` (5 slash commands /super-power:*)
>
> Se já existirem versões anteriores, faço backup automático antes de substituir. Posso prosseguir?"

Se o utilizador confirmar, avançar. Se hesitar, explicar e perguntar de novo.

### Passo 2 — Verificar dependências

```bash
command -v git || echo "MISSING: git"
[ -d "$HOME/.claude" ] && echo "OK: ~/.claude existe" || mkdir -p "$HOME/.claude"
mkdir -p "$HOME/.claude/skills" "$HOME/.claude/commands"
```

Se `git` não estiver instalado, parar e pedir ao utilizador para instalar primeiro.

### Passo 3 — Backup automático (se já existir)

```bash
TS=$(date +%s)
[ -d "$HOME/.claude/skills/akita-method" ] && mv "$HOME/.claude/skills/akita-method" "$HOME/.claude/skills/akita-method.backup.$TS"
[ -d "$HOME/.claude/commands/super-power" ] && mv "$HOME/.claude/commands/super-power" "$HOME/.claude/commands/super-power.backup.$TS"
```

Avisar o utilizador se algum backup foi criado, com o caminho exacto.

### Passo 4 — Clonar repositório

```bash
TMP=$(mktemp -d -t ccsp-install-XXXXXX)
git clone --depth 1 --branch main --quiet https://github.com/johnnyhelder/claude-code-super-power.git "$TMP/repo"
```

### Passo 5 — Copiar para os destinos finais

```bash
cp -r "$TMP/repo/skill/akita-method" "$HOME/.claude/skills/akita-method"
cp -r "$TMP/repo/commands" "$HOME/.claude/commands/super-power"
rm -rf "$TMP"
```

### Passo 6 — Verificar instalação

```bash
ls "$HOME/.claude/skills/akita-method/SKILL.md" >/dev/null && echo "✓ Skill OK"
ls "$HOME/.claude/commands/super-power/research.md" >/dev/null && echo "✓ Commands OK"
```

Se algo falhar, restaurar o backup e reportar erro ao utilizador.

### Passo 7 — Reportar sucesso

> "✓ Claude Code Super Power instalado.
>
> **Skill:** `~/.claude/skills/akita-method/`
> **Slash commands:** 5 disponíveis em `~/.claude/commands/super-power/`
>
> **Próximos passos:**
> 1. Abrir o Claude Code numa pasta de projeto novo (`mkdir meu-projeto && cd meu-projeto && claude`)
> 2. Rodar `/super-power:research` para iniciar a Fase 0 (pesquisa)
>
> **Comandos disponíveis:**
> - `/super-power:research` — pesquisa de mercado, SEO, concorrência, ferramentas
> - `/super-power:plan` — gera PLAN.md + CLAUDE.md + PROJECT.md + NOW.md
> - `/super-power:start` — Fase 1: setup seguro
> - `/super-power:phase N` — avança para fase N (2-7)
> - `/super-power:status` — mostra estado do projeto
>
> Documentação: https://github.com/johnnyhelder/claude-code-super-power"

---

## Resolução de problemas

### Permissões do agente impedem clone

Se o agente disser que não pode clonar repositórios, a solução é executar o `install.sh` manualmente:

```bash
curl -sSL https://raw.githubusercontent.com/johnnyhelder/claude-code-super-power/main/install.sh | bash
```

### Reverter instalação

Se quiser desinstalar:

```bash
rm -rf ~/.claude/skills/akita-method
rm -rf ~/.claude/commands/super-power
```

### Atualizar para versão mais recente

```bash
# Re-rodar a instalação faz backup automático e instala a versão atual
curl -sSL https://raw.githubusercontent.com/johnnyhelder/claude-code-super-power/main/install.sh | bash
```

---

## Estrutura instalada

Após instalação bem-sucedida:

```
~/.claude/
├── skills/
│   └── akita-method/
│       ├── SKILL.md                    Orquestrador do método
│       └── templates/
│           ├── PLAN-TEMPLATE.md
│           ├── CLAUDE-MD-TEMPLATE.md   (com 4 princípios pré-injetados)
│           ├── DADOS-PROJETO-TEMPLATE.md
│           ├── TESTES-BASE.md
│           └── CI-CD-TEMPLATE.md
└── commands/
    └── super-power/
        ├── research.md     /super-power:research
        ├── plan.md         /super-power:plan
        ├── start.md        /super-power:start
        ├── phase.md        /super-power:phase N
        └── status.md       /super-power:status
```
