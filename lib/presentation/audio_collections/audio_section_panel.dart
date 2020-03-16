import 'package:flutter/cupertino.dart';

class AudioSectionPanel extends StatelessWidget {
  final String title;

  AudioSectionPanel({this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        title,
        style: TextStyle(
          color: CupertinoColors.black,
        ),
      ),
    );
  }
}
