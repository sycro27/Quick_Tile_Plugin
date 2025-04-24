import 'dart:async';
import 'package:flutter/services.dart';

class QuickSettingsTilePlugin {
  static const MethodChannel _channel = MethodChannel('quick_settings_tile_plugin');

  // Method to toggle the Quick Settings tile state
  static Future<void> toggleTile() async {
    try {
      await _channel.invokeMethod('toggleTile');
    } on PlatformException catch (e) {
      print("Failed to toggle tile: '${e.message}'.");
    }
  }
}
