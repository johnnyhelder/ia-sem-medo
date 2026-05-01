# Template: CI/CD Pipeline

> Usar como referência para a Fase 7 (Deploy).
> Escolher o template adequado ao projeto e adaptar.

---

## GitHub Actions — Site Estático (Vercel)

```yaml
name: Deploy
on:
  push:
    branches: [main]
  pull_request:
    branches: [main]

jobs:
  test-and-deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4

      - name: Setup Node
        uses: actions/setup-node@v4
        with:
          node-version: 20
          cache: 'npm'
          cache-dependency-path: site/package-lock.json

      - name: Install
        run: cd site && npm ci

      - name: Lint
        run: cd site && npm run lint

      - name: Test
        run: cd site && npm test

      - name: Build
        run: cd site && npm run build

      - name: Deploy to Vercel
        if: github.event_name == 'push' && github.ref == 'refs/heads/main'
        uses: amondnet/vercel-action@v25
        with:
          vercel-token: ${{ secrets.VERCEL_TOKEN }}
          vercel-org-id: ${{ secrets.ORG_ID }}
          vercel-project-id: ${{ secrets.PROJECT_ID }}
          vercel-args: '--prod'
```

---

## GitHub Actions — API com Docker (VPS + Kamal)

```yaml
name: Deploy API
on:
  push:
    branches: [main]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4

      - name: Setup
        run: |
          # Adaptar ao runtime do projeto (Ruby, Node, Python, Go)
          # Exemplo Ruby:
          # uses: ruby/setup-ruby@v1
          # with: { ruby-version: 3.3 }

      - name: Install
        run: bundle install  # ou npm ci, pip install, etc.

      - name: Lint
        run: bundle exec rubocop  # ou npm run lint, etc.

      - name: Security
        run: bundle exec brakeman  # ou npm audit, etc.

      - name: Test
        run: bundle exec rspec  # ou npm test, pytest, etc.

  deploy:
    needs: test
    if: github.ref == 'refs/heads/main'
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4

      - name: Deploy with Kamal
        run: |
          gem install kamal
          kamal deploy
        env:
          KAMAL_REGISTRY_PASSWORD: ${{ secrets.KAMAL_REGISTRY_PASSWORD }}
```

---

## GitHub Actions — Monorepo (múltiplos serviços)

```yaml
name: CI Monorepo
on:
  push:
    branches: [main]
  pull_request:

jobs:
  detect-changes:
    runs-on: ubuntu-latest
    outputs:
      frontend: ${{ steps.changes.outputs.frontend }}
      backend: ${{ steps.changes.outputs.backend }}
    steps:
      - uses: actions/checkout@v4
      - uses: dorny/paths-filter@v3
        id: changes
        with:
          filters: |
            frontend:
              - 'frontend/**'
            backend:
              - 'backend/**'

  test-frontend:
    needs: detect-changes
    if: needs.detect-changes.outputs.frontend == 'true'
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - run: cd frontend && npm ci && npm test

  test-backend:
    needs: detect-changes
    if: needs.detect-changes.outputs.backend == 'true'
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - run: cd backend && npm ci && npm test

  integration:
    needs: [test-frontend, test-backend]
    if: always() && !cancelled()
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - run: docker compose -f docker-compose.test.yml up --abort-on-container-exit
```

---

## Checklist de Deploy (qualquer projeto)

Antes de fazer o primeiro deploy, verificar:

- [ ] Variáveis de ambiente configuradas no servidor/plataforma
- [ ] Secrets do GitHub configurados (tokens, chaves)
- [ ] Domínio apontando para o servidor correto
- [ ] SSL ativo e a funcionar
- [ ] Redirects configurados (www → non-www ou vice-versa)
- [ ] Ficheiro .env.example atualizado (sem valores reais)
- [ ] README com instruções de setup para novo developer
- [ ] Backup configurado (se tem banco de dados)
- [ ] Monitoring básico ativo (uptime check)
- [ ] Google Search Console configurado (se é site público)
- [ ] Analytics configurado (se aplicável)
