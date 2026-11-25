import '../models/answer_model.dart';
import '../models/question_model.dart';

const yesNoUnknownOptions = [
  AnswerOption(value: AnswerValue.yes, label: 'Sim'),
  AnswerOption(value: AnswerValue.no, label: 'Não'),
  AnswerOption(value: AnswerValue.unknown, label: 'Não sei'),
];

const yesNoOptions = [
  AnswerOption(value: AnswerValue.yes, label: 'Sim'),
  AnswerOption(value: AnswerValue.no, label: 'Não'),
];

const symptomContextOptions = [
  AnswerOption(value: AnswerValue.yes, label: 'Sim'),
  AnswerOption(value: AnswerValue.no, label: 'Não'),
  AnswerOption(value: AnswerValue.notApplicable, label: 'Não se aplica'),
];

const questions = [
  QuestionModel(
    id: 'p01',
    shortTitle: 'Ferida ativa',
    text:
        'Você possui alguma ferida aberta na perna, tornozelo ou região próxima ao pé que ainda não cicatrizou?',
    options: yesNoUnknownOptions,
  ),
  QuestionModel(
    id: 'p02',
    shortTitle: 'Ferida cicatrizada',
    text:
        'Você já teve uma ferida na perna ou tornozelo que cicatrizou e deixou marca ou cicatriz?',
    options: yesNoUnknownOptions,
  ),
  QuestionModel(
    id: 'p03a',
    shortTitle: 'Pigmentação ou eczema',
    text:
        'Você percebe manchas escuras, alteração de cor da pele, vermelhidão, descamação, eczema ou coceira persistente na região da perna ou tornozelo?',
    options: yesNoUnknownOptions,
  ),
  QuestionModel(
    id: 'p03b',
    shortTitle: 'Pele endurecida',
    text:
        'Você percebe pele endurecida, região mais rígida, retraída, dolorida ou áreas esbranquiçadas parecidas com cicatriz na perna ou tornozelo?',
    options: yesNoUnknownOptions,
  ),
  QuestionModel(
    id: 'p03c',
    shortTitle: 'Vasos no tornozelo',
    text:
        'Você percebe muitos vasinhos ou pequenas veias azuladas/arroxeadas concentradas ao redor do tornozelo ou na região próxima ao pé?',
    options: yesNoUnknownOptions,
  ),
  QuestionModel(
    id: 'p04',
    shortTitle: 'Inchaço',
    text:
        'Você percebe inchaço frequente nas pernas, tornozelos ou pés, principalmente ao final do dia ou após ficar muito tempo em pé?',
    options: yesNoUnknownOptions,
  ),
  QuestionModel(
    id: 'p05',
    shortTitle: 'Veias varicosas',
    text:
        'Você possui veias dilatadas, tortuosas, saltadas ou palpáveis nas pernas, geralmente maiores que os vasinhos finos e com aparência elevada na pele?',
    options: yesNoUnknownOptions,
  ),
  QuestionModel(
    id: 'p06',
    shortTitle: 'Vasinhos',
    text:
        'Você possui vasinhos finos, avermelhados, azulados ou arroxeados, ou pequenas veias visíveis sob a pele?',
    options: yesNoUnknownOptions,
  ),
  QuestionModel(
    id: 'p07',
    shortTitle: 'Sintomas',
    text:
        'Você sente dor, peso, cansaço, queimação, coceira, câimbras ou sensação de pressão nas pernas?',
    options: yesNoOptions,
  ),
  QuestionModel(
    id: 'p08',
    shortTitle: 'Piora dos sintomas',
    text: 'Os sintomas pioram após ficar muito tempo em pé ou ao final do dia?',
    options: symptomContextOptions,
  ),
  QuestionModel(
    id: 'p09',
    shortTitle: 'Melhora com repouso',
    text:
        'Os sintomas melhoram quando você eleva as pernas ou fica em repouso?',
    options: symptomContextOptions,
  ),
];
