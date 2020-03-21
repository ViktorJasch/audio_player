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

  static final _segmentedValues = {
    "meditation": _SegmentedTab(title: "Meditation"),
    "courses": _SegmentedTab(title: "Courses"),
    "sounds": _SegmentedTab(title: "Sounds")
  };
  static final _segmentedChildren = {
    "meditation": AudioSectionPanel(audioGroupUiList: _meditationAudioGroupList),
    "courses": AudioSectionPanel(audioGroupUiList: _courseAudioGroupList),
    "sounds": AudioSectionPanel(audioGroupUiList: _soundAudioGroupList)
  };
  var groupValue = _segmentedValues.keys.first;

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
                borderColor: Colors.grey,
                unselectedColor: Color.fromRGBO(170, 180, 186, 0.2),
                pressedColor: Color(0x747784),
                children: _segmentedValues,
                groupValue: groupValue,
                onValueChanged: (value) {
                  setState(() {
                    groupValue = value;
                  });
                },
              ),
            ),
            preferredSize: Size(double.infinity, 44)),
      ),
      body: _segmentedChildren[groupValue],
    );
  }
}

class _SegmentedTab extends StatelessWidget {
  final String title;
  final bool selected;

  _SegmentedTab({this.title, this.selected = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Text(
        title,
        style: TextStyle(
          color: selected ? Colors.black : Color(0x747784)
        ),
      )
    );
  }
}

