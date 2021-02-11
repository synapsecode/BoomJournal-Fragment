import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(BoomApp());
}

class BoomApp extends StatelessWidget {
  const BoomApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BoomPage(),
    );
  }
}

class BoomPage extends StatelessWidget {
  const BoomPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
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
          Expanded(
              child: Container(
            width: double.infinity,
            padding: EdgeInsets.only(left: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    height: 30,
                  ), //TopHeight
                  EmotionHeader(
                    text: "Happiness",
                  ),
                  EmotionRow(
                    children: [
                      EmotionCircle(
                        text: "Happy",
                        isFilled: true,
                      ),
                      EmotionCircle(text: "Happy"),
                      EmotionCircle(
                        text: "Happy",
                      ),
                      EmotionCircle(text: "Happy"),
                      EmotionCircle(text: "Happy"),
                    ],
                  ),

                  EmotionHeader(
                    text: "Euphoric",
                  ),
                  EmotionRow(
                    children: [
                      EmotionCircle(text: "Happy"),
                      EmotionCircle(
                        text: "Happy",
                        isFilled: true,
                      ),
                      EmotionCircle(
                        text: "Happy",
                      ),
                      EmotionCircle(text: "Happy"),
                      EmotionCircle(text: "Happy"),
                    ],
                  ),
                  EmotionHeader(
                    text: "Anxiety",
                  ),
                  EmotionRow(
                    children: [
                      EmotionCircle(text: "Happy"),
                      EmotionCircle(text: "Happy"),
                      EmotionCircle(text: "Happy"),
                      EmotionCircle(text: "Happy"),
                      EmotionCircle(
                        text: "Happy",
                        isFilled: true,
                      ),
                    ],
                  ),
                  EmotionHeader(
                    text: "Love",
                  ),
                  EmotionRow(
                    children: [
                      EmotionCircle(text: "Happy"),
                      EmotionCircle(text: "Happy"),
                      EmotionCircle(
                        text: "Happy",
                      ),
                      EmotionCircle(
                        text: "Happy",
                        isFilled: true,
                      ),
                      EmotionCircle(text: "Happy"),
                    ],
                  ),

                  SizedBox(
                    height: 30,
                  ), //BottomHeight
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}

class EmotionRow extends StatelessWidget {
  final List<Widget> children;
  const EmotionRow({Key key, this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Row(children: children),
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.only(bottom: 20.0),
    );
  }
}

class EmotionHeader extends StatelessWidget {
  final String text;
  const EmotionHeader({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}

class EmotionCircle extends StatelessWidget {
  final String text;
  final bool isFilled;
  const EmotionCircle({Key key, this.text, this.isFilled = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: CircleAvatar(
        backgroundColor: Colors.black,
        radius: 47.0,
        child: CircleAvatar(
          radius: 46,
          backgroundColor: (this.isFilled) ? Colors.black : Colors.white,
          foregroundColor: (this.isFilled) ? Colors.white : Colors.black,
          child: Text(text),
        ),
      ),
    );
  }
}

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
