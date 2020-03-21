import 'package:audio_player/presentation/audio_collections/ui_models/audio_item_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AudioGroupItem extends StatelessWidget {
  final AudioItemUi item;

  AudioGroupItem({@required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: Color.fromRGBO(57, 60, 79, 0.3)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            item.author,
            maxLines: 1,
            style: TextStyle(
              fontSize: 14,
            ),
          ),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                item.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                item.description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600
                ),
              ),
              SizedBox(height: 8),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  _Timer(timerText: item.time),
                  Spacer(),
                  InkWell(
                    onTap: () => print('on cliiiiick'),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 14),
                      decoration: BoxDecoration(
                        color: const Color(0xff08C5D1),
                        borderRadius: BorderRadius.all(Radius.circular(8))
                      ),
                      child: Text(
                        'BEGIN',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: CupertinoColors.white
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}

class _Timer extends StatelessWidget {
  final String timerText;

  _Timer({this.timerText});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(
          CupertinoIcons.clock,
          color: CupertinoColors.white,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Text(
            timerText,
            textAlign: TextAlign.start,
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w300
            ),
          ),
        ),
      ],
    );
  }
}

