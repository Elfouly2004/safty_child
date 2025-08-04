import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safty_children/core/themeing/app_colors.dart';
import 'package:safty_children/core/themeing/app_strings.dart';
import 'package:safty_children/core/themeing/app_styles.dart';
import 'package:safty_children/features/topics/data/choking/choking_practice.dart';
import 'package:safty_children/features/topics/data/poisoning/poisoning_practice.dart';
import 'package:safty_children/features/topics/models/practice_model.dart';
import 'package:safty_children/features/topics/presentation/views/widgets/practice_item.dart';

class PracticeScreen extends StatelessWidget {
  final String topic;
  const PracticeScreen({super.key, required this.topic});

  List<PracticeModel> getTopic() {
    if (topic == AppStrings.poisoning) {
      return poisoningPractice;
    } else if (topic == AppStrings.choking) {
      return chokingPractice;
    } else {
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(topic, style: AppStyles.appBarStyle),
        centerTitle: true,
        backgroundColor: AppColors.appBarColor,
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 16).w,
          itemCount: getTopic().length,
          itemBuilder: (context, index) {
            final item = getTopic()[index];
            return PracticeItem(practice: item);
          },
        ),
      ),
    );
  }
}
