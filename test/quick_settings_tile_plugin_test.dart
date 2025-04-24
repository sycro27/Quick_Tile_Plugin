import 'package:flutter_test/flutter_test.dart';
import 'package:quick_settings_tile_plugin/quick_settings_tile_plugin.dart';
import 'package:quick_settings_tile_plugin/quick_settings_tile_plugin_platform_interface.dart';
import 'package:quick_settings_tile_plugin/quick_settings_tile_plugin_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockQuickSettingsTilePluginPlatform
    with MockPlatformInterfaceMixin
    implements QuickSettingsTilePluginPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final QuickSettingsTilePluginPlatform initialPlatform = QuickSettingsTilePluginPlatform.instance;

  test('$MethodChannelQuickSettingsTilePlugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelQuickSettingsTilePlugin>());
  });

  test('getPlatformVersion', () async {
    QuickSettingsTilePlugin quickSettingsTilePlugin = QuickSettingsTilePlugin();
    MockQuickSettingsTilePluginPlatform fakePlatform = MockQuickSettingsTilePluginPlatform();
    QuickSettingsTilePluginPlatform.instance = fakePlatform;

    expect(await quickSettingsTilePlugin.getPlatformVersion(), '42');
  });
}
