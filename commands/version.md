---
description: Mostra a versão instalada do Claude Code Super Power e compara com a versão remota mais recente
argument-hint: ""
---

# /super-power:version

Mostra qual versão do `claude-code-super-power` está instalada e se há versão mais recente disponível.

---

## O que o agente Claude Code deve fazer

### Passo 1 — Detectar versão instalada

```bash
SKILL_DIR="$HOME/.claude/skills/akita-method"
COMMANDS_DIR="$HOME/.claude/commands/super-power"

if [ ! -f "$SKILL_DIR/SKILL.md" ]; then
  echo "✗ Skill não está instalada."
  exit 0
fi

# Data de modificação dos ficheiros (proxy para "quando foi instalado")
INSTALLED_AT=$(stat -c %y "$SKILL_DIR/SKILL.md" 2>/dev/null || stat -f "%Sm" -t "%Y-%m-%d %H:%M:%S" "$SKILL_DIR/SKILL.md")
CMD_COUNT=$(ls -1 "$COMMANDS_DIR" 2>/dev/null | wc -l | tr -d ' ')

echo "✓ Skill instalada"
echo "  Localização: $SKILL_DIR"
echo "  Instalado em: $INSTALLED_AT"
echo "  Slash commands: $CMD_COUNT"

if [ -d "$COMMANDS_DIR" ]; then
  echo ""
  echo "  Commands disponíveis:"
  ls -1 "$COMMANDS_DIR" | sed 's/\.md$//' | sed 's/^/    \/super-power:/'
fi
```

### Passo 2 — Detectar backups acumulados

Usar `find` para portabilidade bash/zsh:

```bash
BACKUPS=$(find "$HOME/.claude/skills" "$HOME/.claude/commands" -maxdepth 1 -type d \
  \( -name "akita-method.backup.*" -o -name "akita-method.deleted.*" \
     -o -name "super-power.backup.*" -o -name "super-power.deleted.*" \) \
  2>/dev/null)

if [ -n "$BACKUPS" ]; then
  N=$(echo "$BACKUPS" | wc -l | tr -d ' ')
  echo ""
  echo "⚠ $N backups antigos detectados:"
  echo "$BACKUPS" | sed 's/^/    /'
  echo ""
  echo "  Para limpar: \"limpa os backups\" ou /super-power:uninstall backups-only"
fi
```

### Passo 3 — Verificar versão remota (opcional)

Tentar buscar o último commit do GitHub para comparar:

```bash
LATEST=$(curl -sSL "https://api.github.com/repos/johnnyhelder/claude-code-super-power/commits/main?$(date +%s)" 2>/dev/null | grep -m1 '"sha"' | sed 's/.*"sha": "\([^"]*\)".*/\1/' | cut -c1-7)

if [ -n "$LATEST" ]; then
  echo ""
  echo "  Versão remota (main): commit $LATEST"
  echo ""
  echo "  Para verificar se há nova versão: \"atualiza super power\""
fi
```

### Passo 4 — Reportar

Apresentar tudo num bloco final claro:

```
✓ Claude Code Super Power instalado

  Localização:    ~/.claude/skills/akita-method
  Instalado em:   <DATA>
  Slash commands: <N>

  Commands disponíveis:
    /super-power:research
    /super-power:plan
    /super-power:start
    /super-power:phase
    /super-power:status
    /super-power:update
    /super-power:uninstall
    /super-power:version

  [Se houver backups]
  ⚠ <N> backups antigos detectados (espaço a ocupar)
  Para limpar: "limpa os backups"

  [Se houver versão remota mais recente]
  Versão remota: commit <SHA>
  Para atualizar: "atualiza super power"
```

---

## Regras

- Compatível com macOS (`stat -f`) e Linux (`stat -c`)
- Falhar silenciosamente se não houver internet (curl da API GitHub)
- Sempre reportar mesmo que skill não esteja instalada
- Se o utilizador disser apenas "que versão tenho?" / "qual a versão?" → activar este flow
