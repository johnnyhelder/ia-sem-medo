# 06 — Ferramentas: O que Usar (e o que Evitar)

## O princípio

A ferramenta não faz o método. Qualquer IA, qualquer linguagem, qualquer framework funciona — desde que você siga os princípios (planejamento, testes, documentação). Dito isso, algumas ferramentas facilitam.

## IA e Agentes

| Ferramenta | Descrição |
|------------|-----------|
| **Claude Code** | Agente no terminal com acesso ao projeto (preferido do Akita) |
| **Claude / ChatGPT / Gemini** | Para chat e planejamento |
| **Cursor / WindSurf / Copilot** | IA integrada no editor |
| **Ollama + Qwen** | LLMs rodando localmente |

O importante não é QUAL IA, mas COMO você usa.

## Stacks recomendadas (por tipo de projeto)

### Site estático / Blog
- Astro ou Hugo + Tailwind CSS
- Deploy: Vercel ou Netlify
- Testes: Vitest

### Aplicação Web
- Next.js ou Ruby on Rails
- Banco: SQLite (simples) ou PostgreSQL (complexo)
- Deploy: Vercel ou VPS + Kamal
- Testes: Vitest ou RSpec

### API
- Express, FastAPI, Rails API, Go
- Banco: PostgreSQL ou SQLite
- Deploy: VPS + Docker
- Testes: Jest, Pytest, RSpec

### Bot
- Discord.js, Telegram Bot API
- Deploy: Cloud function ou VPS
- Testes: Framework da linguagem escolhida

## Tendência 2026: simplificar

O Akita defende simplificação radical:
- **Sai**: PostgreSQL, Redis, Sidekiq, Kubernetes
- **Entra**: SQLite, SolidQueue, SolidCache, Kamal em VPS
- **Motivo**: menos complexidade, menos custo, menos pontos de falha

## Segurança

| Ferramenta | Uso |
|------------|-----|
| Docker | Isolar o agente de IA |
| ai-jail (Rust) | Sandbox avançado para agentes |
| Brakeman / Snyk | Análise de vulnerabilidades |
| ESLint / Rubocop | Qualidade de código |
