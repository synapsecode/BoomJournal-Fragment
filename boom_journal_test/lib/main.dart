import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'components/vplayer.dart';

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

  //Grads:0xFFECBD8C && 0xFFCCBEB5

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xDDECBD8C),
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xDDECBD8C),
              Color(0xAFCCBEB5),
              Colors.grey[200],
            ],
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: FileVideo(
                assetURI: 'assets/v1.mp4',
                playerWidgetBuilder: (_controller) {
                  return FittedBox(
                    fit: BoxFit.cover,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Container(
                        height: _controller.value.size.height,
                        width: _controller.value.size.width,
                        child: VideoPlayer(_controller),
                      ),
                    ),
                  );
                },
              ),
            ),
            Expanded(
                child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    EmotionBox(
                      emotionName: "Happiness",
                      backgroundColor: Colors.blue[300],
                      headerColor: Colors.blue[900],
                      emotions: [
                        EmotionButton(
                          text: "😂 Laughter",
                          onPressed: () {},
                        ),
                        EmotionButton(
                          text: "😂 Laughter",
                          onPressed: () {},
                        ),
                        EmotionButton(
                          text: "😂 Laughter",
                          onPressed: () {},
                        ),
                        EmotionButton(
                          text: "😂 Laughter",
                          onPressed: () {},
                        ),
                      ],
                    ),
                    EmotionBox(
                      emotionName: "Love",
                      backgroundColor: Colors.red[300],
                      headerColor: Colors.red[900],
                      emotions: [
                        EmotionButton(
                          text: "😂 Laughter",
                          onPressed: () {},
                        ),
                        EmotionButton(
                          text: "😂 Laughter",
                          onPressed: () {},
                        ),
                        EmotionButton(
                          text: "😂 Laughter",
                          onPressed: () {},
                        ),
                        EmotionButton(
                          text: "😂 Laughter",
                          onPressed: () {},
                        ),
                      ],
                    ),
                    EmotionBox(
                      emotionName: "Euphoric",
                      backgroundColor: Colors.green[300],
                      headerColor: Colors.green[900],
                      emotions: [
                        EmotionButton(
                          text: "😂 Laughter",
                          onPressed: () {},
                        ),
                        EmotionButton(
                          text: "😂 Laughter",
                          onPressed: () {},
                        ),
                        EmotionButton(
                          text: "😂 Laughter",
                          onPressed: () {},
                        ),
                        EmotionButton(
                          text: "😂 Laughter",
                          onPressed: () {},
                        ),
                      ],
                    ),
                    EmotionBox(
                      emotionName: "Anxiety",
                      backgroundColor: Colors.blueGrey[300],
                      headerColor: Colors.blueGrey[900],
                      emotions: [
                        EmotionButton(
                          text: "😂 Laughter",
                          onPressed: () {},
                        ),
                        EmotionButton(
                          text: "😂 Laughter",
                          onPressed: () {},
                        ),
                        EmotionButton(
                          text: "😂 Laughter",
                          onPressed: () {},
                        ),
                        EmotionButton(
                          text: "😂 Laughter",
                          onPressed: () {},
                        ),
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
      ),
    );
  }
}

class EmotionBox extends StatelessWidget {
  final String emotionName;
  final Color backgroundColor;
  final List<EmotionButton> emotions;
  final Color headerColor;

  const EmotionBox(
      {Key key,
      this.emotionName,
      this.backgroundColor,
      this.emotions,
      this.headerColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.only(left: 20, top: 20, bottom: 20),
          color: backgroundColor ?? Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                emotionName,
                style: TextStyle(
                  fontSize: 30,
                  color: headerColor ?? Colors.white70,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: emotions),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class EmotionButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  const EmotionButton({Key key, this.text, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
        child: Text(
          text,
          style: TextStyle(fontSize: 20),
        ),
        onPressed: () => onPressed(),
      ),
    );
  }
}
