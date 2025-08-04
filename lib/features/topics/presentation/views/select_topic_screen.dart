import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safty_children/core/helpers/navigation_helper.dart';
import 'package:safty_children/core/routing/Routes.dart';
import 'package:safty_children/core/themeing/app_colors.dart';
import 'package:safty_children/core/themeing/app_strings.dart';
import 'package:safty_children/core/themeing/app_styles.dart';
import 'package:safty_children/features/home/presentation/views/widgets/home_box.dart';

class SelectTopicScreen extends StatelessWidget {
  final String topic;
  const SelectTopicScreen({super.key, required this.topic});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${AppStrings.main} ${AppStrings.title}$topic',
          style: AppStyles.appBarStyle,
        ),
        centerTitle: true,
        backgroundColor: AppColors.appBarColor,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(),
        child: Padding(
          padding: const EdgeInsets.all(16.0).w,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              HomeBox(
                title: AppStrings.knowledge,
                icon: Icons.menu_book_rounded,
                color: AppColors.purple,
                bgColor: AppColors.deepPurple,
                onTap: () {
                  context.pushNamed(Routes.knowledge, arguments: topic);
                },
              ),
              HomeBox(
                title: AppStrings.practice,
                icon: Icons.fitness_center_rounded,
                color: Colors.teal,
                bgColor: const Color.fromARGB(25, 0, 128, 128),
                onTap: () {
                  context.pushNamed(Routes.practice, arguments: topic);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
