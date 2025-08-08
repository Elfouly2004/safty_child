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
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoAssetPath)
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? GestureDetector(
      onTap: () {
        setState(() {
          _isPlaying ? _controller.pause() : _controller.play();
          _isPlaying = !_isPlaying;
        });
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: VideoPlayer(_controller),
            ),
          ),
          if (!_isPlaying)
            const Icon(Icons.play_circle_fill,
                size: 64, color: Colors.white),
        ],
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

