package com.example.quick_settings_tile_plugin

import android.content.Intent
import android.service.quicksettings.Tile
import android.service.quicksettings.TileService
import android.util.Log
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

class QuickSettingsTilePlugin: MethodCallHandler {
    private val CHANNEL = "quick_settings_tile_plugin"

    override fun onMethodCall(call: MethodCall, result: Result) {
        when (call.method) {
            "toggleTile" -> toggleQuickSettingsTile(result)
            else -> result.notImplemented()
        }
    }

    private fun toggleQuickSettingsTile(result: Result) {
        try {
            // Start the TileService to toggle the tile state
            val intent = Intent()
            intent.setClassName("com.example.quick_settings_tile_plugin", "com.example.quick_settings_tile_plugin.QuickSettingsTileService")
            result.success("Tile toggled successfully")
        } catch (e: Exception) {
            result.error("ERROR", "Failed to toggle tile", e.localizedMessage)
        }
    }

    class QuickSettingsTileService : TileService() {
        override fun onTileAdded() {
            val tile: Tile = qsTile
            tile.label = "Custom Tile"
            tile.icon = Icon.createWithResource(this, R.drawable.ic_tile_icon)
            tile.state = Tile.STATE_INACTIVE
            tile.updateTile()
        }

        override fun onClick() {
            val tile: Tile = qsTile
            if (tile.state == Tile.STATE_INACTIVE) {
                tile.state = Tile.STATE_ACTIVE
                Log.d("Tile", "Tile Activated")
            } else {
                tile.state = Tile.STATE_INACTIVE
                Log.d("Tile", "Tile Deactivated")
            }
            tile.updateTile()
        }

        override fun onTileRemoved() {
            // Handle cleanup if necessary
        }
    }
}
