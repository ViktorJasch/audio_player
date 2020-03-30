import 'package:audio_player/presentation/widgets/audio_app_bar.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/background2.png'),
            fit: BoxFit.cover)
      ),
      child: Container(
        color: Color.fromRGBO(0, 0, 0, 0.2),
        child: Scaffold(
          appBar: AudioAppBar(
            onVolumeTap: () {
              print('onVolumeTap');
            },
            onSettingsTap: () => Navigator.pop(context),
            isSettingsActive: true,
            isVolumeOn: true,
          ),
          backgroundColor: Colors.transparent,
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                VolumeSlider(
                  initialVolumeValue: 20,
                  onVolumeChange: (value) => print('newValue: $value'),
                ),
                SizedBox(height: 40),
                SoundListView()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class VolumeSlider extends StatefulWidget {
  final double initialVolumeValue;
  final Function(double) onVolumeChange;

  VolumeSlider({this.initialVolumeValue, this.onVolumeChange});

  @override
  _VolumeSliderState createState() => _VolumeSliderState();
}

class _VolumeSliderState extends State<VolumeSlider> {
  double _value;

  @override
  void initState() {
    _value = widget.initialVolumeValue ?? 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'VOLUME',
          textAlign: TextAlign.start,
          style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Colors.white
          ),
        ),
        Slider(
          min: 1,
          max: 100,
          value: _value,
          activeColor: Colors.white,
          inactiveColor: Colors.grey,
          onChanged: (double newValue) {
            setState(() {
              _value = newValue;
            });
            widget.onVolumeChange(newValue);
          }
        )
      ],
    );
  }
}

class SoundListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
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
          padding: EdgeInsets.only(top: 8),
          height: 48,
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children: List.generate(10, (index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: _getChild(),
            )),
          ),
        )
      ],
    );
  }

  Widget _getChild() {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: Colors.purpleAccent,
        borderRadius: BorderRadius.all(Radius.circular(24))
      ),
    );
  }
}


