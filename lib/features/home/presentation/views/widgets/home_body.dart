import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safty_children/core/helpers/navigation_helper.dart';
import 'package:safty_children/core/helpers/spacer.dart';
import 'package:safty_children/core/routing/Routes.dart';
import 'package:safty_children/features/home/presentation/views/widgets/home_box.dart';

class HomeBody extends StatelessWidget {
  final List<Map<String, dynamic>> homeBoxesData;

  const HomeBody({super.key, required this.homeBoxesData});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.all(16.0).w,
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: homeBoxesData.map((boxData) {
              return Column(
                children: [
                  HomeBox(
                    color: boxData['color'],
                    bgColor: boxData['bgColor'],
                    icon: boxData['icon'],
                    title: boxData['title'],
                    onTap: () => context.pushNamed(
                      Routes.select,
                      arguments: boxData['routeArg'],
                    ),
                  ),
                  verticalSpace(16),
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
