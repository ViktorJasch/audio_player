import 'package:flutter/material.dart';

class SoundHorizontalListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'SOUND',
            textAlign: TextAlign.start,
            style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Colors.white
            ),
          ),
          Container(
            height: 100,
            margin: EdgeInsets.only(top: 8),
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: List.generate(10, (index) => Container(
                padding: EdgeInsets.only(
                  left: index == 0 ? 0 : 20,
                  right: index == 9 ? 0 : 20
                ),
                child: _SoundItem(
                  isSelect: index == 0,
                  imagePath: index == 0
                      ? 'assets/picture_active.png'
                      : 'assets/picture.png',
                  title: 'Title $index',
                ),
              )),
            ),
          )
        ],
      ),
    );
  }
}

class _SoundItem extends StatelessWidget {
  final String imagePath;
  final String title;
  final bool isSelect;

  _SoundItem({this.imagePath, this.title, this.isSelect});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Opacity(
          opacity: isSelect ? 1 : 0.75,
          child: CircleAvatar(
            backgroundColor: Colors.purpleAccent,
            child: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(19)),
                  color: Colors.white
              ),
              child: Image.asset('assets/picture_active.png'),
            ),
          ),
        ),
        SizedBox(height: 8),
        Text(
          title,
          textAlign: TextAlign.center,
          maxLines: 2,
          style: TextStyle(
            fontSize: 10,
            color: Colors.white
          ),
        )
      ],
    );
  }
}

