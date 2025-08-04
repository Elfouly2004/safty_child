import 'package:flutter/material.dart';
import 'package:safty_children/core/themeing/app_styles.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class MediaItem extends StatefulWidget {
  final String title;
  final String vidPath;
  const MediaItem({super.key, required this.title, required this.vidPath});

  @override
  State<MediaItem> createState() => _MediaItemState();
}

class _MediaItemState extends State<MediaItem> {
  VideoPlayerController? _videoController;
  ChewieController? _chewieController;
  bool showVid = false;

  void playVideo() async {
    _videoController?.dispose();
    _chewieController?.dispose();

    _videoController = VideoPlayerController.asset(widget.vidPath);
    await _videoController!.initialize();
    _chewieController = ChewieController(
      videoPlayerController: _videoController!,
      autoPlay: true,
      looping: false,
      allowFullScreen: true,
      allowMuting: true,
    );

    setState(() {
      showVid = true;
    });
  }

  void hideVideo() {
    _videoController?.pause();
    _chewieController?.pause();
    _videoController?.dispose();
    _chewieController?.dispose();
    setState(() {
      showVid = false;
      _videoController = null;
      _chewieController = null;
    });
  }

  @override
  void dispose() {
    _videoController?.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(widget.title, style: AppStyles.headStyle),
      children: [
        if (!showVid)
          TextButton(
            onPressed: playVideo,
            child: Text(
              "عرض الفيديو",
              style: AppStyles.descriptionStyle.copyWith(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          )
        else
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AspectRatio(
                  aspectRatio: _videoController!.value.aspectRatio,
                  child: Chewie(controller: _chewieController!),
                ),
              ),
              TextButton(
                onPressed: hideVideo,
                child: Text(
                  "إخفاء الفيديو",
                  style: AppStyles.descriptionStyle.copyWith(
                    color: Colors.red,
                    fontSize: 18,
                  ),
                ),
              )
            ],
          )
      ],
    );
  }
}