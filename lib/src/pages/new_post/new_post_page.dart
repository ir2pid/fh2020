import 'dart:io';

import 'package:Officerr/src/constants.dart';
import 'package:Officerr/src/models/post.dart';
import 'package:Officerr/src/providers/post_provider.dart';
import 'package:Officerr/src/util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class NewPostPage extends StatefulWidget {
  static String tag = 'new-post';

  final File videoFile;

  const NewPostPage(this.videoFile);

  @override
  _NewPostPageState createState() => _NewPostPageState();
}

class _NewPostPageState extends State<NewPostPage> {
  VideoPlayerController _controller;
  TextEditingController _videoName = TextEditingController();
  TextEditingController _videoDescription = TextEditingController();

  bool _isNameAndDescriptionValid = false;

  void _onSavePost(BuildContext context) {
    final post = Post(
      id: DateTime.now().timeZoneOffset.inMilliseconds,
      name: _videoName.text,
      description: _videoDescription.text,
      pictureUrl: 'https://i.pinimg.com/originals/5b/09/a4/5b09a434ad8840be592b5e7b6231ff14.jpg'
    );

    Provider.of<PostProvider>(context, listen: false).addPost(post);

    Navigator.of(context).popUntil((route) => route.isFirst);
  }

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.file(widget.videoFile)
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Center(
              child: _controller.value.initialized
                  ? GestureDetector(
                onTap: () {
                  setState(() {
                    _controller.value.isPlaying
                        ? _controller.pause()
                        : _controller.play();
                  });
                },
                child: AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                ),
              )
                  : Container()),
          Align(
            alignment: Alignment.bottomCenter,
              child: Container(
                height: 250,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: util.getTheme(context).primaryColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Constants().dRadius),
                    topRight: Radius.circular(Constants().dRadius),
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    TextField(
                      maxLines: 1,
                      controller: _videoName,
                      decoration: InputDecoration(
                          labelText: 'Title'
                      ),
                      onChanged: (value) {
                        setState(() {
                          _isNameAndDescriptionValid = value.trim().isNotEmpty &&
                              _videoDescription.text.trim().isNotEmpty;
                        });
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16, bottom: 32),
                      child: TextField(
                        controller: _videoDescription,
                        decoration: InputDecoration(
                            labelText: 'Description',
                        ),
                        onChanged: (value) {
                          setState(() {
                            _isNameAndDescriptionValid = value.trim().isNotEmpty &&
                                _videoName.text.trim().isNotEmpty;
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      width: double.maxFinite,
                      child: RaisedButton(
                        child: Text('Make it Public'),
                        onPressed: _isNameAndDescriptionValid ? () => _onSavePost(context) : null,
                      ),
                    )
                  ],
                ),
              ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}


