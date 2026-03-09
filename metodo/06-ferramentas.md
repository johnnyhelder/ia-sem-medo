# 06 — Ferramentas e Stack

## Princípio: simplicidade vence

O Akita tem uma tendência clara em 2026: simplificar. Menos serviços, menos complexidade, menos pontos de falha. A escolha da ferramenta deve ser justificada pelo problema, não pelo hype.

## Stack do case study (The M.Akita Chronicles)

| Camada | Ferramenta | Por quê |
|--------|-----------|---------|
| Framework | Ruby on Rails 8 | Produtividade alta, convenções fortes |
| Banco de dados | SQLite | Simples, sem servidor separado, suficiente para o projeto |
| Filas/Jobs | SolidQueue | Nativo do Rails 8, substitui Redis + Sidekiq |
| Cache | SolidCache | Nativo do Rails 8, substitui Redis |
| Deploy | Kamal (em VPS) | Deploy zero-downtime sem Kubernetes |
| Email | Amazon SES | $0.10 por mil emails, escala sem mudar de plano |
| IA | Claude Code | Agente no terminal com acesso ao projeto |
| LLM | ruby-llm (gem) | Integração com múltiplos modelos |
| TTS | F5-TTS (RunPod) | Text-to-speech para podcast |
| Blog estático | Hugo + Hextra | Rápido, sem dependências pesadas |
| Estilos | Tailwind CSS v4 | Utilitário, sem CSS customizado |
| Sandbox | ai-jail (Rust) | Container isolado para o agente |

## Para quem está começando: o que realmente importa

Você não precisa usar a mesma stack do Akita. O método funciona com qualquer tecnologia. O importante é:

### Escolha um framework que resolva seu problema
- **Site estático/blog:** Astro, Hugo, Next.js (SSG), Eleventy
- **Aplicação web:** Next.js, Rails, Django, Laravel
- **API:** Express, FastAPI, Rails API, Go
- **Mobile:** React Native, Flutter

### Escolha um agente de IA
- **Claude Code** — agente no terminal, acesso ao projeto (o que o Akita usa)
- **Cursor / Windsurf** — editores com IA integrada
- **Claude.ai / ChatGPT** — chat no browser (funciona, mas com mais copiar/colar)
- **GitHub Copilot** — autocompletar no editor

### Escolha um provedor de deploy
- **Vercel** — deploys automáticos para Next.js/Astro (gratuito para projetos pequenos)
- **Netlify** — alternativa ao Vercel
- **VPS + Kamal** — para quem quer controle total (a escolha do Akita)
- **Railway / Render** — meio-termo entre simplicidade e controle

### Escolha um framework de testes
- **JavaScript/TypeScript:** Vitest, Jest
- **Ruby:** RSpec, Minitest
- **Python:** Pytest
- **Go:** testing (nativo)

## O que o Akita NÃO recomenda para projetos pequenos

- **Kubernetes** — complexidade desnecessária para 99% dos projetos
- **Microsserviços** — monolito bem feito > microsserviços prematuros
- **PostgreSQL + Redis** — SQLite + SolidQueue resolve a maioria dos casos
- **Over-engineering** — Clean Architecture em MVP é desperdício

## A regra de ouro

> Escolha a ferramenta mais simples que resolve o problema. Se depois precisar de mais, migre. Migrar de simples para complexo é fácil. De complexo para simples é doloroso.

---

> **Fonte:** Baseado nos conteúdos públicos de Fábio Akita. Ver [CREDITOS.md](../CREDITOS.md).
