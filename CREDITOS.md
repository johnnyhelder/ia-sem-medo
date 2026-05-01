# Créditos e Referências

Este repositório é uma **compilação e adaptação** do trabalho público de várias pessoas. Nada aqui existiria sem elas. Os textos deste repositório são originais — apenas os princípios foram estudados, organizados e documentados com nossas próprias palavras. Os links abaixo apontam às fontes originais para você ir direto à fonte.

---

## 🏆 Fábio Akita (Homenagem Principal)

**Fabio Makoto Akita** — engenheiro de software desde o início dos anos 1990, cofundador da [Codeminer 42](https://codeminer42.com), organizador de 9 edições da Rubyconf Brasil, autor do blog [AkitaOnRails.com](https://akitaonrails.com) desde 2006, e criador do canal [Akitando](https://youtube.com/@Akitando) no YouTube com 149 episódios.

O método documentado neste repositório foi extraído e adaptado dos princípios que ele pratica e compartilha há décadas — e que recentemente materializou num projeto real (The M.Akita Chronicles), onde criou 4 aplicações em 8 dias com 1.323 testes automatizados usando Claude Code como par de programação.

### Conteúdos originais do Akita usados como fonte

**Blog (akitaonrails.com):**
- [Do Zero à Pós-Produção em 1 Semana - Como usar IA em Projetos de Verdade](https://akitaonrails.com/2026/02/20/do-zero-a-pos-producao-em-1-semana-como-usar-ia-em-projetos-de-verdade-bastidores-do-the-m-akita-chronicles/) — Artigo central do método
- [Enviando Emails sem Spammar](https://akitaonrails.com/2026/02/17/enviando-emails-sem-spammar-bastidores-do-the-m-akita-chronicles/) — Bastidores: envio confiável de emails
- [Web Scrapping em 2026](https://akitaonrails.com/2026/02/18/web-scrapping-em-2026-bastidores-do-the-m-akita-chronicles/) — Bastidores: web scraping moderno
- [Jobs Assíncronos que sobrevivem ao Caos](https://akitaonrails.com/2026/02/19/jobs-asssincronos-que-sobrevivem-ao-caos-bastidores-do-the-m-akita-chronicles/) — Bastidores: processamento assíncrono
- Série completa "Bastidores do The M.Akita Chronicles" — tag [/themakitachronicles](https://akitaonrails.com/tags/themakitachronicles/)

**Vídeos do canal Akitando (YouTube):**
- [#130 - Rant: Projetos, TESTES e Estimativa](https://akitaonrails.com/2022/10/25/akitando-130-rant-projetos-testes-e-estimativa-rated-r/) — Sobre TDD e gestão de projetos
- [#120 - Discutindo Gestão](https://akitaonrails.com/2022/06/13/akitando-120-discutindo-gestao/) — Gestão de equipes e pessoas
- [#76 - Guia Definitivo de Aprendendo a Aprender](https://akitaonrails.com/2020/04/01/akitando-76-guia-definitivo-de-aprendendo-a-aprender-a-maior-bronca-da-sua-vida-rated-r/) — Método de aprendizado
- [#144 - Modelagem de Software é Difícil?](https://akitaonrails.com/) — "Ver" vs "Enxergar"

**Newsletter:**
- [The M.Akita Chronicles](https://themakitachronicles.com) — Newsletter semanal de tecnologia
- [Blog da Newsletter](https://blog.themakitachronicles.com) — Arquivo de edições

**GitHub:**
- [Prompt original da newsletter](https://gist.github.com/akitaonrails/d2a7983fc4c839b8071f5d0babaadf94) — O gist com mais de 1000 prompts

**Podcasts:**
- Flow Podcast (participações sobre carreira e IA)
- Inteligência LTDA (participações sobre tecnologia)
- Fora da Norma (42SP) — Episódio "Comece Pelo Básico"

---

## 🎬 Mano Davin

O vídeo ["O Método Fábio Akita para programar com IA"](https://www.youtube.com/watch?v=cWY7iBafw7I) do canal **Mano Davin** foi o ponto de partida para a organização deste método. Ele pegou os conceitos da live com o Akita e estruturou de forma acessível, incluindo o Desafio dos 7 Dias que adaptamos aqui.

---

## 🧠 Andrej Karpathy

[Andrej Karpathy](https://karpathy.ai) — pesquisador, ex-OpenAI, ex-Tesla AI. Em 2026 publicou [observações sobre como LLMs erram em código](https://x.com/karpathy/status/2015883857489522876), dando origem aos 4 princípios universais que estão pré-injetados no nosso `CLAUDE-MD-TEMPLATE.md`:

1. **Pensar antes de codar** — trazer suposições e trade-offs à tona
2. **Simplicidade primeiro** — código mínimo, sem features especulativas
3. **Mudanças cirúrgicas** — tocar só no que for necessário
4. **Execução orientada por objetivo** — definir critérios verificáveis

Detalhe completo: [`principios/4-principios-karpathy.md`](principios/4-principios-karpathy.md)

Karpathy também é o criador da metodologia [LLM Council](https://github.com/karpathy/llm-council) (5 conselheiros revisando decisões caras), que documentamos em [`ferramentas/llm-council.md`](ferramentas/llm-council.md).

---

## 🛠️ Forrest Chang ([@forrestchang](https://github.com/forrestchang))

Forrest empacotou as observações do Karpathy num único `CLAUDE.md` reutilizável e publicou no GitHub em janeiro de 2026. O repositório [forrestchang/andrej-karpathy-skills](https://github.com/forrestchang/andrej-karpathy-skills) tem **104k estrelas** e foi a fonte direta para a Parte A do nosso template de CLAUDE.md.

Licença: MIT.

---

## 🤖 Anthropic

[Anthropic](https://www.anthropic.com) — criadora do Claude e do Claude Code. Publicaram um [artefacto público](https://claude.ai/public/artifacts/39364733-b29a-443b-8ca2-a6e57977fbb0) de template de `CLAUDE.md` com 4 princípios universais + bloco específico de projeto que serviu de base para o nosso template.

---

## 📊 Safi Shamsi ([@safishamsi](https://github.com/safishamsi))

Criador do [graphify](https://github.com/safishamsi/graphify) — skill que transforma qualquer pasta de ficheiros (código, docs, papers, imagens) num grafo de conhecimento navegável com auditoria honesta (EXTRACTED / INFERRED / AMBIGUOUS).

Documentamos como integrar ao método em [`ferramentas/graphify.md`](ferramentas/graphify.md). Especialmente útil na Fase 0 (mapear codebase legacy) e na Fase 5 (validar arquitectura).

---

## 📺 Gestor de Audiência ([@gestordeaudiencia](https://instagram.com/gestordeaudiencia))

Criou a versão PT-BR do LLM Council ([gestordeaudiencia/llm-council-skill-ptbr](https://github.com/gestordeaudiencia/llm-council-skill-ptbr)) e publicou um tutorial passo-a-passo de instalação para utilizadores zero-tech. O estilo visual desse tutorial (quadros DICA / ATENÇÃO / IMPORTANTE) inspirou parte do README deste repositório.

Curso: [cloudcoding.com.br/comece](https://cloudcoding.com.br/comece)

---

## 📚 Conceitos de Terceiros

**Zaraton Viana** (Liderança de Engenharia, Quinto Andar):
- Conceito "Build to Earn" vs "Build to Learn" — mencionado no podcast PR Guru

**Kent Beck:**
- Extreme Programming (XP) — framework base do método
- Test-Driven Development (TDD)

**Livros recomendados pelo Akita:**
- *Peopleware* — Tom DeMarco
- *Becoming a Technical Leader* — Gerald Weinberg
- *Ultra Aprendizado* — Scott Young

---

## 🛠️ Feito por

**Johnny Helder** — [johnnyhelder.com](https://johnnyhelder.com)

Estudou, extraiu, organizou e testou este método em projetos reais. O processo completo de como isso foi feito está em [COMO-FOI-FEITO.md](COMO-FOI-FEITO.md).

---

## Nota sobre direitos

Todo o conteúdo deste repositório é uma **interpretação e adaptação** de princípios públicos. Os textos aqui são originais, escritos com base no estudo das fontes acima. Nenhum texto dos autores originais foi reproduzido — apenas os princípios foram estudados, organizados e documentados com nossas próprias palavras.

Se algum autor mencionado tiver objeções, entre em contacto e ajustaremos imediatamente.
