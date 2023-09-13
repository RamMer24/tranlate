import 'dart:io';

import 'package:flutter/material.dart';

import 'package:video_player/video_player.dart';

class addvideo extends StatefulWidget {
  var vid;
  addvideo({this.vid});
  @override
  State<addvideo> createState() => _addvideoState();
}

class _addvideoState extends State<addvideo> {
  VideoPlayerController? _controller;

  @override
  void initState() {
    print("12324");
    print(widget.vid);
    // TODO: implement initState
    super.initState();
    _controller = VideoPlayerController.network(widget.vid)
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: ClipRRect(borderRadius: BorderRadius.circular(20),
        child: Center(
          child: _controller!.value.isInitialized
              ? AspectRatio(
            aspectRatio: _controller!.value.aspectRatio,
            child: VideoPlayer(_controller!,),
          )
              : CircularProgressIndicator(color: Colors.white),
        ),
      ),
      floatingActionButton: FloatingActionButton(backgroundColor: Colors.transparent,
        onPressed: () {
          setState(() {
            _controller!.value.isPlaying
                ? _controller!.pause()
                : _controller!.play();
          });
        },
        child: Icon(
          _controller!.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}