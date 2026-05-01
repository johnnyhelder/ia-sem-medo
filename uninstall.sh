#!/usr/bin/env bash
# claude-code-super-power — desinstalador
#
# Uso:
#   curl -sSL https://raw.githubusercontent.com/johnnyhelder/claude-code-super-power/main/uninstall.sh | bash
#
# O que faz:
#   1. Pede confirmação
#   2. Remove ~/.claude/skills/akita-method/
#   3. Remove ~/.claude/commands/super-power/
#   4. NÃO toca em projetos existentes
#   5. Faz backup com timestamp em vez de apagar (recuperável se mudares de ideias)

set -euo pipefail

SKILL_DIR="${HOME}/.claude/skills/akita-method"
COMMANDS_DIR="${HOME}/.claude/commands/super-power"

# Cores
G='\033[0;32m'
Y='\033[1;33m'
R='\033[0;31m'
B='\033[0;34m'
N='\033[0m'

echo ""
echo -e "${Y}╔════════════════════════════════════════════╗${N}"
echo -e "${Y}║  🗑️  Claude Code Super Power — desinstalar  ║${N}"
echo -e "${Y}╚════════════════════════════════════════════╝${N}"
echo ""

# 1. Verificar o que existe
HAS_SKILL=false
HAS_COMMANDS=false
[ -d "$SKILL_DIR" ] && HAS_SKILL=true
[ -d "$COMMANDS_DIR" ] && HAS_COMMANDS=true

if ! $HAS_SKILL && ! $HAS_COMMANDS; then
  echo -e "${G}✓${N} Nada para desinstalar. Nem skill nem commands existem."
  echo "  ${SKILL_DIR}: não existe"
  echo "  ${COMMANDS_DIR}: não existe"
  exit 0
fi

# 2. Mostrar o que vai ser removido
echo "Vai ser removido:"
$HAS_SKILL && echo -e "  ${R}✗${N} ${SKILL_DIR}"
$HAS_COMMANDS && echo -e "  ${R}✗${N} ${COMMANDS_DIR}"
echo ""
echo -e "${Y}Os teus projetos NÃO são tocados. Só removo a skill global e os slash commands.${N}"
echo ""

# 3. Confirmação (lê de /dev/tty mesmo quando rodado via curl | bash)
if [ -t 0 ]; then
  STDIN_SOURCE="/dev/stdin"
else
  STDIN_SOURCE="/dev/tty"
fi

if [ ! -e "$STDIN_SOURCE" ]; then
  echo -e "${R}✗ Sem terminal interactivo disponível para confirmação.${N}"
  echo "  Para desinstalar manualmente, executa:"
  echo "    rm -rf $SKILL_DIR $COMMANDS_DIR"
  exit 1
fi

read -p "Tens a certeza? (digita 'sim' para confirmar): " -r CONFIRM < "$STDIN_SOURCE"

if [ "$CONFIRM" != "sim" ]; then
  echo -e "${G}Cancelado.${N} Nada foi removido."
  exit 0
fi

# 4. Backup com timestamp (não apaga, move — recuperável)
TS=$(date +%s)

if $HAS_SKILL; then
  BACKUP_SKILL="${SKILL_DIR}.deleted.${TS}"
  mv "$SKILL_DIR" "$BACKUP_SKILL"
  echo -e "${G}✓${N} Skill movida para: ${BACKUP_SKILL}"
fi

if $HAS_COMMANDS; then
  BACKUP_CMD="${COMMANDS_DIR}.deleted.${TS}"
  mv "$COMMANDS_DIR" "$BACKUP_CMD"
  echo -e "${G}✓${N} Commands movidos para: ${BACKUP_CMD}"
fi

echo ""
echo -e "${G}╔════════════════════════════════════════════╗${N}"
echo -e "${G}║  Desinstalação concluída                   ║${N}"
echo -e "${G}╚════════════════════════════════════════════╝${N}"
echo ""
echo "Os ficheiros foram MOVIDOS (não apagados). Se mudares de ideias:"
echo ""
$HAS_SKILL && echo "  mv ${BACKUP_SKILL} ${SKILL_DIR}"
$HAS_COMMANDS && echo "  mv ${BACKUP_CMD} ${COMMANDS_DIR}"
echo ""
echo "Para apagar definitivamente os backups:"
$HAS_SKILL && echo "  rm -rf ${BACKUP_SKILL}"
$HAS_COMMANDS && echo "  rm -rf ${BACKUP_CMD}"
echo ""
echo "Para reinstalar:"
echo "  curl -sSL https://raw.githubusercontent.com/johnnyhelder/claude-code-super-power/main/install.sh | bash"
echo ""
