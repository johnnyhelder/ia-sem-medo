#!/usr/bin/env bash
# claude-code-super-power — desinstalador
#
# Uso (interactivo, terminal real):
#   curl -sSL .../uninstall.sh | bash
#
# Uso (curl|bash sem TTY ou Claude Code):
#   curl -sSL .../uninstall.sh | bash -s -- --yes              # soft + skip confirm
#   curl -sSL .../uninstall.sh | bash -s -- --hard --yes        # hard + skip confirm
#   curl -sSL .../uninstall.sh | bash -s -- --hard --yes --clean-backups
#
# Flags:
#   --soft            (default) Move para .deleted.<timestamp> — recuperável
#   --hard            Apaga definitivamente (rm -rf) — irreversível
#   --yes, -y         Skip confirmação (obrigatório quando sem TTY)
#   --clean-backups   Também apaga .backup.* e .deleted.* acumulados
#   --help, -h        Mostra esta ajuda

set -euo pipefail

SKILL_DIR="${HOME}/.claude/skills/akita-method"
COMMANDS_DIR="${HOME}/.claude/commands/super-power"

# Flags (defaults)
MODE="soft"
SKIP_CONFIRM=false
CLEAN_BACKUPS=false

# Cores
G='\033[0;32m'
Y='\033[1;33m'
R='\033[0;31m'
B='\033[0;34m'
N='\033[0m'

print_help() {
  cat <<'EOF'
claude-code-super-power — desinstalador

Uso:
  uninstall.sh [flags]

Flags:
  --soft           (default) Move para .deleted.<timestamp> — recuperável
  --hard           Apaga definitivamente (rm -rf) — irreversível
  --yes, -y        Skip confirmação (obrigatório sem TTY interactivo)
  --clean-backups  Também apaga .backup.* e .deleted.* acumulados
  --help, -h       Mostra esta ajuda

Exemplos:
  # Terminal real, com confirmação interactiva (soft default)
  ./uninstall.sh

  # Hard sem confirmação (curl|bash, scripts, Claude Code !)
  curl -sSL .../uninstall.sh | bash -s -- --hard --yes

  # Limpeza total (apaga tudo + backups antigos acumulados)
  curl -sSL .../uninstall.sh | bash -s -- --hard --yes --clean-backups
EOF
}

# Parse flags
while [[ $# -gt 0 ]]; do
  case "$1" in
    --hard) MODE="hard"; shift ;;
    --soft) MODE="soft"; shift ;;
    --yes|-y) SKIP_CONFIRM=true; shift ;;
    --clean-backups) CLEAN_BACKUPS=true; shift ;;
    --help|-h) print_help; exit 0 ;;
    *) echo -e "${R}Flag desconhecida: $1${N}"; print_help; exit 1 ;;
  esac
done

echo ""
echo -e "${Y}╔════════════════════════════════════════════╗${N}"
echo -e "${Y}║  🗑️  Claude Code Super Power — desinstalar  ║${N}"
echo -e "${Y}╚════════════════════════════════════════════╝${N}"
echo ""
echo -e "Modo: ${B}${MODE}${N}  $([ "$MODE" = "hard" ] && echo -e "${R}(apaga definitivo)${N}" || echo -e "${G}(backup recuperável)${N}")"
$CLEAN_BACKUPS && echo -e "Limpeza de backups antigos: ${Y}sim${N}"
echo ""

# 1. Verificar o que existe
HAS_SKILL=false
HAS_COMMANDS=false
[ -d "$SKILL_DIR" ] && HAS_SKILL=true
[ -d "$COMMANDS_DIR" ] && HAS_COMMANDS=true

# Listar backups acumulados (usar shopt nullglob para evitar match literal se vazio)
shopt -s nullglob
SKILL_BACKUP_ARR=( "${SKILL_DIR}.backup."* "${SKILL_DIR}.deleted."* )
CMD_BACKUP_ARR=( "${COMMANDS_DIR}.backup."* "${COMMANDS_DIR}.deleted."* )
shopt -u nullglob

