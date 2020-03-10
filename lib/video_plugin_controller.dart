import 'package:flutter/services.dart';

class MVideoPlayerController {

  MethodChannel _channel;

  MVideoPlayerController.init(int id) {
    _channel = MethodChannel("flutter_mvideo_plugin_$id");
  }

  //暂停播放
  void onPause() {
    _channel.invokeListMethod('onPause');
  }

  //继续播放
  void onResume() {
    _channel.invokeListMethod('onResume');
  }

  //退出全屏
  Future<bool> quitFullScreen() async {
    return await _channel.invokeMethod<bool>('quitFullScreen');
  }

  //网络视频播放
  Future<void> loadUrl(String url, String cover) async {
    assert(url != null);
    return _channel.invokeMethod('loadUrl', {"videoUrl": url, "cover": cover});
  }
}