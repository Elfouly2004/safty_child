import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class LoopingVideoWidget extends StatefulWidget {
  final String videoAssetPath;
  const LoopingVideoWidget({super.key, required this.videoAssetPath});

  @override
  State<LoopingVideoWidget> createState() => _LoopingVideoWidgetState();
}

class _LoopingVideoWidgetState extends State<LoopingVideoWidget> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoAssetPath)
      ..initialize().then((_) {
        _controller.setLooping(true);
        _controller.setVolume(0);
        _controller.play();
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? AspectRatio(
      aspectRatio: _controller.value.aspectRatio,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: VideoPlayer(_controller),
      ),
    )
        : const SizedBox(
      height: 200,
      child: Center(child: CircularProgressIndicator()),
    );

  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
