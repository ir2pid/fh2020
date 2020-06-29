import 'package:flutter/material.dart';

import 'package:Officerr/src/pages/video_details/animated_bottom_sheet.dart';
import 'package:Officerr/src/pages/video_details/video_widget.dart';

class SingleVideoPage extends StatelessWidget {
  static const tag = '/single-video-page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SafeArea(
            child: SizedBox.expand(
              child: VideoWidget(),
            ),
          ),
          AnimatedBottomSheet(),
        ],
      ),
    );
  }
}
