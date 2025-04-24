import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'quick_settings_tile_plugin_platform_interface.dart';

/// An implementation of [QuickSettingsTilePluginPlatform] that uses method channels.
class MethodChannelQuickSettingsTilePlugin extends QuickSettingsTilePluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('quick_settings_tile_plugin');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
