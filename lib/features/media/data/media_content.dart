import 'package:safty_children/core/themeing/app_assets.dart';
import 'package:safty_children/core/themeing/app_strings.dart';
import 'package:safty_children/features/media/models/media_model.dart';

List<MediaModel> mediaContent = [
  MediaModel(
    title: '${AppStrings.title} ${AppStrings.poisoning}',
    vidPath: AppAssets.poisoningVid,
  ),
  MediaModel(
    title: '${AppStrings.title} ${AppStrings.choking}',
    vidPath: AppAssets.chokingVid,
  ),  MediaModel(
    title: 'كيف استخدم تطبيق الذكاء الاصطناعي كوبايلوت copilot',
    vidPath: AppAssets.aivideo,
  ),
];
