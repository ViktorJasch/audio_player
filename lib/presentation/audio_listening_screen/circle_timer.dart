import 'dart:async';

import 'package:audio_player/presentation/audio_listening_screen/audio_state_enum.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class CircleTimer extends StatefulWidget {
  final Duration audioDuration;
  final Duration initialTime;
  final String title;
  final AudioStateEnum initialState;
  final Stream<AudioStateEnum> stateStream;

  CircleTimer({this.audioDuration, this.initialTime, this.title, this.initialState, this.stateStream});

  @override
  _CircleTimerState createState() => _CircleTimerState();
}

class _CircleTimerState extends State<CircleTimer> {
  int _secondsLeft;
  Timer _timer;
  StreamSubscription<AudioStateEnum> _subscription;

  @override
  void initState() {
    _handleState(widget.initialState);
    _subscription = widget.stateStream.listen((AudioStateEnum event) {
      _handleState(event);
    });
    _secondsLeft = widget.initialTime?.inSeconds ?? 0;
    _startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: CustomPaint(
        size: Size(240, 240),
        painter: _CircleTimerPainter(widget.audioDuration.inSeconds, _secondsLeft),
        child: Text(
          _printDuration(Duration(seconds: _secondsLeft)),
          style: TextStyle(
            fontWeight: FontWeight.w200,
            fontSize: 32,
            color: Colors.white
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _subscription.cancel();
    _timer.cancel();
    super.dispose();
  }

  void _handleState(AudioStateEnum state) {
    if (state == AudioStateEnum.active) {
      _startTimer();
    } else if (state == AudioStateEnum.stop) {
      _timer.cancel();
      setState(() {
        _secondsLeft = 0;
      });
    } else if (state == AudioStateEnum.pause) {
      _timer.cancel();
    }
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _secondsLeft++;
      });
      if (_secondsLeft >= widget.audioDuration.inSeconds) {
        timer.cancel();
      }
    });
  }

  String _printDuration(Duration duration) {
    String twoDigits(int n) {
      if (n >= 10) return "$n";
      return "0$n";
    }

    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "$twoDigitMinutes:$twoDigitSeconds";
  }
}

class _CircleTimerPainter extends CustomPainter {
  int duration;
  int left;

  _CircleTimerPainter(this.duration, this.left);

  var backgroundPaint = Paint()
    ..color = Color.fromRGBO(255, 255, 255, 0.3)
    ..style = PaintingStyle.stroke
    ..strokeCap = StrokeCap.round
    ..strokeWidth = 4
    ..isAntiAlias = true;

  Paint complete = new Paint()
    ..color = Colors.white
    ..strokeCap = StrokeCap.round
    ..style = PaintingStyle.stroke
    ..strokeWidth = 4;

  @override
  void paint(Canvas canvas, Size size) {
    Offset center = Offset(size.width / 2.0, size.height / 2.0);
    canvas.drawCircle(center, 120.0, backgroundPaint);
    
    double arcAngle = 2*pi* (left/duration);

    canvas.drawArc(
        Rect.fromCircle(center: center, radius: 120),
        -pi/2,
        arcAngle,
        false,
        complete
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
