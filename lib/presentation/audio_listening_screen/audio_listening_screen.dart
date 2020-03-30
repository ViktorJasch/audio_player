import 'package:audio_player/presentation/audio_collections/ui_models/audio_item_ui.dart';
import 'package:audio_player/presentation/audio_listening_screen/audio_state_enum.dart';
import 'package:audio_player/presentation/audio_listening_screen/circle_timer.dart';
import 'package:audio_player/presentation/widgets/audio_app_bar.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class AudioListeningScreen extends StatefulWidget {
  final Image background;
  final AudioItemUi item;
  final bool isPlaying;

  AudioListeningScreen({this.background, this.item, this.isPlaying = false});

  @override
  _AudioListeningScreenState createState() => _AudioListeningScreenState();
}

class _AudioListeningScreenState extends State<AudioListeningScreen> {
  final _controller = StreamController<AudioStateEnum>();

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
                  widget.item.title,
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 32,
                      color: Colors.white
                  ),
                ),
                Spacer(flex: 2),
                CircleTimer(
                  audioDuration: Duration(seconds: 40),
                  title: 'Title',
                  initialState: widget.isPlaying ? AudioStateEnum.active : AudioStateEnum.stop,
                  stateStream: _controller.stream,
                ),
                Spacer(flex: 3),
                Padding(
                  padding: const EdgeInsets.only(bottom: 32.0, left: 16, right: 16),
                  child: _AudioActionPanel(
                    initState: widget.isPlaying ? AudioStateEnum.active : AudioStateEnum.stop,
                    sink: _controller.sink,
                  )
                )
              ],
            ),
          ),
        ));
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }
}

class _AudioActionPanel extends StatefulWidget {
  final Sink<AudioStateEnum> sink;
  final AudioStateEnum initState;

  _AudioActionPanel({this.initState, this.sink});
  @override
  _AudioActionPanelState createState() => _AudioActionPanelState(initState);
}

class _AudioActionPanelState extends State<_AudioActionPanel> {
  var _currentState;

  _AudioActionPanelState(this._currentState);

  @override
  Widget build(BuildContext context) {
    if (_currentState == AudioStateEnum.pause) {
      return _buildPauseState();
    } else if (_currentState == AudioStateEnum.active) {
      return _buildActiveState();
    } else {
      return _buildStopState();
    }
  }

  Widget _buildActiveState() {
    return _ActionButton(
      title: 'Pause',
      onPressed: () => _setNewState(AudioStateEnum.pause)
    );
  }

  Widget _buildPauseState() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        _ActionButton(
          title: 'Stop',
          onPressed: () => _setNewState(AudioStateEnum.stop)
        ),
        _ActionButton(
          title: 'Resume',
          isAccent: true,
          onPressed: () => _setNewState(AudioStateEnum.active)
        )
      ],
    );
  }

  Widget _buildStopState() {
    return _ActionButton(
      title: 'Play',
      isAccent: true,
      onPressed: () => _setNewState(AudioStateEnum.active)
    );
  }

  void _setNewState(AudioStateEnum state) {
    setState(() {
      _currentState = state;
    });
    widget.sink.add(state);
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
