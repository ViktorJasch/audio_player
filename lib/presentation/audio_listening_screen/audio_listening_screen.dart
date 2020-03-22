import 'package:audio_player/presentation/audio_collections/ui_models/audio_item_ui.dart';
import 'package:flutter/material.dart';

class AudioListeningScreen extends StatelessWidget {
  final Image background;
  final AudioItemUi item;

  AudioListeningScreen({this.background, this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/background2.png'),
                fit: BoxFit.cover)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: PreferredSize(
              child: Padding(
                padding: const EdgeInsets.only(top: 32),
                child: _FullyTransparentAppBar(),
              ),
              preferredSize: Size.fromHeight(56)),
          body: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(top: 72),
          ),
        ));
  }
}

class _FullyTransparentAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: <Widget>[
          InkWell(
            onTap: () => Navigator.pop(context),
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
          Spacer(),
          Icon(
            Icons.speaker,
            color: Colors.white,
          ),
          SizedBox(
            width: 32,
          ),
          Icon(
            Icons.settings,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
