# Template: Testes Base por Tipo de Projeto

> Usar como referência para a Fase 3 (TDD).
> Adaptar ao framework e linguagem do projeto.
> Objetivo: criar testes que FALHEM antes da implementação.

---

## Para Sites Estáticos (Astro, Hugo, Next SSG, etc.)

### Build
```
✓ Build completa sem erros
✓ Todas as páginas geradas no dist/
✓ Assets (CSS, JS, imagens) presentes no dist/
✓ Nenhum link quebrado (href para páginas que não existem)
```

### SEO
```
✓ Toda página tem <title> único
✓ Toda página tem meta description
✓ Nenhuma imagem sem atributo alt
✓ Schema markup presente (se aplicável)
✓ sitemap.xml gerado
✓ robots.txt correto
✓ Canonical URLs presentes
✓ Open Graph tags em todas as páginas
✓ Heading hierarchy correto (H1 → H2 → H3, sem saltos)
```

### Conteúdo (se tem blog)
```
✓ Todos os artigos têm frontmatter válido (title, description, date)
✓ Nenhum artigo com menos de [X] palavras
✓ Todo artigo tem CTA (call to action)
✓ Slugs corretos e sem duplicatas
✓ Imagens de destaque presentes
```

### Acessibilidade
```
✓ Aria-labels em botões sem texto
✓ Contraste mínimo WCAG AA (ratio > 4.5:1)
✓ Navegação por teclado funcional
✓ Skip-to-content link
✓ Focus visible em elementos interativos
```

### Performance
```
✓ Lighthouse Performance > 90
✓ Lighthouse Accessibility > 90
✓ Lighthouse Best Practices > 90
✓ Lighthouse SEO > 90
✓ Imagens otimizadas (WebP, lazy loading)
```

---

## Para APIs (Express, Rails, FastAPI, etc.)

### Endpoints
```
✓ Cada endpoint retorna status code correto (200, 201, 400, 401, 404, 500)
✓ Respostas em formato JSON válido
✓ Campos obrigatórios presentes na resposta
✓ Validação de input (rejeitar dados inválidos com 400)
✓ Erros retornam mensagem descritiva
```

### Autenticação (se aplicável)
```
✓ Rotas protegidas retornam 401 sem token
✓ Token válido permite acesso
✓ Token expirado retorna 401
✓ Roles/permissões funcionam (admin vs user)
```

### Base de Dados
```
✓ Migrations rodam sem erros
✓ Seeds populam dados de teste
✓ Queries não fazem N+1
✓ Indexes existem para campos de busca frequente
✓ Dados sensíveis encriptados
```

### Segurança
```
✓ Rate limiting ativo
✓ CORS configurado corretamente
✓ Headers de segurança presentes (HSTS, X-Frame-Options, etc.)
✓ SQL injection bloqueado
✓ XSS sanitizado
```

---

## Para Apps Frontend (React, Vue, Svelte, etc.)

### Componentes
```
✓ Cada componente renderiza sem erros
✓ Props obrigatórias validadas
✓ Estados de loading, erro e vazio tratados
✓ Componentes responsivos (mobile, tablet, desktop)
```

### Navegação
```
✓ Todas as rotas acessíveis
✓ 404 para rotas inexistentes
✓ Navegação por browser back/forward funciona
✓ Deep links funcionam
```

### Formulários
```
✓ Validação client-side funciona
✓ Mensagens de erro claras
✓ Submit desabilitado durante envio
✓ Feedback de sucesso/erro após submit
```

---

## Para Bots (Discord, Telegram, WhatsApp, etc.)

### Comandos
```
✓ Cada comando retorna resposta esperada
✓ Comando inválido retorna mensagem de ajuda
✓ Rate limiting por utilizador
✓ Erros não fazem o bot crashar
```

### Fluxos
```
✓ Fluxo completo de conversa funciona (início → fim)
✓ Timeout de inatividade tratado
✓ Mensagens grandes truncadas corretamente
✓ Caracteres especiais não quebram o parser
```

---

## Padrão Geral (qualquer projeto)

### Qualidade de Código
```
✓ Lint passa sem erros
✓ Sem variáveis não utilizadas
✓ Sem imports não utilizados
✓ Sem console.log / print de debug
✓ Sem secrets/chaves hardcoded
```

### CI/CD
```
✓ Pipeline roda sem erros
✓ Falha no teste bloqueia deploy
✓ Build reproduzível (mesma versão de dependências)
```
