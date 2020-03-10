import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mvideo_plugin/video_plugin_callback.dart';
import 'package:flutter_mvideo_plugin/video_plugin_controller.dart';

class MVideoPlayer extends StatefulWidget {
  
  final MVideoPlayerCreatedCallBack onCreated;
  final x;
  final y;
  final width;
  final height;

  MVideoPlayer(
      {Key key,
      @required this.onCreated,
      @required this.x,
      @required this.y,
      @required this.width,
      @required this.height,});

  @override
  _MVideoPlayerState createState() => _MVideoPlayerState();
}

class _MVideoPlayerState extends State<MVideoPlayer> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      child: initPlayerView(),
    );
  }

  initPlayerView() {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return AndroidView(
        viewType: 'flutter_mvideo_plugin',
        onPlatformViewCreated: onPlatformViewCreated,
        creationParams: <String, dynamic>{
          "x": widget.x,
          "y": widget.y,
          "width": widget.width,
          "height": widget.height,
        },
        creationParamsCodec: const StandardMessageCodec(),
      );
    } else {
      return UiKitView(
        viewType: 'flutter_mvideo_plugin',
        onPlatformViewCreated: onPlatformViewCreated,
        creationParams: <String, dynamic>{
          "x": widget.x,
          "y": widget.y,
          "width": widget.width,
          "height": widget.height,
        },
        creationParamsCodec: const StandardMessageCodec(),
      );
    }
  }

  Future<void> onPlatformViewCreated(int id) async {
    if (widget.onCreated == null) {
      return;
    }
    widget.onCreated(MVideoPlayerController.init(id));
  }
}
