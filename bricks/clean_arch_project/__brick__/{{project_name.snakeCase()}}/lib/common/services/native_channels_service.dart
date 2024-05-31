import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:{{project_name.snakeCase()}}/common/common.dart';

// THIS CLASS IS TO COMMUNICATE WITH NATIVE
class NativeChannelServices {
  static final MethodChannel _channel =
      MethodChannel(NativeChannels.mainChannel.value);

  static Future<dynamic> showNativeDialog(String title, String message) async {
    final dynamic data =
        await _channel.invokeMethod(NativeChannels.showNativeDialog.value, {
      'title': title,
      'message': message,
    });
    return data;
  }

  static Future<dynamic> getDataFromNative(String route,
      {dynamic value1, dynamic value2}) async {
    final dynamic data = await _channel.invokeMethod('getDataFromNative', {
      'key': route,
      'value1': jsonEncode(value1),
      'value2': jsonEncode(value2),
    });
    return data;
  }
}