SKILL_BACKUPS=""
[ ${#SKILL_BACKUP_ARR[@]} -gt 0 ] && SKILL_BACKUPS=$(printf '%s\n' "${SKILL_BACKUP_ARR[@]}" | sort)

CMD_BACKUPS=""
[ ${#CMD_BACKUP_ARR[@]} -gt 0 ] && CMD_BACKUPS=$(printf '%s\n' "${CMD_BACKUP_ARR[@]}" | sort)

if ! $HAS_SKILL && ! $HAS_COMMANDS && [ -z "$SKILL_BACKUPS" ] && [ -z "$CMD_BACKUPS" ]; then
  echo -e "${G}✓${N} Nada para desinstalar. Sistema já está limpo."
  exit 0
fi

# 2. Mostrar o que vai ser removido
echo "Vai ser removido:"
$HAS_SKILL && echo -e "  ${R}✗${N} ${SKILL_DIR}"
$HAS_COMMANDS && echo -e "  ${R}✗${N} ${COMMANDS_DIR}"

if $CLEAN_BACKUPS; then
  if [ -n "$SKILL_BACKUPS" ]; then
    echo "  Backups da skill:"
    echo "$SKILL_BACKUPS" | sed "s|^|    ${R}✗${N} |"
  fi
  if [ -n "$CMD_BACKUPS" ]; then
    echo "  Backups dos commands:"
    echo "$CMD_BACKUPS" | sed "s|^|    ${R}✗${N} |"
  fi
fi

echo ""
echo -e "${Y}Os teus projetos NÃO são tocados. Só removo a skill global e os slash commands.${N}"
echo ""

# 3. Confirmação (skip se --yes)
if ! $SKIP_CONFIRM; then
  # Detectar TTY disponível
  TTY_AVAILABLE=false
  if [ -t 0 ]; then
    TTY_AVAILABLE=true
    TTY_SOURCE="/dev/stdin"
  elif [ -e /dev/tty ] && [ -r /dev/tty ]; then
    TTY_AVAILABLE=true
    TTY_SOURCE="/dev/tty"
  fi

  if ! $TTY_AVAILABLE; then
    echo -e "${R}✗ Sem terminal interactivo (estás a correr via curl|bash, script, ou ! do Claude Code).${N}"
    echo ""
    echo "Para confirmar sem prompt, adiciona ${G}--yes${N}:"
    echo -e "  ${G}curl -sSL .../uninstall.sh | bash -s -- --${MODE} --yes${N}"
    if $CLEAN_BACKUPS; then
      echo -e "  ${G}curl -sSL .../uninstall.sh | bash -s -- --${MODE} --yes --clean-backups${N}"
    fi
    echo ""
    echo "Ou abre um terminal real e corre directamente:"
    echo -e "  ${G}curl -sSL .../uninstall.sh -o /tmp/u.sh && bash /tmp/u.sh${N}"
    exit 1
  fi

  if [ "$MODE" = "hard" ]; then
    PROMPT="${R}MODO HARD — apaga definitivamente.${N} Digita 'sim apaga tudo': "
    EXPECTED="sim apaga tudo"
  else
    PROMPT="Tens a certeza? (digita 'sim'): "
    EXPECTED="sim"
  fi

  read -p "$(echo -e "$PROMPT")" -r CONFIRM < "$TTY_SOURCE"

  if [ "$CONFIRM" != "$EXPECTED" ]; then
    echo -e "${G}Cancelado.${N} Nada foi removido."
    exit 0
  fi
fi

# 4. Executar a remoção
TS=$(date +%s)

remove_path() {
  local path="$1"
  local name="$2"
  if [ ! -e "$path" ]; then
    return 0
  fi
  if [ "$MODE" = "hard" ]; then
    rm -rf "$path"
    echo -e "${G}✓${N} ${name} apagado: ${path}"
  else
    local backup="${path}.deleted.${TS}"
    mv "$path" "$backup"
    echo -e "${G}✓${N} ${name} movido para: ${backup}"
  fi
}

$HAS_SKILL && remove_path "$SKILL_DIR" "Skill"
$HAS_COMMANDS && remove_path "$COMMANDS_DIR" "Commands"

# 5. Clean backups antigos (sempre rm -rf, é o ponto)
if $CLEAN_BACKUPS; then
  if [ -n "$SKILL_BACKUPS" ]; then
    echo "$SKILL_BACKUPS" | while IFS= read -r bkp; do
      [ -n "$bkp" ] && rm -rf "$bkp" && echo -e "${G}✓${N} Backup apagado: $bkp"
    done
  fi
  if [ -n "$CMD_BACKUPS" ]; then
    echo "$CMD_BACKUPS" | while IFS= read -r bkp; do
      [ -n "$bkp" ] && rm -rf "$bkp" && echo -e "${G}✓${N} Backup apagado: $bkp"
    done
  fi
fi

echo ""
echo -e "${G}╔════════════════════════════════════════════╗${N}"
echo -e "${G}║  Desinstalação concluída                   ║${N}"
echo -e "${G}╚════════════════════════════════════════════╝${N}"
echo ""

if [ "$MODE" = "soft" ]; then
  echo "Os ficheiros foram MOVIDOS (não apagados). Recuperar:"
  $HAS_SKILL && echo "  mv ${SKILL_DIR}.deleted.${TS} ${SKILL_DIR}"
  $HAS_COMMANDS && echo "  mv ${COMMANDS_DIR}.deleted.${TS} ${COMMANDS_DIR}"
  echo ""
  echo "Apagar definitivamente os backups (quando tiveres a certeza):"
  $HAS_SKILL && echo "  rm -rf ${SKILL_DIR}.deleted.${TS}"
  $HAS_COMMANDS && echo "  rm -rf ${COMMANDS_DIR}.deleted.${TS}"
  echo ""
fi

echo "Reinstalar:"
echo "  curl -sSL https://raw.githubusercontent.com/johnnyhelder/claude-code-super-power/main/install.sh | bash"
echo ""
