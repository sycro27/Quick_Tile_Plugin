import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'quick_settings_tile_plugin_method_channel.dart';

abstract class QuickSettingsTilePluginPlatform extends PlatformInterface {
  /// Constructs a QuickSettingsTilePluginPlatform.
  QuickSettingsTilePluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static QuickSettingsTilePluginPlatform _instance = MethodChannelQuickSettingsTilePlugin();

  /// The default instance of [QuickSettingsTilePluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelQuickSettingsTilePlugin].
  static QuickSettingsTilePluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [QuickSettingsTilePluginPlatform] when
  /// they register themselves.
  static set instance(QuickSettingsTilePluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
