import 'package:flutter/material.dart';

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


/*
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
*/