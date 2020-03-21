import 'package:audio_player/presentation/audio_collections/audio_group_horizontal_list.dart';
import 'package:audio_player/presentation/audio_collections/ui_models/audio_group_ui.dart';
import 'package:flutter/cupertino.dart';

class AudioSectionPanel extends StatelessWidget {
  final String title;
  final List<AudioGroupUi> audioGroupUiList = [
    AudioGroupUi('Favorite Group', ['firstAudio', 'secondAudio']),
    AudioGroupUi('From YouTube', ['firstAudio', 'secondAudio']),
  ];

  AudioSectionPanel({this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          AudioGroupHorizontalList(audioGroupUi: audioGroupUiList[0]),
          AudioGroupHorizontalList(audioGroupUi: audioGroupUiList[1]),
        ],
      )
    );
  }
}
