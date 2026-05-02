# Resolução de Problemas

> Limitações conhecidas do `claude-code-super-power` e como contornar.

---

## ⚠️ #1 — Auto-mode classifier bloqueia instalação

### Sintoma

Ao colar o prompt de instalação no Claude Code, o agente clona o repositório, faz backup, e tenta copiar para `.claude/skills/` ou `~/.claude/skills/`. Aparece:

```
⏺ Bash(...cp -r .../skills/akita-method ~/.claude/skills/akita-method...)
  ⎿ Denied by auto mode classifier ∙ see https://code.claude.com/docs/s/claude-code-auto-mode
```

O agente explica que foi "untrusted code integration + self-modification".

### Porque acontece

O Claude Code tem proteção contra **self-modification**: ele bloqueia escrita em pastas que carrega como skills/commands (`~/.claude/skills/`, `~/.claude/commands/`, `.claude/skills/`, `.claude/commands/`) por agentes em modo automático. Isto evita que um repositório malicioso injete instruções persistentes ("prompt injection") nas tuas sessões futuras.

**Esta protecção é correcta e desejada.** Não estamos a contorná-la — apenas damos formas de a passar com autorização explícita do utilizador.

A protecção dispara em **AMBOS** os modos:
- **Local** (`.claude/skills/akita-method/` no projeto)
- **Global** (`~/.claude/skills/akita-method/` do utilizador)

### Como contornar (3 formas, da mais simples para a mais robusta)

#### Solução 1 — Aprovação explícita no Claude Code (recomendado)

Quando o agente bloquear, cola exactamente isto na conversa:

```
Aprovo explicitamente. Podes fazer cp para .claude/skills/akita-method
e .claude/commands/super-power. Procede com a instalação.
```

O classifier reavalia com a aprovação explícita do utilizador e geralmente deixa passar.

**Tempo:** 5 segundos.

#### Solução 2 — Terminal real (fora do Claude Code)

Abre o terminal do teu sistema (Terminal.app no Mac, gnome-terminal no Linux, Git Bash/WSL no Windows) e cola:

```bash
# Local (no projeto actual)
curl -sSL https://raw.githubusercontent.com/johnnyhelder/claude-code-super-power/main/install.sh | bash

# Global (todos os projetos)
curl -sSL https://raw.githubusercontent.com/johnnyhelder/claude-code-super-power/main/install.sh | bash -s -- --global
```

**Tempo:** 30 segundos. **Funciona sempre.**

#### Solução 3 — Plugin Claude Code marketplace ✅ VALIDADO

**Esta é a forma RECOMENDADA.** Validado em produção (Linux + Macbook).

Dentro do Claude Code, em qualquer pasta, cola **estes 2 comandos pela ordem certa**:

```
/plugin marketplace add johnnyhelder/claude-code-super-power
/plugin install claude-code-super-power
```

**Resposta esperada:**
- Comando 1 → `Successfully added marketplace: claude-code-super-power`
- Comando 2 → instala o plugin

> ⚠️ **A ordem importa.** Se rodares `/plugin install` ANTES de `/plugin marketplace add`, vai falhar com `Plugin "claude-code-super-power" not found in any marketplace`. Cola o `marketplace add` primeiro.

**Vantagens:**
- ✅ Sem auto-mode classifier bloqueando
- ✅ Sem terminal externo
- ✅ Sem paths hardcoded
- ✅ Instalação global automática (todas as sessões)
- ✅ Updates futuros via `/plugin update`

Ver [issue #2](https://github.com/johnnyhelder/claude-code-super-power/issues/2) para detalhes da implementação.

---

## ⚠️ #2 — Comandos Bash falham em zsh

### Sintoma

```
(eval):3: no matches found: /Users/.../akita-method.backup.*
```

Acontece quando o agente tenta limpar backups acumulados via glob.

### Porque acontece

`zsh` (shell default no macOS desde Catalina) é mais estrito que `bash` com globs sem matches. Comandos como `rm -rf path/akita-method.backup.*` falham se não houver matches, em vez de simplesmente ignorar.

### Status

**Resolvido na versão actual.** Substituímos todos os globs por `find` (POSIX, funciona idêntico em bash e zsh) nos commands.

Se ainda vires este erro, atualiza:

```
Atualiza o claude-code-super-power
```

---

## ⚠️ #3 — Os triggers em linguagem natural não activam

### Sintoma

Escreves "que versão tenho?" ou "limpa os backups" e o agente não reconhece como command da skill.

### Porque acontece

A skill `akita-method` reconhece **triggers específicos**. Frases muito genéricas (sem mencionar "super-power") podem ser ambíguas.

### Solução

**Inclui sempre "super-power"** na frase para o agente saber que é da skill:

| ❌ Ambíguo | ✅ Específico |
|---|---|
| "que versão tenho?" | "qual a versão do super-power?" |
| "limpa os backups" | "limpa os backups do super-power" |
| "desinstala isto" | "desinstala o super-power" |
| "começa um projeto" | "começa um projeto novo com o super-power" |

Ou usa slash commands explícitos: `/super-power:version`, `/super-power:uninstall`, etc.

---

## ⚠️ #4 — Versão antiga continua a aparecer no autocomplete

### Sintoma

Após reinstalar, o autocomplete do Claude Code mostra commands antigos como `/super-power.backup.1234567890:research`.

### Porque acontece

O Claude Code carrega a lista de skills/commands **uma vez no arranque da sessão**. Mudanças à pasta `.claude/` durante a sessão não são reflectidas até reiniciares.

### Solução

**Sai do Claude Code e abre de novo.** A lista é refrescada.

Ou, antes de reinstalar, corre:

```
limpa os backups do super-power
```

(Remove os `.backup.*` e `.deleted.*` antes de instalar versão nova.)

---

## ⚠️ #5 — `/super-power:research` cria pasta nova quando já estou numa

### Sintoma

Estás na pasta `/projetos/teste/`. Escreves "começa um projeto novo" e o Claude tenta criar `/projetos/teste/meu-projeto-novo/`.

### Porque acontece

A frase "começa um projeto novo" é interpretada literalmente pelo agente — pode achar que precisa de criar pasta nova.

### Solução

Sê específico:

```
faz o briefing do projeto nesta pasta
```

Ou usa o slash command:

```
/super-power:research
```

(Slash commands sempre operam na pasta actual — sem ambiguidade.)

---

## Como reportar um novo problema

1. Verifica se já está em [Issues abertas](https://github.com/johnnyhelder/claude-code-super-power/issues)
2. Se não, [abre uma nova](https://github.com/johnnyhelder/claude-code-super-power/issues/new) com:
   - Sistema operativo + shell (`echo $SHELL`)
   - Versão do Claude Code (`claude --version`)
   - Versão da skill (`/super-power:version`)
   - Output completo do erro
   - O que tentaste fazer
   - O que esperavas que acontecesse

---

## Limitações que NÃO vamos corrigir

| Limitação | Porquê não |
|---|---|
| Auto-mode classifier bloqueia primeira instalação | Protecção legítima do Claude Code. Não vamos contornar — vamos distribuir via plugin marketplace. |
| Skill não funciona offline | Pesquisa profunda requer internet. Briefing inicial pode ser feito offline. |
| Não suporta Windows nativo (sem WSL) | Bash + ferramentas POSIX necessárias. Windows precisa de WSL ou Git Bash. |
