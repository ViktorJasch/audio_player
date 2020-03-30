import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AudioAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Function onVolumeTap;
  final Function onSettingsTap;
  final bool isVolumeOn;
  final bool isSettingsActive;
  final Key key;

  AudioAppBar({this.onVolumeTap, this.onSettingsTap, this.isVolumeOn,
      this.isSettingsActive, this.key});

  @override
  Size get preferredSize => Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(left: 16, right: 16, top: 32),
      child: Row(
        children: <Widget>[
          InkWell(
            onTap: () => Navigator.pop(context),
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
          Spacer(),
          InkWell(
            onTap: onVolumeTap,
            child: SvgPicture.asset(
              'assets/volume.svg',
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: 32,
          ),
          InkWell(
            onTap: onSettingsTap,
            child: SvgPicture.asset(
              _getSettingImagePath(),
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }

  String _getSettingImagePath() => isSettingsActive
      ? 'assets/settings_on.svg'
      : 'assets/settings_off.svg';
}
