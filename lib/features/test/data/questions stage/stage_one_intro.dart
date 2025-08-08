import 'package:safty_children/features/test/models/question_model.dart';

final List<QuestionModel> stageOneIntro = [
  QuestionModel(

    question: '1- العمر بالسنوات:',
    answers: ['< 20', '20 < 25', '25 < 30', '30 ≤'],
    correctAnswer: [],
    isMultiChoice: false,
    type: QuestionType.withoutPoints,
      stage: 1
  ),
  QuestionModel(

    question: '2- المستوى التعليم:',
    answers: [
      'المعهد الفني للتمريض',
      'المدرسة الثانوية للتمريض',
      'بكالوريوس في علوم التمريض',
      'دراسات عليا',
    ],
    correctAnswer: [],
    isMultiChoice: false,
    type: QuestionType.withoutPoints,
      stage: 1
  ),
  QuestionModel(

    question: '3- الجنس:',
    answers: ['أنثى', 'ذكر'],
    correctAnswer: [],
    isMultiChoice: false,
    type: QuestionType.withoutPoints,
      stage: 1
  ),
  QuestionModel(

    question: '4- الحالة الاجتماعية:',
    answers: ['.أعزب/ عزباء', 'متزوج/ متزوجة', 'مطلق/ مطلقة', 'أرمل/ أرملة'],
    correctAnswer: [],
    isMultiChoice: false,
    type: QuestionType.withoutPoints,
      stage: 1
  ),
  QuestionModel(

    question: '5- هل تم الحصول علي أي دورات تدريبية حول إستخدام تطبيق الإسعافات الأولية للأطفال؟ ',
    answers: ['نعم', 'لا'],
    correctAnswer: [],
    isMultiChoice: false,
    type: QuestionType.withoutPoints,
      stage: 1
  ),
  QuestionModel(

    question: 'إذا كانت الإجابة بنعم، ما عدد الدورات ؟ ',
    answers: ['1', '2', '3', 'أكثر من ذلك'],
    correctAnswer: [],
    isMultiChoice: false,
    type: QuestionType.withoutPoints,
    visibilityCondition: (previousAnswers) {
      final answer = previousAnswers["0_4"];
      return answer == 0;
    },
      stage: 1
  ),
];
