# Como Aplicar em Projetos Novos (do Zero)

## O cenário

Você vai criar algo novo — um site, uma app, uma API, um bot. Ainda não existe código nenhum.

## O fluxo completo

### 1. Copie os templates para o seu projeto

```bash
mkdir meu-projeto
cp templates/PLAN-TEMPLATE.md meu-projeto/PLAN.md
cp templates/CLAUDE-MD-TEMPLATE.md meu-projeto/CLAUDE.md
cp templates/DADOS-PROJETO-TEMPLATE.md meu-projeto/DADOS-PROJETO.md
```

### 2. Preencha o DADOS-PROJETO.md
Antes de mais nada, responda: o que é o projeto? Para quem? O que precisa fazer?

### 3. Preencha o PLAN.md
Documente todas as funcionalidades, decisões técnicas e o que está FORA de escopo.

### 4. Preencha o CLAUDE.md
Este é o mais importante. Mínimo 200 linhas com: stack, estrutura de pastas, variáveis de ambiente, regras de código, regras de negócio.

### 5. Siga o Desafio dos 7 Dias
Com os documentos preenchidos, siga [`metodo/07-desafio-7-dias.md`](../metodo/07-desafio-7-dias.md):
- Dia 1: Ambiente
- Dia 2: Finalizar fundação
- Dia 3: Testes
- Dia 4: Código
- Dia 5: Otimização
- Dia 6: Interface
- Dia 7: Deploy

### O resultado
No final dos 7 dias você terá: projeto funcionando em produção, com testes automatizados, CI/CD pipeline, e documentação completa. Qualquer mudança futura será segura porque os testes pegam problemas antes do deploy.
