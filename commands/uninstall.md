---
description: Remove a skill e os slash commands do claude-code-super-power
argument-hint: ""
---

# /super-power:uninstall

Remove o `claude-code-super-power` do sistema do utilizador. **Não toca em projetos existentes.**

## O que vai ser removido

| Caminho | Conteúdo |
|---------|----------|
| `~/.claude/skills/akita-method/` | Skill orquestradora |
| `~/.claude/commands/super-power/` | 5 slash commands `/super-power:*` |

**O que NÃO é tocado:**
- Projetos do utilizador (qualquer pasta fora de `~/.claude/skills/akita-method/` e `~/.claude/commands/super-power/`)
- Outras skills em `~/.claude/skills/`
- Configuração geral do Claude Code

## O que o agente Claude Code deve fazer

### Passo 1 — Confirmar com o utilizador

> "Vou desinstalar o Claude Code Super Power. Isto vai mover (não apagar) duas pastas:
>
> - `~/.claude/skills/akita-method/` → `.deleted.<timestamp>`
> - `~/.claude/commands/super-power/` → `.deleted.<timestamp>`
>
> Os teus projetos NÃO são tocados. Os ficheiros podem ser recuperados depois.
>
> Confirmas? (sim/não)"

Se utilizador disser **não** ou hesitar: parar.
Se utilizador disser **sim**: avançar.

### Passo 2 — Verificar o que existe

```bash
[ -d "$HOME/.claude/skills/akita-method" ] && echo "skill: existe" || echo "skill: não existe"
[ -d "$HOME/.claude/commands/super-power" ] && echo "commands: existe" || echo "commands: não existe"
```

Se nenhum existir, reportar "Nada para desinstalar" e parar.

### Passo 3 — Mover (backup recuperável)

```bash
TS=$(date +%s)
[ -d "$HOME/.claude/skills/akita-method" ] && mv "$HOME/.claude/skills/akita-method" "$HOME/.claude/skills/akita-method.deleted.$TS"
[ -d "$HOME/.claude/commands/super-power" ] && mv "$HOME/.claude/commands/super-power" "$HOME/.claude/commands/super-power.deleted.$TS"
```

NÃO usar `rm -rf` directamente. Mover é reversível. Se o utilizador mudar de ideias, basta renomear de volta.

### Passo 4 — Reportar

```
✓ Claude Code Super Power desinstalado.

Backup criado em:
  ~/.claude/skills/akita-method.deleted.<TS>
  ~/.claude/commands/super-power.deleted.<TS>

Para recuperar:
  mv ~/.claude/skills/akita-method.deleted.<TS> ~/.claude/skills/akita-method
  mv ~/.claude/commands/super-power.deleted.<TS> ~/.claude/commands/super-power

Para apagar definitivamente:
  rm -rf ~/.claude/skills/akita-method.deleted.<TS>
  rm -rf ~/.claude/commands/super-power.deleted.<TS>

Para reinstalar:
  Cole no Claude Code:
    Instala o Claude Code Super Power para mim.
    Repositório: https://github.com/johnnyhelder/claude-code-super-power

  Ou via terminal:
    curl -sSL https://raw.githubusercontent.com/johnnyhelder/claude-code-super-power/main/install.sh | bash
```

## Alternativa via terminal

Se o utilizador prefere terminal directo:

```bash
curl -sSL https://raw.githubusercontent.com/johnnyhelder/claude-code-super-power/main/uninstall.sh | bash
```

O `uninstall.sh` faz exactamente o mesmo: confirma, move com backup timestamp, reporta.

## Regras

- **Sempre confirmar** antes de tocar em qualquer ficheiro
- **Mover, não apagar** — backup é reversível, `rm -rf` não
- **Nunca tocar** em ficheiros fora dos 2 caminhos listados
- **Se algo correr mal**, reportar erro completo ao utilizador
