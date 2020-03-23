import 'package:audio_player/presentation/audio_collections/audio_group_item.dart';
import 'package:audio_player/presentation/audio_collections/ui_models/audio_group_ui.dart';
import 'package:audio_player/presentation/audio_collections/ui_models/audio_item_ui.dart';
import 'package:audio_player/presentation/audio_listening_screen/audio_listening_screen.dart';
import 'package:flutter/material.dart';

class AudioGroupHorizontalList extends StatelessWidget {
  final AudioGroupUi audioGroupUi;

  AudioGroupHorizontalList({@required this.audioGroupUi});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 40, 16, 24),
          child: _GroupHeader(
            title: audioGroupUi.groupTitle,
          ),
        ),
        Container(
          height: 176,
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              for (var item in audioGroupUi.groupItemList)
                _HorizontalListItem(
                  item: item,
                  isFirst: audioGroupUi.groupItemList.indexOf(item) == 0,
                )
            ],
          ),
        ),
      ],
    );
  }
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
          style:
              TextStyle(fontSize: 14, color: Color.fromRGBO(57, 60, 79, 0.5)),
        )
      ],
    );
  }
}

class _HorizontalListItem extends StatelessWidget {
  final AudioItemUi item;
  final bool isFirst;

  _HorizontalListItem({this.item, this.isFirst});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(right: 16, left: isFirst ? 16 : 0),
        width: 320,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            color: Color.fromRGBO(57, 60, 79, 0.3)),
        child: AudioGroupItem(
          item: item,
          onBeginPress: () => _navigateToListening(context, true),
          onItemTap: () => _navigateToListening(context, false),
        ));
  }

  void _navigateToListening(BuildContext context, bool isPlaying) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                AudioListeningScreen(
                  item: item,
                  isPlaying: isPlaying,
                )));
  }
}
