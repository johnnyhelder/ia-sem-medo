#!/bin/bash
# Script para completar a montagem do repositório ia-sem-medo
# Copia templates e skill do projeto de estudo para o repositório público

SOURCE="$HOME/Projetos/metodo-johnnyhelder/skills/akita-method"
DEST="$HOME/Projetos/ia-sem-medo"

echo "📋 Copiando templates..."
cp "$SOURCE/templates/CLAUDE-MD-TEMPLATE.md" "$DEST/templates/"
cp "$SOURCE/templates/DADOS-PROJETO-TEMPLATE.md" "$DEST/templates/"
cp "$SOURCE/templates/TESTES-BASE.md" "$DEST/templates/"
cp "$SOURCE/templates/CI-CD-TEMPLATE.md" "$DEST/templates/"

echo "🔧 Copiando skill..."
cp "$SOURCE/SKILL.md" "$DEST/skill/"

echo "📚 Copiando pesquisa resumo..."
cp "$HOME/Projetos/metodo-johnnyhelder/docs/fontes/pesquisa-metodo-akita-gemini.md" "$DEST/fontes/pesquisa-resumo.md"

echo ""
echo "✅ Repositório completo! Verifique a estrutura:"
echo ""
find "$DEST" -type f | sort | head -30
echo ""
echo "Próximo passo: cd $DEST && git init && git add . && git commit -m 'feat: repositório ia-sem-medo completo'"
