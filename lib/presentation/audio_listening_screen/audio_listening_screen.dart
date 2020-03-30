import 'package:audio_player/presentation/audio_collections/ui_models/audio_item_ui.dart';
import 'package:audio_player/presentation/widgets/audio_app_bar.dart';
import 'package:flutter/material.dart';

class AudioListeningScreen extends StatelessWidget {
  final Image background;
  final AudioItemUi item;
  final bool isPlaying;

  AudioListeningScreen({this.background, this.item, this.isPlaying = false});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/background2.png'),
                fit: BoxFit.cover)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AudioAppBar(),
          body: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(top: 72),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  item.title,
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 32,
                    color: Colors.white
                  ),
                ),
                Spacer(flex: 1),
                Container(
                  width: 240,
                  height: 240,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(120)),
                  ),
                ),
                Spacer(flex: 2),
                Padding(
                  padding: const EdgeInsets.only(bottom: 32.0, left: 16, right: 16),
                  child: isPlaying ? _AudioActionPanel.active() : _AudioActionPanel.stop(),
                )
              ],
            ),
          ),
        ));
  }
}

class _AudioActionPanel extends StatefulWidget {
  static const String _stopState = 'stop';
  static const String _activeState = 'active';
  static const String _pauseState = 'pause';

  String _initState;

  _AudioActionPanel.active() {
    _initState = _activeState;
  }

  _AudioActionPanel.stop() {
    _initState = _pauseState;
  }

  @override
  _AudioActionPanelState createState() => _AudioActionPanelState(_initState);
}

class _AudioActionPanelState extends State<_AudioActionPanel> {
  var _currentState;

  _AudioActionPanelState(this._currentState);

  @override
  Widget build(BuildContext context) {
    if (_currentState == _AudioActionPanel._pauseState) {
      return _buildPauseState();
    } else if (_currentState == _AudioActionPanel._activeState) {
      return _buildActiveState();
    } else {
      return _buildStopState();
    }
  }

  Widget _buildActiveState() {
    return _ActionButton(
      title: 'Pause',
      onPressed: () =>
          setState(() {
            _currentState = _AudioActionPanel._pauseState;
          }),
    );
  }

  Widget _buildPauseState() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        _ActionButton(
          title: 'Stop',
          onPressed: () =>
            setState(() {
              _currentState = _AudioActionPanel._stopState;
            }),
        ),
        _ActionButton(
          title: 'Resume',
          isAccent: true,
          onPressed: () =>
              setState(() {
                _currentState = _AudioActionPanel._activeState;
              }),
        )
      ],
    );
  }

  Widget _buildStopState() {
    return _ActionButton(
      title: 'Play',
      isAccent: true,
      onPressed: () =>
          setState(() {
            _currentState = _AudioActionPanel._pauseState;
          }),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final Function onPressed;
  final String title;
  final bool isAccent;


  _ActionButton({
    @required this.onPressed,
    this.title,
    this.isAccent = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: 138,
        height: 40,
        decoration: BoxDecoration(
          color: isAccent ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.all(Radius.circular(8)),
          border: Border.fromBorderSide(
            BorderSide(
              color: Colors.white
            )
          )
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            title,
            style: TextStyle(
              color:  isAccent ? Colors.black : Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500
            ),
          ),
        ),
      ),
    );
  }
}
