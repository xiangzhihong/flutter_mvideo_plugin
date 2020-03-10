package com.kvideo.flutter_kvideo_plugin

import android.content.Context
import io.flutter.plugin.common.PluginRegistry.Registrar
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory

class VideoPlayerFactory(var registrar: Registrar) : PlatformViewFactory(
    StandardMessageCodec.INSTANCE) {

  override fun create(contex: Context?, viewId: Int, args: Any?): PlatformView {
    return VideoPlayerView(contex, viewId, args, this.registrar)
  }

}