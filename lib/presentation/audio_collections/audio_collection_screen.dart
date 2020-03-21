import 'package:audio_player/presentation/audio_collections/audio_section_panel.dart';
import 'package:audio_player/presentation/audio_collections/ui_models/audio_group_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AudioCollectionScreen extends StatefulWidget {
  @override
  _AudioCollectionScreenState createState() => _AudioCollectionScreenState();
}

class _AudioCollectionScreenState extends State<AudioCollectionScreen> {
  static final _meditationAudioGroupList = [
    AudioGroupUi('Favorite Group', ['firstAudio', 'secondAudio']),
    AudioGroupUi('From YouTube', ['firstAudio', 'secondAudio']),
  ];

  static final _courseAudioGroupList = [
    AudioGroupUi('Coursera', ['firstCource', 'secondAudio']),
    AudioGroupUi('Udemy', ['firstAudio', 'secondAudio']),
    AudioGroupUi('Udacity', ['firstAudio', 'secondAudio']),
  ];

  static final _soundAudioGroupList = [
    AudioGroupUi('forest', ['firstAudio', 'secondAudio']),
    AudioGroupUi('relax', ['firstAudio', 'secondAudio']),
  ];

  static final List<String> _segmentedValues = ["meditation", "courses", "sounds"];

  static final _segmentedChildren = {
    "meditation": _meditationAudioGroupList,
    "courses": _courseAudioGroupList,
    "sounds": _soundAudioGroupList
  };
  var groupValue = _segmentedValues.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Align(
          alignment: Alignment.center,
          child: Text(
            "Mindfulness",
            style: TextStyle(
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        bottom: PreferredSize(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: CupertinoSegmentedControl(
            selectedColor: Colors.white,
            borderColor: const Color.fromRGBO(170, 180, 186, 0.2),
            unselectedColor: const Color.fromRGBO(170, 180, 186, 0.2),
            pressedColor: Color(0x747784),
            children: Map.fromIterables(
              _segmentedValues,
              _segmentedValues.map((title) => _SegmentedTab(
                title: title,
                selected: title == groupValue,
              ))),
            groupValue: groupValue,
            onValueChanged: (value) {
              setState(() {
                groupValue = value;
              });
            }),
          ),
          preferredSize: Size(double.infinity, 44)),
      ),
      body: AudioSectionPanel(
        audioGroupUiList: _segmentedChildren[groupValue].toList(),
      ),
    );
  }
}

class _SegmentedTab extends StatelessWidget {
  final String title;
  final bool selected;

  const _SegmentedTab({this.title, this.selected = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Text(
        title.toUpperCase(),
        style: TextStyle(
          color: selected
            ? Colors.black
            : const Color.fromRGBO(57, 60, 79, 0.7),
          fontSize: 14,
          fontWeight: FontWeight.w600
        ),
      )
    );
  }
}

