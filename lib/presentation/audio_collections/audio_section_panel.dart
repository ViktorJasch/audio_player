import 'package:audio_player/presentation/audio_collections/audio_group_horizontal_list.dart';
import 'package:audio_player/presentation/audio_collections/ui_models/audio_group_ui.dart';
import 'package:flutter/cupertino.dart';

class AudioSectionPanel extends StatelessWidget {
  final List<AudioGroupUi> audioGroupUiList;

  AudioSectionPanel({this.audioGroupUiList});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          for (var audioGroup in audioGroupUiList)
            AudioGroupHorizontalList(audioGroupUi: audioGroup),
        ],
      )
    );
  }
}
