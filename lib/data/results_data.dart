import '../models/result_model.dart';

const results = {
  'C0': ResultContent(
    code: 'C0',
    title: 'Sem sinais visíveis ou palpáveis',
    description:
        'Não foram identificados sinais visíveis ou palpáveis compatíveis com varizes ou doença venosa aparente.',
    orientation:
        'Caso existam sintomas persistentes, desconforto ou piora progressiva, recomenda-se avaliação com profissional de saúde.',
  ),
  'C1': ResultContent(
    code: 'C1',
    title: 'Vasinhos ou pequenas veias visíveis',
    description:
        'As respostas indicam sinais compatíveis com telangiectasias ou veias reticulares, popularmente conhecidas como vasinhos ou pequenas veias visíveis.',
    orientation:
        'A avaliação profissional pode ser indicada em caso de sintomas, progressão dos sinais ou incômodo estético ou funcional.',
  ),
  'C2': ResultContent(
    code: 'C2',
    title: 'Veias varicosas',
    description:
        'As respostas indicam sinais compatíveis com veias varicosas, caracterizadas por veias dilatadas, tortuosas, salientes ou palpáveis, geralmente com diâmetro superior a 3 mm.',
    orientation:
        'Recomenda-se avaliação com profissional de saúde para confirmação clínica, diferenciação em relação a outras alterações vasculares e definição da conduta adequada.',
  ),
  'C3': ResultContent(
    code: 'C3',
    title: 'Inchaço compatível com edema',
    description:
        'As respostas indicam presença de edema, ou seja, inchaço frequente em pernas, tornozelos ou pés, possivelmente associado à doença venosa.',
    orientation:
        'O edema pode ter diferentes causas, incluindo alterações venosas, linfáticas, cardíacas, renais, medicamentosas ou inflamatórias. Recomenda-se avaliação profissional, principalmente quando o inchaço for intenso, unilateral, doloroso, progressivo ou associado a outros sintomas.',
  ),
  'C4': ResultContent(
    code: 'C4',
    title: 'Alterações na pele',
    description:
        'As respostas indicam alterações cutâneas possivelmente associadas à doença venosa crônica.',
    orientation:
        'Recomenda-se avaliação profissional, pois alterações cutâneas podem indicar doença venosa em estágio mais avançado ou outras condições clínicas que necessitam de diagnóstico diferencial.',
  ),
  'C4a': ResultContent(
    code: 'C4a',
    title: 'Pigmentação ou eczema',
    description:
        'As respostas indicam sinais compatíveis com pigmentação da pele ou eczema, alterações que podem estar associadas à doença venosa crônica.',
    orientation:
        'Recomenda-se avaliação profissional para confirmar a origem das alterações cutâneas e definir a conduta adequada.',
  ),
  'C4b': ResultContent(
    code: 'C4b',
    title: 'Pele endurecida ou atrofia branca',
    description:
        'As respostas indicam sinais compatíveis com pele endurecida, retraída ou áreas esbranquiçadas semelhantes a cicatriz, achados que podem corresponder a lipodermatoesclerose ou atrofia branca.',
    orientation:
        'Recomenda-se avaliação profissional, pois esse tipo de alteração pode indicar estágio mais avançado de doença venosa ou outras condições que precisam ser diferenciadas clinicamente.',
  ),
  'C4c': ResultContent(
    code: 'C4c',
    title: 'Vasos concentrados no tornozelo',
    description:
        'As respostas indicam presença de pequenos vasos concentrados ao redor do tornozelo ou região próxima ao pé, achado compatível com corona phlebectatica.',
    orientation:
        'Recomenda-se avaliação profissional para confirmação clínica e análise do contexto vascular do membro inferior.',
  ),
  'C5': ResultContent(
    code: 'C5',
    title: 'Ferida cicatrizada',
    description:
        'As respostas indicam histórico de ferida cicatrizada em região de perna ou tornozelo, achado compatível com estágio avançado de doença venosa.',
    orientation: 'Recomenda-se avaliação com profissional especializado.',
  ),
  'C6': ResultContent(
    code: 'C6',
    title: 'Ferida ativa',
    description:
        'As respostas indicam presença de ferida ativa em membro inferior, achado compatível com quadro que exige atenção clínica.',
    orientation:
        'Procure avaliação médica. Feridas abertas nos membros inferiores precisam ser investigadas para definição da causa e da conduta adequada.',
  ),
};
