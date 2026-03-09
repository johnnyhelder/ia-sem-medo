# Template: CI/CD Pipeline

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
      - uses: actions/setup-node@v4
        with:
          node-version: 20
          cache: 'npm'
      - run: npm ci
      - run: npm run lint
      - run: npm test
      - run: npm run build
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

## GitHub Actions — API (Node/Python/Ruby)

```yaml
name: CI
on: [push, pull_request]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with: { node-version: 20 }
      - run: npm ci
      - run: npm run lint
      - run: npm test
      - run: npm run build

  deploy:
    needs: test
    if: github.ref == 'refs/heads/main'
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - run: echo "Adicionar seu script de deploy aqui"
```

---

## Checklist de Deploy

- [ ] Variáveis de ambiente configuradas no servidor
- [ ] Secrets do GitHub configurados
- [ ] Domínio apontando corretamente
- [ ] SSL ativo
- [ ] .env.example atualizado (sem valores reais)
- [ ] README com instruções de setup
- [ ] Google Search Console configurado (se site público)
