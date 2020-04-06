import 'package:audio_player/presentation/pages/audio_collections/audio_group_horizontal_list.dart';
import 'package:audio_player/presentation/pages/audio_collections/ui_models/audio_group_ui.dart';
import 'package:flutter/cupertino.dart';

class AudioSectionPanel extends StatelessWidget {
  final List<AudioGroupUi> audioGroupUiList;
  final Key key;

  AudioSectionPanel({this.audioGroupUiList, this.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      key: key,
      child: ListView(
        key: key,
        children: <Widget>[
          for (var audioGroup in audioGroupUiList)
            AudioGroupHorizontalList(audioGroupUi: audioGroup),
        ],
      )
    );
  }
}
