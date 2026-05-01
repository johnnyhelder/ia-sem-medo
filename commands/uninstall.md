---
description: Remove a skill / commands / backups — soft / hard / clean-all / backups-only
argument-hint: "[soft | hard | clean-all | backups-only]"
---

# /super-power:uninstall

Remove o `claude-code-super-power` do sistema. Tudo executado via Bash inline directo — sem invocar scripts externos, sem dependências de cache ou TTY.

**Não toca em projetos do utilizador.** Só toca em `~/.claude/skills/akita-method/` e `~/.claude/commands/super-power/`.

---

## O que o agente Claude Code deve fazer

### Passo 1 — Detectar modo

Se o utilizador chamou com argumento, usar:
- `/super-power:uninstall soft` ou `/super-power:uninstall` (default) → modo soft
- `/super-power:uninstall hard` → modo hard
- `/super-power:uninstall clean-all` → modo hard + limpar backups
- `/super-power:uninstall backups-only` → **NÃO desinstala**, só remove backups antigos (mantém skill activa)

Se utilizador disse "limpa backups" / "limpa lixo" / "remove backups antigos" → assumir `backups-only` directamente.

Se chamou **sem argumento** OU o utilizador disse algo em linguagem natural ("desinstala isto"), perguntar:

```
Como queres desinstalar?

  1. SOFT (recomendado) — move para .deleted.<timestamp>, recuperável
  2. HARD — apaga definitivamente (rm -rf)
  3. CLEAN-ALL — apaga tudo + remove backups antigos acumulados

Responde 1, 2 ou 3.
```

### Passo 2 — Mostrar o que vai ser tocado

Antes de executar, listar o que será removido:

```bash
echo "Vai ser removido:"
[ -d "$HOME/.claude/skills/akita-method" ] && echo "  ~/.claude/skills/akita-method"
[ -d "$HOME/.claude/commands/super-power" ] && echo "  ~/.claude/commands/super-power"
```

Se modo for **clean-all**, também listar backups que serão apagados:

```bash
shopt -s nullglob
echo "Backups que serão removidos:"
for p in "$HOME/.claude/skills/akita-method.backup."* "$HOME/.claude/skills/akita-method.deleted."* "$HOME/.claude/commands/super-power.backup."* "$HOME/.claude/commands/super-power.deleted."*; do
  echo "  $p"
done
shopt -u nullglob
```

### Passo 3 — Confirmar com o utilizador (excepto soft sem argumento explícito que já confirmou no menu)

Para HARD ou CLEAN-ALL: pedir confirmação clara em linguagem natural.

> "Vou apagar definitivamente os ficheiros listados acima. Confirmas? (sim/não)"

### Passo 4 — Executar

#### SOFT (default)

```bash
TS=$(date +%s)
[ -d "$HOME/.claude/skills/akita-method" ] && \
  mv "$HOME/.claude/skills/akita-method" "$HOME/.claude/skills/akita-method.deleted.$TS"
[ -d "$HOME/.claude/commands/super-power" ] && \
  mv "$HOME/.claude/commands/super-power" "$HOME/.claude/commands/super-power.deleted.$TS"
echo "✓ Movido para backup recuperável (.deleted.$TS)"
```

#### HARD

```bash
rm -rf "$HOME/.claude/skills/akita-method"
rm -rf "$HOME/.claude/commands/super-power"
echo "✓ Apagado definitivamente."
```

#### CLEAN-ALL

```bash
rm -rf "$HOME/.claude/skills/akita-method"
rm -rf "$HOME/.claude/commands/super-power"
shopt -s nullglob
N=0
for p in "$HOME/.claude/skills/akita-method.backup."* "$HOME/.claude/skills/akita-method.deleted."* "$HOME/.claude/commands/super-power.backup."* "$HOME/.claude/commands/super-power.deleted."*; do
  rm -rf "$p" && N=$((N+1))
done
shopt -u nullglob
echo "✓ Limpeza total. $N backups antigos também removidos."
```

#### BACKUPS-ONLY (mantém skill activa, só remove backups)

```bash
shopt -s nullglob
N=0
for p in "$HOME/.claude/skills/akita-method.backup."* "$HOME/.claude/skills/akita-method.deleted."* "$HOME/.claude/commands/super-power.backup."* "$HOME/.claude/commands/super-power.deleted."*; do
  rm -rf "$p" && N=$((N+1))
done
shopt -u nullglob
if [ "$N" -gt 0 ]; then
  echo "✓ $N backups antigos removidos. Skill activa intacta."
else
  echo "✓ Nenhum backup para remover. Sistema já está limpo."
fi
```

> **Importante:** modo `backups-only` NÃO toca em `~/.claude/skills/akita-method/` nem `~/.claude/commands/super-power/`. Só limpa os `.backup.*` e `.deleted.*` acumulados.

### Passo 5 — Reportar

```
✓ Claude Code Super Power desinstalado.

Modo usado: [SOFT/HARD/CLEAN-ALL]

[Se SOFT — mostrar backup paths]
Backup recuperável em:
  ~/.claude/skills/akita-method.deleted.<TS>
  ~/.claude/commands/super-power.deleted.<TS>

Para recuperar: "recupera o super-power" (eu trato disso)

[Se HARD ou CLEAN-ALL]
Para reinstalar, basta dizer:
  "Instala o claude-code-super-power"
```

---

## Regras

- **Sempre Bash inline.** Nunca invocar `~/.claude/skills/.../uninstall.sh` ou similar.
- **Sempre confirmar** acções destrutivas (hard, clean-all)
- **Default = soft** quando ambíguo (mais seguro)
- **Reportar paths concretos** dos backups criados
- **Compatível com macOS, Linux, WSL** — usar `$HOME` em vez de `~` para robustez
