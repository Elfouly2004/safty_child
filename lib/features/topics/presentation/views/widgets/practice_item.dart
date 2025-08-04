import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safty_children/core/themeing/app_styles.dart';
import 'package:safty_children/features/topics/models/practice_model.dart';

import '../../../../home/presentation/views/widgets/looping_video_widget.dart';

class PracticeItem extends StatelessWidget {
  final PracticeModel practice;
  const PracticeItem({super.key, required this.practice});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(practice.title, style: AppStyles.headStyle, textAlign: TextAlign.center,),
      children:
          practice.content.map((item) {
            if (item is PracticeText) {
              return Padding(
                padding: const EdgeInsets.all(8.0).w,
                child: Text(item.subTitle, style: AppStyles.descriptionStyle),
              );
            } else if (item is PracticeImgPath) {
              return Padding(
                padding: const EdgeInsets.all(8.0).w,
                child: Image.asset(item.imgPath),
              );
            }else if (item is PracticeVideoPath) {
              return Padding(
                padding: const EdgeInsets.all(8.0).w,
                child: LoopingVideoWidget(videoAssetPath: item.videoPath),
              );
            }


            else if (item is PracticeImgRow) {
              return Padding(
                padding: const EdgeInsets.all(8.0).w,
                child: Row(
                  children:
                      item.imgPaths.map((img) {
                        return Container(
                          height: 120.h,
                          width: 110.w,
                          margin: EdgeInsets.only(right: 8.w),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(img),
                              fit: BoxFit.fill,
                            ),
                          ),
                        );
                      }).toList(),
                ),
              );
            } else {
              return Text("not working");
            }
          }).toList(),
    );
  }
}
