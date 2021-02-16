import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class NetworkVideo extends StatefulWidget {
  final String url;
  final bool isMuted;
  final bool isLooping;
  final Function(VideoPlayerController) playerWidgetBuilder;
  const NetworkVideo({
    this.url,
    this.isMuted = false,
    this.isLooping = true,
    this.playerWidgetBuilder,
  });

  @override
  _NetworkVideoState createState() => _NetworkVideoState();
}

class _NetworkVideoState extends State<NetworkVideo> {
  VideoPlayerController _controller;
  bool paused = false;

  @override
  void initState() {
    _controller = VideoPlayerController.network(widget.url)
      ..initialize().then((_) {
        setState(() {});
      })
      ..setLooping(widget.isLooping)
      ..play();

    super.initState();
  }

  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.setVolume(widget.isMuted ? 0 : 1);
    return InkWell(
      onTap: () {
        if (paused)
          _controller.pause();
        else
          _controller.play();
        setState(() => paused = !paused);
      },
      child: Container(
        child: _controller.value.initialized
            //child: VideoPlayer(_controller)
            ? widget.playerWidgetBuilder(_controller)
            : Column(
                children: [
                  Container(
                    child: Text(
                      "Loading Video",
                      style: TextStyle(
                        color: Colors.black12,
                        fontSize: 12,
                      ),
                    ),
                    transform: Matrix4.translationValues(0.0, -13.0, 0.0),
                  ),
                ],
              ),
      ),
    );
  }
}

/*
Usage:
 NetworkVideo(
            url:
                'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4',
            playerWidgetBuilder: (_controller) {
              return FittedBox(
                fit: BoxFit.cover,
                child: SizedBox(
                  height: _controller.value.size.height,
                  width: _controller.value.size.width,
                  child: VideoPlayer(_controller),
                ),
              );
            },
          ),
*/

class FileVideo extends StatefulWidget {
  final String assetURI;
  final bool isMuted;
  final bool isLooping;
  final Function(VideoPlayerController) playerWidgetBuilder;
  const FileVideo({
    this.assetURI,
    this.isMuted = false,
    this.isLooping = true,
    this.playerWidgetBuilder,
  });

  @override
  _FileVideoState createState() => _FileVideoState();
}

class _FileVideoState extends State<FileVideo> {
  VideoPlayerController _controller;
  bool paused = false;

  @override
  void initState() {
    _controller = VideoPlayerController.asset(widget.assetURI)
      ..initialize().then((_) {
        setState(() {});
      })
      ..setLooping(widget.isLooping)
      ..play();

    super.initState();
  }

  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.setVolume(widget.isMuted ? 0 : 1);
    return InkWell(
      onTap: () {
        if (paused)
          _controller.pause();
        else
          _controller.play();
        setState(() => paused = !paused);
      },
      child: Container(
        child: _controller.value.initialized
            //child: VideoPlayer(_controller)
            ? widget.playerWidgetBuilder(_controller)
            : Column(
                children: [
                  Container(
                    child: Text(
                      "Loading Video",
                      style: TextStyle(
                        color: Colors.black12,
                        fontSize: 12,
                      ),
                    ),
                    transform: Matrix4.translationValues(0.0, -13.0, 0.0),
                  ),
                ],
              ),
      ),
    );
  }
}
