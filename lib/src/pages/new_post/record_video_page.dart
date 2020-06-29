import 'dart:io';

import 'package:Officerr/src/constants.dart';
import 'package:Officerr/src/navigator.dart';
import 'package:Officerr/src/pages/new_post/new_post_page.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:camera/camera.dart';
import 'package:path_provider/path_provider.dart' as path;

class RecordVideoPage extends StatefulWidget {
  static String tag = 'record-video-page';

  @override
  _CameraAppState createState() => _CameraAppState();
}

class _CameraAppState extends State<RecordVideoPage> {
  CameraController controller;

  String _videoFilePath = '';
  Timer _timer;
  Stopwatch _stopwatch = Stopwatch();

  Duration videoDuration = Duration();

  Future<String> _generateFilePath() async {
    final dir = await path.getApplicationDocumentsDirectory();
    final filePath = (await dir.createTemp()).path;
    final hash = DateTime.now().toString();
    return '$filePath/$hash.mp4';
  }

  void _startRecordingVideo() async {
    _stopwatch.reset();
    _videoFilePath = await _generateFilePath();

    await controller.prepareForVideoRecording();
    await controller.startVideoRecording(_videoFilePath);
    _stopwatch.start();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_stopwatch.isRunning) {
        setState(() {
          videoDuration = _stopwatch.elapsed;
        });
      }
    });
  }

  void _stopVideoRecording(BuildContext context) async {
    await controller.stopVideoRecording();
    _stopwatch.stop();
    _timer.cancel();

    Navigator.push(context, MaterialPageRoute(
      builder: (_) => NewPostPage(File(_videoFilePath))
    ));

  }

  String _formatVideoDuration() {
    final minutes = ((videoDuration.inMilliseconds / (1000 * 60)) % 60).toInt();
    final seconds = ((videoDuration.inMilliseconds / 1000) % 60).toInt();
    return minutes.toString().padLeft(2, '0') + ':' + seconds.toString().padLeft(2, '0');
  }

  @override
  void initState() {
    super.initState();
    controller = CameraController(
      Constants.cameras[0],
      ResolutionPreset.high,
      enableAudio: true,
    );
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    _stopwatch?.stop();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double buttonBorderWidth = controller.value.isRecordingVideo ? 2 : 6;

    if (!controller.value.isInitialized) {
      return Container();
    }

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned.fill(
            child: AspectRatio(
                aspectRatio:
                controller.value.aspectRatio,
                child: CameraPreview(controller),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Visibility(
              visible: controller.value.isRecordingVideo,
              child: Padding(
                padding: const EdgeInsets.only(top: 32, left: 16),
                child: _VideoDurationText(_formatVideoDuration()),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              onTap: () {
                if (controller.value.isRecordingVideo) {
                  _stopVideoRecording(context);
                } else {
                  _startRecordingVideo();
                }
              },
              child: AnimatedContainer(
                width: 60,
                height: 60,
                duration: Duration(milliseconds: 900),
                margin: EdgeInsets.only(bottom: 32),
                decoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                    width: buttonBorderWidth),
                ),
                child: Visibility(
                  visible: controller.value.isRecordingVideo,
                  child: Icon(Icons.stop),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _VideoDurationText extends StatelessWidget {
  final String text;

  const _VideoDurationText(this.text);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(8)
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
        child: Text(text),
      ),
    );
  }
}
