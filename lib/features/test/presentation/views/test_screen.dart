import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:safty_children/core/helpers/navigation_helper.dart';
import 'package:safty_children/core/helpers/spacer.dart';
import 'package:safty_children/core/themeing/app_colors.dart';
import 'package:safty_children/core/themeing/app_strings.dart';
import 'package:safty_children/core/themeing/app_styles.dart';
import 'package:safty_children/features/test/bloc/cubit/test_cubit.dart';
import 'package:safty_children/features/test/bloc/cubit/test_state.dart';
import 'package:safty_children/features/test/presentation/views/widgets/box_choice.dart';
import 'package:safty_children/features/test/presentation/views/widgets/custom_dialog.dart';
import 'package:safty_children/features/test/presentation/views/widgets/main_button.dart';
import 'package:safty_children/features/test/presentation/views/widgets/no_answer_dialog.dart';

import '../../data/questions stage/stage_four_questions.dart';
import '../../data/questions stage/stage_one_intro.dart';
import '../../data/questions stage/stage_thee_questions.dart';
import '../../models/question_model.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});
  Future<void> sendResultToGoogleSheet(
      String name,
      int score,
      int total,
      Map<String, dynamic> userAnswers,
      List<QuestionModel> stageOneIntroQuestions,
      { String? id }
      ) async {
    final url = Uri.parse(
      'https://script.google.com/macros/s/AKfycbxNlxsPOE5d3JYkshzivaDvWq-9a4c8yJGntcHy205lXBWECuaWiDC7xYL5BMz6FEjd/exec',
    );

    String? extractAnswer(String key) {
      final index = userAnswers[key];
      debugPrint("🔍 Extracting for $key → $index");

      if (index == null) return '';

      int questionIndex = int.tryParse(key.split("_")[1]) ?? -1;
      if (questionIndex == -1 || questionIndex >= stageOneIntroQuestions.length) {
        debugPrint("⚠️ Invalid question index for key $key");
        return '';
      }

      final answers = stageOneIntroQuestions[questionIndex].answers;

      if (index is int && index >= 0 && index < answers.length) {
        return answers[index];
      } else {
        debugPrint("❌ Invalid index $index for question $questionIndex");
      }

      return '';
    }

    // Stage 0 demographic answers
    final age = extractAnswer('0_0');
    final education = extractAnswer('0_1');
    final gender = extractAnswer('0_2');
    final marital = extractAnswer('0_3');
    final tookTraining = extractAnswer('0_4');
    final courseCount = extractAnswer('0_5');

    // Stage 3 - Q0: First Aid App
    final usedFirstAidApp = (() {
      final index = userAnswers['2_0']; // stageThreeQuestions[0]
      if (index is int && index >= 0 && index < stageThreeQuestions[0].answers.length) {
        return stageThreeQuestions[0].answers[index];
      }
      return '';
    })();

    // Stage 4 - Q0: AI Assistant
    final usedAIAssistant = (() {
      final index = userAnswers['3_0']; // stageFourQuestions[0]
      if (index is int && index >= 0 && index < stageFourQuestions[0].answers.length) {
        return stageFourQuestions[0].answers[index];
      }
      return '';
    })();

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'name': name,
          'id': id ?? '',
          'score': score,
          'total': total,
          'age': age,
          'education': education,
          'gender': gender,
          'marital': marital,
          'tookTraining': tookTraining,
          'courseCount': courseCount,
          'usedFirstAidApp': usedFirstAidApp,
          'usedAIAssistant': usedAIAssistant,
        }),
      );

      if (response.statusCode == 200 && response.body.contains("Success")) {
        debugPrint("✅ Result sent successfully!");
      } else {
        debugPrint("❌ Failed to send result: ${response.statusCode} - ${response.body}");
      }
    } catch (e) {
      debugPrint("❌ Error sending result: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.test,
          style: AppStyles.appBarStyle.copyWith(fontSize: 20.sp),
        ),
        centerTitle: true,
        backgroundColor: AppColors.appBarColor,
      ),
      body: BlocListener<TestCubit, TestState>(
        listener: (context, state) {
          if (state is TestCompleteState) {
            final cubit = context.read<TestCubit>();
            final nameController = TextEditingController();
            final idController = TextEditingController();

            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) {
                return AlertDialog(
                  title: const Text("ادخل اسمك ورقمك التعريفي"),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        controller: nameController,
                        decoration: const InputDecoration(labelText: "الاسم"),
                      ),
                    ],
                  ),
                  actions: [
                    TextButton(
                      onPressed: () async {
                        final name = nameController.text.trim();
                        final id = idController.text.trim();
                        final score = cubit.correctAnswerCount().round();
                        final total = cubit.totalPoints().round();

                        if (name.isEmpty ) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("الرجاء إدخال الاسم ")),
                          );
                          return;
                        }

                        Navigator.pop(context); // Close dialog

                        // ✅ Add debug print here to log all collected answers
                        debugPrint("📤 Sending userAnswers: ${cubit.userAnswers}");

                        await sendResultToGoogleSheet(
                          name,
                          score,
                          total,
                          cubit.userAnswers,
                          stageOneIntro, // ✅ pass the question list!
                        );

                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (_) => CustomDialog(
                            correctAnswersCount: score.toDouble(),
                            totalQuestions: total.toDouble(),
                          ),
                        );
                      },
                      child: const Text("إرسال"),
                    ),
                  ],
                );
              },
            );
          }
        },
        child: BlocBuilder<TestCubit, TestState>(
          builder: (context, state) {
            final cubit = context.read<TestCubit>();

            if (state is TestInitialState) {
              bool hasStarted = cubit.userAnswers.isNotEmpty;

              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MainButton(
                      title: "بدء الاختبار",
                      onPressed: () {
                        cubit.startTest(reset: true);
                      },
                    ),
                    if (hasStarted) ...[
                      SizedBox(height: 20.h),
                      MainButton(
                        title: "إكمال الامتحان",
                        onPressed: () {
                          cubit.startTest(reset: false);
                        },
                      ),
                    ],
                  ],
                ),
              );
            } else if (state is NextQuestionState || state is ChoiceAnswerState) {
              final currentIndex = cubit.currentQuestionIndex;
              if (currentIndex >= cubit.questions.length) {
                return const Center(child: Text('لا يوجد سؤال حالياً'));
              }

              final currentQuestion = cubit.questions[currentIndex];
              final userAnswer = cubit.userAnswers["${cubit.currentStageIndex}_$currentIndex"];

              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "المرحلة ${cubit.currentStageIndex + 1}",
                        style: AppStyles.headStyle.copyWith(fontSize: 20.sp, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "السؤال ${currentIndex + 1} من ${cubit.questions.length}",
                        style: AppStyles.headStyle.copyWith(fontSize: 18.sp, fontWeight: FontWeight.bold),
                      ),
                      verticalSpace(12),
                      Text(
                        currentQuestion.question,
                        style: AppStyles.headStyle.copyWith(fontSize: 16.sp, fontWeight: FontWeight.bold),
                      ),
                      verticalSpace(24),
                      ...List.generate(currentQuestion.answers.length, (index) {
                        bool isSelected = false;
                        if (currentQuestion.isMultiChoice && userAnswer is List<int>) {
                          isSelected = userAnswer.contains(index);
                        } else if (userAnswer is int) {
                          isSelected = userAnswer == index;
                        }

                        return BoxChoice(
                          isSelected: isSelected,
                          currentQuestion.answers[index],
                          onTap: () {
                            cubit.inputAnswer(index);
                          },
                        );
                      }),
                      verticalSpace(40),
                      Align(
                        alignment: Alignment.center,
                        child: MainButton(
                          onPressed: () {
                            final userAnswer = cubit.userAnswers["${cubit.currentStageIndex}_${cubit.currentQuestionIndex}"];
                            bool hasAnswerSelected = false;

                            if (userAnswer != null) {
                              if (userAnswer is int || (userAnswer is List && userAnswer.isNotEmpty)) {
                                hasAnswerSelected = true;
                              }
                            }

                            if (!hasAnswerSelected) {
                              showDialog(
                                context: context,
                                builder: (_) => NoAnswerDialog(onPressed: () => context.pop()),
                              );
                            } else {
                              cubit.nextQuestion();
                            }
                          },
                          title: 'السؤال التالي',
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return const Center(child: Text('لا يوجد سؤال حالياً'));
            }
          },
        ),
      ),
    );
  }
}