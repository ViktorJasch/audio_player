import 'package:audio_player/presentation/audio_collections/audio_collection_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MindfulnessApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
        DefaultMaterialLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
      ],
      home: AudioCollectionScreen(),
    );
  }
}
