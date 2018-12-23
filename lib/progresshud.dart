import 'dart:async';

import 'package:flutter/services.dart';

class Progresshud {
  static const MethodChannel _channel = const MethodChannel('progresshud');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<String> show() async {
    return await _channel.invokeMethod('show');
  }

  static Future<String> showWithStatus(String status) async {
    return await _channel.invokeMethod('showWithStatus', status);
  }

  static Future<String> showInfoWithStatus(String status) async {
    return await _channel.invokeMethod('showInfoWithStatus', status);
  }

  static Future<String> showErrorWithStatus(String status) async {
    return await _channel.invokeMethod('showErrorWithStatus', status);
  }

  static Future<String> showSuccessWithStatus(String status) async {
    return await _channel.invokeMethod('showSuccessWithStatus', status);
  }

  static Future<String> setDefaultStyleDark() async {
    return await _channel.invokeMethod('setDefaultStyleDark');
  }

  static Future<String> setDefaultStyleLight() async {
    return await _channel.invokeMethod('setDefaultStyleLight');
  }

  static Future<String> setDefaultMaskTypeNone() async {
    return await _channel.invokeMethod('setDefaultMaskTypeNone');
  }

  static Future<String> setDefaultMaskTypeBlack() async {
    return await _channel.invokeMethod('setDefaultMaskTypeBlack');
  }

  static Future<String> setDefaultMaskTypeClear() async {
    return await _channel.invokeMethod('setDefaultMaskTypeClear');
  }

  static Future<String> setDefaultMaskTypeGradient() async {
    return await _channel.invokeMethod('setDefaultMaskTypeGradient');
  }

  static Future<bool> isVisible() async {
    return await _channel.invokeMethod('isVisible');
  }

  static Future<String> dismiss() async {
    return await _channel.invokeMethod('dismiss');
  }
}
