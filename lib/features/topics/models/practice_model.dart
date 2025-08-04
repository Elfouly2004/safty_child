class PracticeContentItem {}

class PracticeText extends PracticeContentItem {
  final String subTitle;
  PracticeText({required this.subTitle});
}

class PracticeImgPath extends PracticeContentItem {
  final String imgPath;
  PracticeImgPath({required this.imgPath});
}

class PracticeImgRow extends PracticeContentItem {
  final List<String> imgPaths;
  PracticeImgRow({required this.imgPaths});
}

class PracticeModel {
  final String title;
  final List<PracticeContentItem> content;
  PracticeModel({required this.title, required this.content});
}
class PracticeVideoPath extends PracticeContentItem {
  final String videoPath;
  PracticeVideoPath({required this.videoPath});
}
