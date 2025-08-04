import 'package:safty_children/core/themeing/app_assets.dart';
import 'package:safty_children/features/topics/models/practice_model.dart';

final List<PracticeModel> chokingPractice = [



  PracticeModel(
    title: 'أولًا: التعامل مع الطفل الواعي والمستجيب',
    content: [
      PracticeText(
        subTitle:
            '1- إذا كان الانسداد خفيفًا وكان الطفل قادرًا على الكحة بقوة، أو التحدث، أو التنفس، شجعه على ذلك لطرد الجسم العالق.',
      ),
      PracticeText(
        subTitle:
            '2- إذا كان الانسداد شديدًا، ولم يتمكن الطفل من السعال بقوة، أو التحدث، أو التنفس، قم بإمالة الطفل إلى الأمام لمساعدة الجاذبية، ثم قم بإعطائه 5 ضربات على الظهر (بين لوحي الكتف براحة يدك).',
      ),

      PracticeVideoPath(videoPath: 'assets/vids/1.mp4'),

      PracticeImgPath(imgPath: AppAssets.img22),

      PracticeText(
        subTitle:
            '3- إذا لم يتم إزالة الجسم العالق، قم بإجراء 5 ضغطات بطنية:\n- إجعل الطفل في وضع منتصب مع إنحناءة للأمام.\n- قف خلف الطفل ولف ذراعيك حول خصره، وضع يديك فوق سرّته مباشرة.\n- اضغط بقوة إلى الداخل ولأعلى 5 مرات.',
      ),

      PracticeVideoPath(videoPath: 'assets/vids/2.mp4'),

      PracticeImgPath(imgPath: AppAssets.img23),

      PracticeText(
        subTitle:
            '4- استمر في التبديل بين الضربات على الظهر والضغطات البطنية حتى يتم طرد الجسم العالق.',
      ),
    ],
  ),










  PracticeModel(
    title: 'ثانيًا: التعامل مع الطفل غير الواعي وغير المستجيب',
    content: [
      PracticeText(
        subTitle: '1- يتم فحص المجرى الهوائي، معدل التنفس، الدورة الدموية.',
      ),
      PracticeText(
        subTitle: '''
2- يتم فتح مجرى الهواء من خلال طريقتين:

- الأولى: طريقة إمالة الرأس للخلف ورفع الفك، من خلال وضع يد على الجبهة وإمالة الرأس للخلف، ثم رفع الفك بإصبعين.

- الثانية: طريقة دفع الفك (إذا اشتبه في إصابة الرقبة)، بوضع إصبعين خلف زاويتي الفك السفلي ودفعه للأمام دون تحريك الرأس.
''',
      ),
      PracticeText(
        subTitle: '''
3- يجب قياس معدل التنفس عن طريق (الملاحظة، الاستماع، الإحساس):
- ملاحظة حركة الصدر.
- الاستماع لصوت التنفس عند الأنف والفم.
- الإحساس بحركة الهواء على خدك لمدة 5-10 ثواني.
''',
      ),
      PracticeText(
        subTitle: '''
4- في حالة عدم وجود تنفس، ولكن يوجد نبض، يتم إعطاء تنفس منقذ بدون ضغطات صدر:
- 12-20 نفسًا في الدقيقة (نفس كل 3-5 ثواني) عن طريق الأمبوباج.
''',
      ),


      PracticeVideoPath(videoPath: 'assets/vids/5aa.mp4'),
      PracticeVideoPath(videoPath: 'assets/vids/6aa.mp4'),



      PracticeImgPath(imgPath: AppAssets.img24),

      PracticeText(
        subTitle: '5- قياس النبض لمدة لا تتجاوز 10 ثواني (السباتي أو الفخذي).',
      ),
      PracticeText(
        subTitle: '''
6- إذا لم يكن هناك نبض، ابدأ بالإنعاش القلبي الرئوي (CPR):

- ضع الطفل على سطح صلب، وميّل رأسه لأحد الجانبين.
- وصله بجهاز مراقبة إن وُجد.
- إزالة الملابس لتحديد موضع الضغطات.

- موضع الضغط:
  - منتصف الصدر بين الحلمتين.
  - باستخدام يد واحدة أو اليدين.
  - السماح بعودة الصدر بعد كل ضغطة.

- العمق: 2 إنش (5 سم).

- النسبة:
  - منقذ واحد: 30:2.
  - منقذين: 15:2.

- معدل الضغطات: 100-120 في الدقيقة.
- معدل التنفس: 12-20 نفسًا بالدقيقة.
''',
      ),


      PracticeVideoPath(videoPath: 'assets/vids/3a.mp4'),

      PracticeVideoPath(videoPath: 'assets/vids/4a.mp4'),

      PracticeText(
        subTitle:
            '7- الاستمرار في الإنعاش حتى إزالة الانسداد أو استعادة وعي الطفل.',
      ),
      PracticeImgRow(imgPaths: [AppAssets.img25, AppAssets.img26]),
    ],
  ),
];
