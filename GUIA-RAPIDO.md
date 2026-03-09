# Guia Rápido — Comece em 5 Minutos

> Versão express do método para quem quer começar agora.
> Para a versão completa, leia os documentos na pasta `metodo/`.

---

## Pré-requisitos

- Um computador com terminal (Windows, Mac ou Linux)
- Uma conta no [Claude](https://claude.ai) ou acesso a qualquer agente de IA
- Vontade de aprender fazendo

Não precisa saber programar para começar. O método guia você.

---

## Passo 1 — Escolha um projeto pequeno

Não comece com "um SaaS que vai mudar o mundo". Comece com algo simples:

- Um site pessoal
- Uma landing page para seu negócio
- Um blog
- Uma calculadora útil
- Um bot simples

O projeto é para **aprender o método**, não para ganhar dinheiro (ainda).

---

## Passo 2 — Copie os templates

Pegue os templates deste repositório e coloque no seu projeto:

```bash
# Clone o repositório
git clone https://github.com/johnnyhelder/ia-sem-medo.git

# Copie os templates para seu projeto
cp ia-sem-medo/templates/PLAN-TEMPLATE.md seu-projeto/PLAN.md
cp ia-sem-medo/templates/CLAUDE-MD-TEMPLATE.md seu-projeto/CLAUDE.md
cp ia-sem-medo/templates/DADOS-PROJETO-TEMPLATE.md seu-projeto/DADOS-PROJETO.md
```

---

## Passo 3 — Preencha o PLAN.md

Abra o PLAN.md e responda com sinceridade:

- **O que você quer criar?** (1-2 frases)
- **Para quem?** (quem vai usar)
- **O que precisa funcionar?** (liste todas as funcionalidades)
- **O que NÃO vai fazer agora?** (isso é tão importante quanto o que vai)

Não precisa ser bonito. Precisa ser claro.

---

## Passo 4 — Preencha o CLAUDE.md

Este é o ficheiro que a IA vai ler para entender seu projeto. Quanto mais detalhado, melhores os resultados. No mínimo, preencha:

- Que tecnologias vai usar (e por quê)
- Como as pastas estão organizadas
- Regras que a IA deve seguir

Se não sabe que tecnologias usar, pergunte à IA: *"Quero criar [seu projeto]. Quais tecnologias você recomenda e por quê?"* — mas a decisão final é sua.

---

## Passo 5 — Siga o Desafio dos 7 Dias

Com o PLAN.md e CLAUDE.md prontos, siga o desafio:

| Dia | O que fazer | Dica |
|-----|-------------|------|
| **1** | Monte o ambiente | Crie uma pasta, instale as ferramentas |
| **2** | Finalize o planejamento | PLAN.md + CLAUDE.md completos. ZERO código |
| **3** | Escreva os testes | Peça à IA: "escreva os testes para [feature]" |
| **4** | Escreva o código | Peça à IA: "implemente para que os testes passem" |
| **5** | Otimize | Melhore o que está feio, verifique performance |
| **6** | Polir a interface | A cara do projeto: design, textos, detalhes |
| **7** | Deploy | Coloque no ar com pipeline automática |

> 💡 **Dica:** 1-2 horas por dia é suficiente. Se um dia precisar de mais tempo, quebre em dois.

Guia completo: [`metodo/07-desafio-7-dias.md`](metodo/07-desafio-7-dias.md)

---

## As 3 regras de ouro

### 1. Nunca aceite código que você não entende
Se a IA gerou algo e você não sabe o que faz, peça para ela explicar. Se ainda não entendeu, peça para simplificar. Não cole código às cegas.

### 2. Teste antes, código depois
Parece contraintuitivo, mas funciona: primeiro descreva o que o código DEVE fazer (teste), depois peça o código. Assim você sabe se funcionou.

### 3. Se a IA errar, ensine — não corrija
Quando a IA fizer algo errado, não vá lá e mude o código na mão. Explique o erro de volta para ela. E anote o erro no CLAUDE.md para que não se repita.

---

## Próximos passos

Depois de completar o Desafio dos 7 Dias:

1. **Leia os documentos do método** na pasta `metodo/` para entender a teoria por trás
2. **Use a Skill** (pasta `skill/`) se você usa Claude — ela automatiza o fluxo
3. **Aplique num projeto real** — agora com confiança
4. **Contribua** — compartilhe sua experiência em [CONTRIBUTING.md](CONTRIBUTING.md)

---

## Dúvidas frequentes

**"Qual IA devo usar?"**
Qualquer uma funciona. O método não depende de uma IA específica. Claude, ChatGPT, Gemini, Copilot — o princípio é o mesmo: você pensa, ela executa.

**"Preciso saber programar?"**
Ajuda, mas não é obrigatório. O método ensina você a **pensar como engenheiro** mesmo antes de escrever código. A IA faz a parte técnica, você faz a parte estratégica.

**"Quanto tempo leva?"**
O Desafio dos 7 Dias pode ser feito em 7-14 dias reais, dedicando 1-2 horas por dia. Depois disso, cada novo projeto fica mais rápido.

**"E se eu já sei programar?"**
Melhor ainda. Pule o básico e foque nos testes (Fase 3) e no CI/CD (Fase 7) — que é provavelmente o que está faltando nos seus projetos.
