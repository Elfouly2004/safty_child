import 'package:safty_children/core/themeing/app_assets.dart';
import 'package:safty_children/features/topics/models/practice_model.dart';

final List<PracticeModel> poisoningPractice = [
  PracticeModel(
    title: 'أولًا: التقييم التمريضي لحالات التسمم عند الأطفال (بشكل عام)',
    content: [
      PracticeText(
        subTitle: '''أخذ تاريخ مفصل للحالة يشمل:
.1 نوع المادة السامة التي تم تناولها''',
      ),
      PracticeImgRow(
        imgPaths: [AppAssets.img2, AppAssets.img3, AppAssets.img4],
      ),

      PracticeText(
        subTitle: '''. 2 الكمية والوقت منذ التعرض
.3 طريق التعرض (بلع، استنشاق، ملامسة الجلد)
. 4الأعراض الحالية''',
      ),
      PracticeImgRow(
        imgPaths: [AppAssets.img5, AppAssets.img6, AppAssets.img7],
      ),

      PracticeText(
        subTitle:
            '''. 5قياس العلامات الحيوية (معدل ضربات القلب، معدل التنفس، نسبة الأكسجين في الدم، ضغط الدم)
. 6 تقييم مستوي الوعي ،حدوث التشنجات، إتساع حدقة العين)
. 7 تقييم المجرى الهوائي، معدل التنفس، الدورة الدموية.''',
      ),
    ],
  ),
  PracticeModel(
    title: 'ثانيًا: الإسعافات الأولية العامة للتسمم',
    content: [
      PracticeText(
        subTitle: '''
. 1تقديم العلاج بالأكسجين في حالة وجود نقص الأكسجين
. 2إعطاء السوائل الوريدية في حالة انخفاض ضغط الدم أو الجفاف
''',
      ),
      PracticeImgPath(imgPath: AppAssets.img8),
      PracticeText(
        subTitle: '''
. 3إعطاء الترياق (العلاج المضاد للسم) عند الحاجة، وفقًا لتوجيهات الطبيب
''',
      ),
    ],
  ),
  PracticeModel(
    title: 'ثالثًا: التعامل مع حالات التسمم المختلفة',
    content: [
      PracticeText(
        subTitle: '''- 1 التسمم بالأدوية أو الأطعمة
إدخال أنبوب أنفي معدي لإزالة السموم عن طريق:''',
      ),
      PracticeImgPath(imgPath: AppAssets.img9),

      PracticeText(
        subTitle:
            '''غسيل المعدة: يُجرى في حالات التسمم الخطيرة خلال ساعة من تناول السم''',
      ),
      PracticeImgPath(imgPath: AppAssets.img10),

      PracticeText(
        subTitle:
            '''الفحم النشط: يُستخدم لامتصاص بعض السموم خلال ساعة من التسمم، ما لم يكن هناك موانع''',
      ),
      PracticeImgRow(imgPaths: [AppAssets.img11, AppAssets.img12]),

      PracticeText(
        subTitle: '''- 2 التسمم بالمواد الكاوية (الأحماض والقلويات):
. 1 عدم تحفيز القيء في حالات بلع مواد مثل المبيضات أو المنظفات
. 2 إعطاء كميات صغيرة من الماء أو الحليب لتخفيف التأثير السام
. 3 تجنب إعطاء عصير الليمون أو الخل، لأنها قد تزيد الضرر''',
      ),
      PracticeImgRow(
        imgPaths: [AppAssets.img13, AppAssets.img14, AppAssets.img15],
      ),

      PracticeText(
        subTitle: '''3 - التسمم بالاستنشاق:
1. غسل الجلد أو العينين بمياه نظيفة أو محلول ملحي لإزالة السموم
. 2 تغيير الملابس الملوثة
. 3 غسل الجلد بالماء والصابون لمدة لا تقل عن 15 دقيقة''',
      ),
      PracticeImgRow(imgPaths: [AppAssets.img16, AppAssets.img17]),

      PracticeText(
        subTitle: '''4- التسمم الناتج عن لدغات الحيوانات:-
. 1 تقييم الأعراض مثل الألم الموضعي، التورم، الكدمات
. 2 تهدئة الطفل وتقليل حركته لإبطاء انتشار السم
و يتم غسل الجرح بالماء والصابون لتجنب خطر العدوي
. 3 وضع كمادات باردة على موضع الاصابة
. 4 إبقاء مكان الإصابة أسفل مستوى القلب
. 5 تغطية موضع الإصابة بضمادة نظيفة
. 6 تجنب مص السم أو استخدام رباط ضاغط
. 7 إعطاء المصل المضاد للسم حسب توجيهات الطبيب''',
      ),
      PracticeImgPath(imgPath: AppAssets.img18),
    ],
  ),
  PracticeModel(
    title: 'رابعًا: المراقبة والمتابعة',
    content: [
      PracticeText(
        subTitle:
            '''.1 إذا كان الطفل واعيًا، تتم مراقبة العلامات الحيوية ونسبة الأكسجين باستمرار''',
      ),
      PracticeImgPath(imgPath: AppAssets.img19),

      PracticeText(
        subTitle:
            '''.2 إذا كان الطفل فاقدًا للوعي، يتم البدء في الإنعاش القلبي الرئوي.''',
      ),
      PracticeImgRow(imgPaths: [AppAssets.img20, AppAssets.img21]),
    ],
  ),
];
