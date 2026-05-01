#!/usr/bin/env bash
# claude-code-super-power — instalador
#
# Uso:
#   curl -sSL https://raw.githubusercontent.com/johnnyhelder/claude-code-super-power/main/install.sh | bash
#
# O que faz:
#   1. Clona o repositório para uma pasta temporária
#   2. Copia a skill `akita-method` para ~/.claude/skills/
#   3. Copia os slash commands para ~/.claude/commands/super-power/
#   4. Sugere próximo passo: /super-power:research
#
# Não toca em nenhum projeto. Só configura o Claude Code globalmente.

set -euo pipefail

REPO="https://github.com/johnnyhelder/claude-code-super-power.git"
BRANCH="main"
SKILLS_DIR="${HOME}/.claude/skills"
COMMANDS_DIR="${HOME}/.claude/commands"
TARGET_SKILL="${SKILLS_DIR}/akita-method"
TARGET_COMMANDS="${COMMANDS_DIR}/super-power"

# Cores
G='\033[0;32m'
Y='\033[1;33m'
R='\033[0;31m'
B='\033[0;34m'
N='\033[0m'

echo ""
echo -e "${B}╔════════════════════════════════════════════╗${N}"
echo -e "${B}║   🦾 Claude Code Super Power — instalador  ║${N}"
echo -e "${B}╚════════════════════════════════════════════╝${N}"
echo ""

# 1. Verificar dependências
if ! command -v git >/dev/null 2>&1; then
  echo -e "${R}✗ git não encontrado. Instale antes de continuar.${N}"
  exit 1
fi

if ! command -v claude >/dev/null 2>&1; then
  echo -e "${Y}⚠ Claude Code não está no PATH.${N}"
  echo -e "${Y}  Vai instalar mesmo assim, mas precisa do Claude Code para usar.${N}"
  echo -e "${Y}  Ver: https://docs.claude.com/claude-code${N}"
  echo ""
fi

# 2. Pasta temporária
TMP_DIR=$(mktemp -d -t ccp-install-XXXXXX)
trap "rm -rf '$TMP_DIR'" EXIT

echo -e "${B}→${N} Clonando repositório..."
git clone --depth 1 --branch "$BRANCH" --quiet "$REPO" "$TMP_DIR/repo"

# 3. Verificar conteúdo esperado
if [ ! -d "$TMP_DIR/repo/skill/akita-method" ]; then
  echo -e "${R}✗ Estrutura do repositório inesperada (skill/akita-method/ não encontrada).${N}"
  exit 1
fi

if [ ! -d "$TMP_DIR/repo/commands" ]; then
  echo -e "${R}✗ Estrutura do repositório inesperada (commands/ não encontrada).${N}"
  exit 1
fi

# 4. Backup se já existir
if [ -d "$TARGET_SKILL" ]; then
  BACKUP="${TARGET_SKILL}.backup.$(date +%s)"
  echo -e "${Y}⚠${N} Skill já instalada. Backup: $BACKUP"
  mv "$TARGET_SKILL" "$BACKUP"
fi

if [ -d "$TARGET_COMMANDS" ]; then
  BACKUP="${TARGET_COMMANDS}.backup.$(date +%s)"
  echo -e "${Y}⚠${N} Commands já instalados. Backup: $BACKUP"
  mv "$TARGET_COMMANDS" "$BACKUP"
fi

# 5. Instalar skill
echo -e "${B}→${N} Instalando skill em ${TARGET_SKILL}..."
mkdir -p "$SKILLS_DIR"
cp -r "$TMP_DIR/repo/skill/akita-method" "$TARGET_SKILL"

# 6. Instalar commands
echo -e "${B}→${N} Instalando commands em ${TARGET_COMMANDS}..."
mkdir -p "$COMMANDS_DIR"
cp -r "$TMP_DIR/repo/commands" "$TARGET_COMMANDS"

# 7. Verificar instalação
SKILL_COUNT=$(find "$TARGET_SKILL" -type f -name "*.md" | wc -l)
CMD_COUNT=$(find "$TARGET_COMMANDS" -type f -name "*.md" | wc -l)

echo ""
echo -e "${G}✓${N} Skill instalada (${SKILL_COUNT} ficheiros)"
echo -e "${G}✓${N} ${CMD_COUNT} slash commands disponíveis"
echo ""
echo -e "${B}╔════════════════════════════════════════════╗${N}"
echo -e "${B}║                Está pronto                  ║${N}"
echo -e "${B}╚════════════════════════════════════════════╝${N}"
echo ""
echo "  Agora, no Claude Code, escreve uma frase:"
echo ""
echo -e "    ${G}\"Que versão do super-power tenho?\"${N}      ← validar instalação"
echo -e "    ${G}\"Começa um projeto novo comigo\"${N}         ← arrancar Fase 0"
echo -e "    ${G}\"Atualiza o super-power\"${N}                ← upgrade futuro"
echo -e "    ${G}\"Desinstala o super-power\"${N}              ← uninstall"
echo -e "    ${G}\"Limpa os backups antigos\"${N}              ← cleanup"
echo ""
echo "  Preferes comandos? Escreve / e vê a lista. Comandos disponíveis:"
echo "    /super-power:research   — Fase 0: briefing + 7 perguntas + pesquisa"
echo "    /super-power:plan       — gera PLAN.md + CLAUDE.md + PROJECT.md + NOW.md"
echo "    /super-power:start      — Fase 1: setup seguro + stack"
echo "    /super-power:phase N    — avança para a Fase N (2-7)"
echo "    /super-power:status     — estado do projeto actual"
echo "    /super-power:version    — versão da skill + backups acumulados"
echo "    /super-power:update     — atualiza para versão mais recente"
echo "    /super-power:uninstall  — remove (soft/hard/clean-all/backups-only)"
echo ""
echo -e "Documentação: ${B}https://github.com/johnnyhelder/claude-code-super-power${N}"
echo -e "Apoiar (BTC): ${Y}bc1q2n4p3zge5sj2pecjwxwmgape39taydjtq88cm9${N}"
echo ""
