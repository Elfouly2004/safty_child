import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

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
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) {
                return CustomDialog(
                  correctAnswersCount: cubit.correctAnswerCount().toDouble(),
                  totalQuestions: cubit.totalPoints().toDouble(),
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
            } else if (state is NextQuestionState ||
                state is ChoiceAnswerState) {
              final currentIndex = cubit.currentQuestionIndex;

              if (currentIndex >= cubit.questions.length) {
                return const Center(child: Text('لا يوجد سؤال حالياً'));
              }

              final currentQuestion = cubit.questions[currentIndex];
              final userAnswer =
                  cubit.userAnswers["${cubit.currentStageIndex}_$currentIndex"];

              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "المرحلة ${cubit.currentStageIndex + 1} - ${cubit.currentStageIndex + 1 == 1 ? "استبيان تقييم معلومات الممرضين" : "معلومات الممرضين فيما يتعلق بتطبيق مساعد الطيار"}",
                        style: AppStyles.headStyle.copyWith(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      Text(
                        "السؤال ${currentIndex + 1} من ${cubit.questions.length}",
                        style: AppStyles.headStyle.copyWith(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      verticalSpace(12),
                      Text(
                        currentQuestion.question,
                        style: AppStyles.headStyle.copyWith(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      verticalSpace(24),
                      ...List.generate(currentQuestion.answers.length, (index) {
                        bool isSelected = false;
                        if (currentQuestion.isMultiChoice) {
                          if (userAnswer is List<int>) {
                            isSelected = userAnswer.contains(index);
                          }
                        } else {
                          if (userAnswer is int) {
                            isSelected = userAnswer == index;
                          }
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
                            final currentIndex = cubit.currentQuestionIndex;
                            final currentStage = cubit.currentStageIndex;
                            final userAnswer =
                                cubit
                                    .userAnswers["${currentStage}_$currentIndex"];

                            bool hasAnswerSelected = false;

                            if (userAnswer != null) {
                              if (userAnswer is int) {
                                hasAnswerSelected = true;
                              } else if (userAnswer is List &&
                                  userAnswer.isNotEmpty) {
                                hasAnswerSelected = true;
                              }
                            }

                            if (!hasAnswerSelected) {
                              showDialog(
                                context: context,
                                builder: (_) {
                                  return NoAnswerDialog(
                                    onPressed: () => context.pop(),
                                  );
                                },
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
