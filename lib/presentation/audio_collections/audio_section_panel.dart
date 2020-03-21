import 'package:audio_player/presentation/audio_collections/audio_group_horizontal_list.dart';
import 'package:flutter/cupertino.dart';

class AudioSectionPanel extends StatelessWidget {
  final String title;

  AudioSectionPanel({this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AudioGroupHorizontalList(),
    );
  }
}
