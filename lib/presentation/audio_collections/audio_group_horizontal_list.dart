import 'package:audio_player/presentation/audio_collections/ui_models/audio_group_ui.dart';
import 'package:flutter/cupertino.dart';

class AudioGroupHorizontalList extends StatelessWidget {
  final AudioGroupUi audioGroupUi;

  AudioGroupHorizontalList({
    @required this.audioGroupUi
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24, left: 16, right: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: _GroupHeader(title: audioGroupUi.groupTitle,),
          ),
          Container(
            height: 176,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: audioGroupUi.groupItemList.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(right: _isLast(index) ? 0 : 16.0),
                  width: 320,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    color: Color.fromRGBO(57, 60, 79, 0.3)
                  ),
                  child: Stack(
                    children: <Widget>[
                      Center(
                        child: Icon(
                          CupertinoIcons.photo_camera_solid,
                          color: CupertinoColors.white,
                          size: 128,
                        ),
                      ),
                      Positioned(
                        child: Text(audioGroupUi.groupItemList[index]),
                        top: 8,
                        left: 8,
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  bool _isLast(int index) => index == audioGroupUi.groupItemList.length - 1;
}

class _GroupHeader extends StatelessWidget {
  final String title;

  _GroupHeader({this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Text(
          title.toUpperCase(),
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          'See all',
          style: TextStyle(
              fontSize: 14,
              color: Color.fromRGBO(57, 60, 79, 0.5)
          ),
        )
      ],
    );
  }
}

