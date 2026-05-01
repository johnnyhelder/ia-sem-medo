---
description: Remove a skill e os slash commands — opções soft (backup) ou hard (sem backup)
argument-hint: "[soft | hard | clean-all]"
---

# /super-power:uninstall

Remove o `claude-code-super-power` do sistema. **Não toca em projetos existentes.**

O agente executa Bash directo (não chama o `uninstall.sh`) — assim funciona mesmo no `!` do Claude Code, sem precisar de TTY interactivo.

## Modos disponíveis

| Modo | O que faz | Recuperável? |
|------|-----------|--------------|
| **soft** (default) | Move para `.deleted.<timestamp>` | ✅ Sim — basta renomear de volta |
| **hard** | `rm -rf` directo | ❌ Não — apaga definitivamente |
| **clean-all** | Hard + apaga `.backup.*` e `.deleted.*` acumulados | ❌ Não — limpeza total |

## O que o agente Claude Code deve fazer

### Passo 1 — Detectar o modo

Se o utilizador chamou com argumento, usar:
- `/super-power:uninstall soft` → modo soft
- `/super-power:uninstall hard` → modo hard
- `/super-power:uninstall clean-all` → modo hard + limpar backups

Se chamou **sem argumento**, perguntar:

```
Como queres desinstalar?

  1. SOFT (recomendado) — move para .deleted.<timestamp>, recuperável
  2. HARD — apaga definitivamente (rm -rf)
  3. CLEAN-ALL — apaga tudo + remove backups antigos acumulados (.backup.*, .deleted.*)

Responde 1, 2 ou 3.
```

### Passo 2 — Detectar backups acumulados

Listar (silenciosamente) o que existe:

```bash
ls -d ~/.claude/skills/akita-method 2>/dev/null
ls -d ~/.claude/skills/akita-method.backup.* 2>/dev/null
ls -d ~/.claude/skills/akita-method.deleted.* 2>/dev/null
ls -d ~/.claude/commands/super-power 2>/dev/null
ls -d ~/.claude/commands/super-power.backup.* 2>/dev/null
ls -d ~/.claude/commands/super-power.deleted.* 2>/dev/null
```

### Passo 3 — Mostrar plano e confirmar

Exemplo de mensagem para o utilizador:

```
Vou desinstalar (modo: HARD):

Vai ser apagado:
  ~/.claude/skills/akita-method
  ~/.claude/commands/super-power

Backups antigos detectados (não serão tocados, a não ser que escolhas CLEAN-ALL):
  ~/.claude/skills/akita-method.backup.1777656584
  ~/.claude/skills/akita-method.deleted.1777660000
  ~/.claude/commands/super-power.backup.1777656584

Confirmas? (sim/não)
```

Se utilizador disser **não**: parar.
Se utilizador disser **sim**: avançar.

### Passo 4 — Executar

#### Modo SOFT

```bash
TS=$(date +%s)
[ -d "$HOME/.claude/skills/akita-method" ] && \
  mv "$HOME/.claude/skills/akita-method" "$HOME/.claude/skills/akita-method.deleted.$TS"
[ -d "$HOME/.claude/commands/super-power" ] && \
  mv "$HOME/.claude/commands/super-power" "$HOME/.claude/commands/super-power.deleted.$TS"
```

#### Modo HARD

```bash
rm -rf "$HOME/.claude/skills/akita-method"
rm -rf "$HOME/.claude/commands/super-power"
```

#### Modo CLEAN-ALL

```bash
# Atual
rm -rf "$HOME/.claude/skills/akita-method"
rm -rf "$HOME/.claude/commands/super-power"

# Backups antigos
rm -rf "$HOME"/.claude/skills/akita-method.backup.*
rm -rf "$HOME"/.claude/skills/akita-method.deleted.*
rm -rf "$HOME"/.claude/commands/super-power.backup.*
rm -rf "$HOME"/.claude/commands/super-power.deleted.*
```

> **Cuidado com expansão de globs:** se não houver matches, `rm -rf` pode dar erro. Usar `shopt -s nullglob` antes ou redirecionar erro.

### Passo 5 — Verificar e reportar

```bash
ls -d ~/.claude/skills/akita-method 2>/dev/null && echo "AINDA EXISTE" || echo "removido"
ls -d ~/.claude/commands/super-power 2>/dev/null && echo "AINDA EXISTE" || echo "removido"
```

Reportar ao utilizador:

```
✓ Claude Code Super Power desinstalado.

Modo: [SOFT/HARD/CLEAN-ALL]

[Se SOFT]
  Backups criados em:
    ~/.claude/skills/akita-method.deleted.<TS>
    ~/.claude/commands/super-power.deleted.<TS>

  Para recuperar:
    mv ~/.claude/skills/akita-method.deleted.<TS> ~/.claude/skills/akita-method
    mv ~/.claude/commands/super-power.deleted.<TS> ~/.claude/commands/super-power

[Se HARD ou CLEAN-ALL]
  Apagado definitivamente. Não há recuperação.

Para reinstalar:
  Cole no Claude Code:
    Instala o Claude Code Super Power para mim.
    Repositório: https://github.com/johnnyhelder/claude-code-super-power

  Ou via terminal:
    curl -sSL https://raw.githubusercontent.com/johnnyhelder/claude-code-super-power/main/install.sh | bash
```

## Alternativa: terminal directo

### Soft (com backup, terminal interactivo)

```bash
curl -sSL https://raw.githubusercontent.com/johnnyhelder/claude-code-super-power/main/uninstall.sh | bash
```

### Hard sem confirmação (curl|bash, scripts, Claude Code !)

```bash
curl -sSL https://raw.githubusercontent.com/johnnyhelder/claude-code-super-power/main/uninstall.sh | bash -s -- --hard --yes
```

### Limpeza total (hard + backups acumulados)

```bash
curl -sSL https://raw.githubusercontent.com/johnnyhelder/claude-code-super-power/main/uninstall.sh | bash -s -- --hard --yes --clean-backups
```

## Regras

- **Sempre confirmar** antes de tocar em qualquer ficheiro (a não ser que utilizador tenha passado argumento explícito)
- **Default = soft** quando ambíguo (mais seguro)
- **Hard só com confirmação dupla** ou argumento explícito
- **Nunca tocar** em ficheiros fora dos caminhos listados
- **Sempre verificar** após remoção e reportar resultado
