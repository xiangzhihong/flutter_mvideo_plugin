import 'package:flutter/material.dart';

import 'package:flutter_mvideo_plugin/flutter_video_plugin.dart';


class VideoPlayerPage extends StatelessWidget {

  var controller;

  @override
  Widget build(BuildContext context) {
    var x = 0.0;
    var y = 0.0;
    var width = 410.0;
    var height = width * 9.0 / 16.0;

    MVideoPlayer videoPlayer = MVideoPlayer(
        onCreated: _onPlayerViewCreate,
        x: x,
        y: y,
        width: width,
        height: height);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Plugin'),
        ),
        body: Container(
          child: videoPlayer,
          width: width,
          height: height,
        ),
      ),
    );
  }

  void _onPlayerViewCreate(viewPlayerController) {
    this.controller = viewPlayerController;
    this.controller.loadUrl("http://baobab.kaiyanapp.com/api/v1/playUrl?vid=179506&resourceType=video&editionType=default&source=aliyun&playUrlType=url_oss","http://img.kaiyanapp.com/579ccf17076de3c9b029587ea217dd6c.png?imageMogr2/quality/60/format/jp");
  }
}

