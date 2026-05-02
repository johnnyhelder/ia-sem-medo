#!/usr/bin/env bash
# claude-code-super-power — instalador
#
# Default: instala LOCALMENTE no projeto actual (.claude/skills/ + .claude/commands/)
# - Sem fricção com auto-mode classifier (não é self-modification global)
# - A skill funciona apenas neste projeto
# - Outros projetos não são afectados
#
# Para instalar globalmente (em ~/.claude/, todos os projetos):
#   curl -sSL .../install.sh | bash -s -- --global
#
# Flags:
#   --global       Instala em ~/.claude/ (todos os projetos)
#   --local        Instala em ./.claude/ (default — apenas neste projeto)
#   --help, -h     Mostra ajuda

set -euo pipefail

REPO="https://github.com/johnnyhelder/claude-code-super-power.git"
BRANCH="main"

# Default: local
SCOPE="local"

# Cores
G='\033[0;32m'
Y='\033[1;33m'
R='\033[0;31m'
B='\033[0;34m'
N='\033[0m'

print_help() {
  cat <<'EOF'
claude-code-super-power — instalador

Uso:
  curl -sSL .../install.sh | bash                    # local (default)
  curl -sSL .../install.sh | bash -s -- --global     # global (~/.claude/)

Flags:
  --local      Instala em .claude/ na pasta actual (default)
  --global     Instala em ~/.claude/ (todos os projetos)
  --help, -h   Mostra ajuda

Recomendado: --local (sem fricção de permissões).
EOF
}

# Parse flags
while [[ $# -gt 0 ]]; do
  case "$1" in
    --global) SCOPE="global"; shift ;;
    --local) SCOPE="local"; shift ;;
    --help|-h) print_help; exit 0 ;;
    *) echo -e "${R}Flag desconhecida: $1${N}"; print_help; exit 1 ;;
  esac
done

# Determinar destinos
if [ "$SCOPE" = "global" ]; then
  BASE_DIR="$HOME/.claude"
else
  BASE_DIR="$(pwd)/.claude"
fi

SKILLS_DIR="$BASE_DIR/skills"
COMMANDS_DIR="$BASE_DIR/commands"
TARGET_SKILL="$SKILLS_DIR/akita-method"
TARGET_COMMANDS="$COMMANDS_DIR/super-power"

echo ""
echo -e "${B}╔════════════════════════════════════════════╗${N}"
echo -e "${B}║   🦾 Claude Code Super Power — instalador  ║${N}"
echo -e "${B}╚════════════════════════════════════════════╝${N}"
echo ""
echo -e "Modo: ${B}${SCOPE}${N}"
echo -e "  Skill:    ${TARGET_SKILL}"
echo -e "  Commands: ${TARGET_COMMANDS}"
echo ""

# Verificar dependências
if ! command -v git >/dev/null 2>&1; then
  echo -e "${R}✗ git não encontrado. Instale antes de continuar.${N}"
  exit 1
fi

# Pasta temporária
TMP_DIR=$(mktemp -d -t ccsp-install-XXXXXX)
trap "rm -rf '$TMP_DIR'" EXIT

echo -e "${B}→${N} A clonar repositório..."
git clone --depth 1 --branch "$BRANCH" --quiet "$REPO" "$TMP_DIR/repo"

# Verificar conteúdo esperado
if [ ! -d "$TMP_DIR/repo/skills/akita-method" ] || [ ! -d "$TMP_DIR/repo/commands" ]; then
  echo -e "${R}✗ Estrutura do repositório inesperada.${N}"
  exit 1
fi

# Backup se já existir
if [ -d "$TARGET_SKILL" ]; then
  BACKUP="${TARGET_SKILL}.backup.$(date +%s)"
  echo -e "${Y}⚠${N} Skill já existe. Backup: $BACKUP"
  mv "$TARGET_SKILL" "$BACKUP"
fi

if [ -d "$TARGET_COMMANDS" ]; then
  BACKUP="${TARGET_COMMANDS}.backup.$(date +%s)"
  echo -e "${Y}⚠${N} Commands já existem. Backup: $BACKUP"
  mv "$TARGET_COMMANDS" "$BACKUP"
fi

# Instalar
echo -e "${B}→${N} A instalar skill..."
mkdir -p "$SKILLS_DIR"
cp -r "$TMP_DIR/repo/skills/akita-method" "$TARGET_SKILL"

echo -e "${B}→${N} A instalar commands..."
mkdir -p "$COMMANDS_DIR"
cp -r "$TMP_DIR/repo/commands" "$TARGET_COMMANDS"

# Verificar
SKILL_COUNT=$(find "$TARGET_SKILL" -type f -name "*.md" | wc -l | tr -d ' ')
CMD_COUNT=$(find "$TARGET_COMMANDS" -type f -name "*.md" | wc -l | tr -d ' ')

echo ""
echo -e "${G}✓${N} Skill instalada (${SKILL_COUNT} ficheiros)"
echo -e "${G}✓${N} ${CMD_COUNT} slash commands disponíveis"
echo ""
echo -e "${B}╔════════════════════════════════════════════╗${N}"
echo -e "${B}║                Está pronto                  ║${N}"
echo -e "${B}╚════════════════════════════════════════════╝${N}"
echo ""

if [ "$SCOPE" = "local" ]; then
  echo -e "  Skill activa ${G}apenas nesta pasta${N}: $(pwd)"
  echo "  Outros projetos não são afectados."
  echo ""
  echo "  Para usar em outro projeto, instala lá também (1 frase no Claude Code)."
  echo ""
fi

echo "  Agora, no Claude Code (nesta pasta), escreve:"
echo ""
echo -e "    ${G}\"Que versão do super-power tenho?\"${N}      ← validar instalação"
echo -e "    ${G}\"Começa um projeto novo comigo\"${N}         ← arrancar Fase 0"
echo -e "    ${G}\"Atualiza o super-power\"${N}                ← upgrade"
echo -e "    ${G}\"Desinstala o super-power\"${N}              ← uninstall"
echo ""
echo "  Slash commands disponíveis (escreve / para ver lista):"
echo "    /super-power:research   — Fase 0: briefing + 7 perguntas + pesquisa"
echo "    /super-power:plan       — gera PLAN.md + CLAUDE.md + PROJECT.md + NOW.md"
echo "    /super-power:start      — Fase 1: setup seguro + stack"
echo "    /super-power:phase N    — avança para a Fase N (2-7)"
echo "    /super-power:status     — estado do projeto"
echo "    /super-power:version    — versão da skill"
echo "    /super-power:update     — atualiza para versão mais recente"
echo "    /super-power:uninstall  — remove (soft/hard/clean-all/backups-only)"
echo ""
echo -e "Documentação: ${B}https://github.com/johnnyhelder/claude-code-super-power${N}"
echo -e "Apoiar (BTC): ${Y}bc1q2n4p3zge5sj2pecjwxwmgape39taydjtq88cm9${N}"
