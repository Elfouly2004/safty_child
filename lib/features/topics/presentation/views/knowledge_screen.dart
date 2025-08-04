import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safty_children/core/themeing/app_colors.dart';
import 'package:safty_children/core/themeing/app_strings.dart';
import 'package:safty_children/core/themeing/app_styles.dart';
import 'package:safty_children/features/topics/data/choking/chocking_knowledge.dart';
import 'package:safty_children/features/topics/data/poisoning/posining_knowledge.dart';
import 'package:safty_children/features/topics/models/knowledge_model.dart';
import 'package:safty_children/features/topics/presentation/views/widgets/knowledge_item.dart';

class KnowledgeScreen extends StatelessWidget {
  final String topic;
  const KnowledgeScreen({super.key, required this.topic});

  List<Knowledgemodel> getTopic() {
    if (topic == AppStrings.choking) {
      return chockingContent;
    } else if (topic == AppStrings.poisoning) {
      return poisoningKnowledge;
    } else {
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Knowledgemodel> topicContent = getTopic();
    return Scaffold(
      appBar: AppBar(
        title: Text(topic, style: AppStyles.appBarStyle),
        centerTitle: true,
        backgroundColor: AppColors.appBarColor,
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16).w,
          child: ListView.builder(
            itemCount: topicContent.length,
            itemBuilder: (BuildContext context, int index) {
              final item = topicContent[index];
              return Knowledgeitem(title: item.title, subtitle: item.subtitle);
            },
          ),
        ),
      ),
    );
  }
}
