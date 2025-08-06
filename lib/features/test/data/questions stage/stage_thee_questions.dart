import 'package:safty_children/features/test/models/question_model.dart';

final List<QuestionModel> stageThreeQuestions = [
  QuestionModel(

    question: '1- هل سبق لك استخدام تطبيق الإسعافات الأولية في الممارسة العملية؟',
    answers: [
      'نعم',
      'لا'
    ],
    correctAnswer: [],
    isMultiChoice: false,
    type: QuestionType.withPoints,
      stage: 3
  ),

  QuestionModel(

    question: '2- أهمية تطبيق الموبايل للإسعافات الأولية للممرضين؟',
    answers: [
      'خدمة الوصول السريع للمستشفيات',
      'توفير وصول سريع إلى إرشادات الرعاية الطارئة',
      'بديل الأطباء في حالات الطوارئ',
      'تقديم الإرشادات الطارئة خطوة بخطوة عند الحاجة'
    ],
    correctAnswer: [1, 3],
    isMultiChoice: true,
    type: QuestionType.withPoints,
    point: 2.0,
      stage: 3
  ),

  QuestionModel(

    question: '3-  استخدامات تطبيق الموبايل للإسعافات الأولية للممرضين؟',
    answers: [
      'الوصول إلى الإرشادات المتعلقة بحالة الطفل',
      'دعم القرارات أثناء الطوارئ',
      'التواصل عبر وسائل التواصل الاجتماعي',
      'توفير أدوية مناسبة'
    ],
    correctAnswer: [0, 1],
    isMultiChoice: true,
    type: QuestionType.withPoints,
    point: 2.0,
      stage: 3
  ),

  QuestionModel(

    question: '4- المخاطر المحتملة من استخدام تطبيق الموبايل للإسعافات الأولية؟',
    answers: [
      'ارتفاع مستوى الأداء المهاري للفريق الطبي',
      'توافر الاتصال بالإنترنت',
      'احتمالية وجود معلومات خاطئة أو إرشادات قديمة',
      'انخفاض مهارات التفكير النقدي'
    ],
    correctAnswer: [2, 3],
    isMultiChoice: true,
    type: QuestionType.withPoints,
    point: 2.0,
      stage: 3
  ),
];
