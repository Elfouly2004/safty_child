import 'package:safty_children/features/test/models/question_model.dart';

final List<QuestionModel> stageFourQuestions = [
  QuestionModel(


    question:
    '1- هل سبق لك استخدام الذكاء الاصطناعي مساعد الطيار في الممارسة العملية؟',
    answers: ['نعم', 'لا'],
    correctAnswer: [],
    isMultiChoice: false,
    type: QuestionType.withPoints,
      stage: 4
  ),
  QuestionModel(

    question:
    '2- إذا كانت الإجابة "نعم"، فكم مرة تم إستخدام تطبيق الذكاء الاصطناعي مساعد الطيار لتعلم إجراءات أو إرشادات تمريضية جديدة؟',
    answers: ['يومياً', 'أسبوعياً', 'أحياناً', 'أبداً'],
    correctAnswer: [],
    isMultiChoice: false,
    type: QuestionType.withPoints,
    stage: 4
  ),

  QuestionModel(
    question:
    '3- ما هي فوائد استخدام الذكاء الاصطناعي مساعد الطيار في الممارسة التمريضية؟',
    answers: [
      'تحسين اتخاذ القرارات المتعلقة بحالة الطفل والتشخيص',
      'زيادة الأخطاء البشرية وعبء العمل',
      'تعزيز رعاية الأطفال وكفاءة سير العمل',
      'بديل الرعاية الشاملة',
    ],
    correctAnswer: [0, 2],
    isMultiChoice: true,
    type: QuestionType.withPoints,
    point: 2.0,
      stage: 4
  ),

  QuestionModel(
    question: '4- ما هي مزايا استخدام الذكاء الاصطناعي مساعد الطيار؟',
    answers: [
      'انخفاض الكفاءة المهنية وتقليل عبء العمل',
      'الحصول على المعرفة الطبية المطلوبة في الوقت المناسب',
      'تقليل الأخطاء الطبية',
      'تحسين رضا المرضى من الأطفال',
    ],
    correctAnswer: [1, 3],
    isMultiChoice: true,
    type: QuestionType.withPoints,
    point: 2.0,
      stage: 4
  ),

  QuestionModel(
    question:

    '5- ما هي عيوب استخدام الذكاء الاصطناعي مساعد الطيار في الممارسة التمريضية؟',

    answers: [
      'عدم تقييم حالة الطفل الفعلية',
      'تعزيز دعم اتخاذ القرار المتعلق بحالة الطفل',
      'خطر الاعتماد المفرط على التكنولوجيا',
      'زيادة مهارات التفكير النقدي والحكم السريري',
    ],
    correctAnswer: [0, 2],
    isMultiChoice: true,
    type: QuestionType.withPoints,
    point: 2.0,
      stage: 4
  ),

  QuestionModel(
    question:

    '6- ما هي التحديات التي تواجه استخدام الذكاء الاصطناعي مساعد الطيار في الممارسة التمريضية؟',
    answers: [
      'نقص التدريب والدعم الفني',
      'تحسين رضا الممرضين',
      'مقاومة التطور التكنولوجي',
      'تقليل الأعباء أو تخفيف ضغط العمل',
    ],
    correctAnswer: [0, 2],
    isMultiChoice: true,
    type: QuestionType.withPoints,
    point: 2.0,
      stage: 4
  ),

  QuestionModel(
    question:
    '7- ما هي معوقات استخدام الذكاء الاصطناعي مساعد الطيار في الممارسة التمريضية؟',
    answers: [
      'القلق تجاه فقدان الوظائف عن طريق الاستبدال بالتطبيقات التكنولوجية.',
      'توفر تدريب متكامل على دمج الذكاء الاصطناعي',
      'نقص الدعم التنظيمي والإرشادات',
      'تحسين التعاون بين الممرضات والذكاء الاصطناعي',
    ],
    correctAnswer: [0, 2],
    isMultiChoice: true,
    type: QuestionType.withPoints,
    point: 2.0,
      stage: 4
  ),
];