---
description: Atualiza a skill e os commands para a versão mais recente do GitHub
argument-hint: ""
---

# /super-power:update

Atualiza o `claude-code-super-power` para a versão mais recente. **Tudo executado via Bash inline directo** — sem dependências de cache ou scripts externos.

Faz backup automático da versão actual antes de instalar a nova.

---

## O que o agente Claude Code deve fazer

### Passo 1 — Avisar e confirmar

```
Vou atualizar o claude-code-super-power:

  1. Backup da versão actual em ~/.claude/skills/akita-method.backup.<TS>
                              ~/.claude/commands/super-power.backup.<TS>
  2. Clonar versão mais recente do GitHub
  3. Instalar a nova versão
  4. Validar

Os teus projetos não são tocados. Posso prosseguir?
```

### Passo 2 — Backup da versão actual

```bash
TS=$(date +%s)

if [ -d "$HOME/.claude/skills/akita-method" ]; then
  mv "$HOME/.claude/skills/akita-method" "$HOME/.claude/skills/akita-method.backup.$TS"
  echo "✓ Backup da skill: ~/.claude/skills/akita-method.backup.$TS"
fi

if [ -d "$HOME/.claude/commands/super-power" ]; then
  mv "$HOME/.claude/commands/super-power" "$HOME/.claude/commands/super-power.backup.$TS"
  echo "✓ Backup dos commands: ~/.claude/commands/super-power.backup.$TS"
fi
```

### Passo 3 — Clonar versão mais recente

```bash
TMP=$(mktemp -d -t ccsp-update-XXXXXX)
git clone --depth 1 --branch main --quiet \
  https://github.com/johnnyhelder/claude-code-super-power.git "$TMP/repo"
```

### Passo 4 — Verificar conteúdo esperado

```bash
if [ ! -d "$TMP/repo/skill/akita-method" ] || [ ! -d "$TMP/repo/commands" ]; then
  echo "✗ Estrutura do repositório inesperada. Restaurar backup..."
  rm -rf "$TMP"
  mv "$HOME/.claude/skills/akita-method.backup.$TS" "$HOME/.claude/skills/akita-method"
  mv "$HOME/.claude/commands/super-power.backup.$TS" "$HOME/.claude/commands/super-power"
  exit 1
fi
```

### Passo 5 — Instalar nova versão

```bash
mkdir -p "$HOME/.claude/skills" "$HOME/.claude/commands"
cp -r "$TMP/repo/skill/akita-method" "$HOME/.claude/skills/akita-method"
cp -r "$TMP/repo/commands" "$HOME/.claude/commands/super-power"
rm -rf "$TMP"
```

### Passo 6 — Validar

```bash
SKILL_OK=false
CMD_OK=false
[ -f "$HOME/.claude/skills/akita-method/SKILL.md" ] && SKILL_OK=true
[ -d "$HOME/.claude/commands/super-power" ] && \
  [ "$(ls -1 "$HOME/.claude/commands/super-power" | wc -l)" -ge 5 ] && CMD_OK=true

if $SKILL_OK && $CMD_OK; then
  echo "✓ Atualização concluída com sucesso"
else
  echo "✗ Validação falhou — restaurar backup manualmente"
fi
```

### Passo 7 — Reportar

```
✓ Claude Code Super Power atualizado.

Backup da versão anterior em:
  ~/.claude/skills/akita-method.backup.<TS>
  ~/.claude/commands/super-power.backup.<TS>

Para limpar backups antigos: "limpa os backups do super-power"
Para reverter: "recupera o backup .backup.<TS>"

Lista de mudanças desta sessão: https://github.com/johnnyhelder/claude-code-super-power/commits/main
```

---

## Detectar mudanças relevantes

Se possível (e se o agente quiser dar valor extra), depois de atualizar pode mostrar diff resumido:

```bash
# Listar ficheiros que mudaram entre backup e nova versão
diff -rq "$HOME/.claude/skills/akita-method.backup.$TS" "$HOME/.claude/skills/akita-method" 2>/dev/null | head -10
diff -rq "$HOME/.claude/commands/super-power.backup.$TS" "$HOME/.claude/commands/super-power" 2>/dev/null | head -10
```

E resumir em 1 frase: "Mudanças nesta versão: X commands modificados, Y novos ficheiros."

---

## Regras

- **Sempre Bash inline.** Nunca invocar `install.sh` externo.
- **Sempre fazer backup** antes de tocar nos ficheiros actuais.
- **Validar antes de declarar sucesso** — checar que SKILL.md existe e que há ≥5 commands.
- **Em caso de erro, restaurar backup** automaticamente.
- **Compatível com macOS, Linux, WSL** — usar `$HOME` para portabilidade.
