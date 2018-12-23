package com.oversketch.progresshud

import android.util.Log
import com.bigkoo.svprogresshud.SVProgressHUD
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar

lateinit var dialog: SVProgressHUD
lateinit var maskType: SVProgressHUD.SVProgressHUDMaskType

class ProgresshudPlugin: MethodCallHandler {
    companion object {
        @JvmStatic
        fun registerWith(registrar: Registrar) {
            val channel = MethodChannel(registrar.messenger(), "progresshud")
            channel.setMethodCallHandler(ProgresshudPlugin())

            dialog = SVProgressHUD(registrar.activity())
            maskType = SVProgressHUD.SVProgressHUDMaskType.None
        }
    }

    override fun onMethodCall(call: MethodCall, result: Result) {
        Log.d("WOW", call.method)
        if (call.method == "getPlatformVersion") {
            result.success("Android ${android.os.Build.VERSION.RELEASE}")
        } else if (call.method == "show") {
            dialog.showWithMaskType(maskType)
        } else if (call.method == "showWithStatus") {
            dialog.showWithStatus(call.arguments.toString(), maskType)
        } else if (call.method == "showInfoWithStatus") {
            dialog.showInfoWithStatus(call.arguments.toString(), maskType)
        } else if (call.method == "showErrorWithStatus") {
            dialog.showErrorWithStatus(call.arguments.toString(), maskType)
        } else if (call.method == "showSuccessWithStatus") {
            dialog.showSuccessWithStatus(call.arguments.toString(), maskType)
        } else if (call.method == "setDefaultMaskTypeNone") {
            maskType = SVProgressHUD.SVProgressHUDMaskType.None
            dialog.showWithMaskType(SVProgressHUD.SVProgressHUDMaskType.None)
        } else if (call.method == "setDefaultMaskTypeBlack") {
            maskType = SVProgressHUD.SVProgressHUDMaskType.Black
            dialog.showWithMaskType(SVProgressHUD.SVProgressHUDMaskType.Black)
        } else if (call.method == "setDefaultMaskTypeClear") {
            maskType = SVProgressHUD.SVProgressHUDMaskType.Clear
            dialog.showWithMaskType(SVProgressHUD.SVProgressHUDMaskType.Clear)
        } else if (call.method == "setDefaultMaskTypeGradient") {
            maskType = SVProgressHUD.SVProgressHUDMaskType.Gradient
            dialog.showWithMaskType(SVProgressHUD.SVProgressHUDMaskType.Gradient)
        } else if (call.method == "dismiss") {
            dialog.dismiss()
        } else if (call.method == "isVisible") {
            if (dialog.isShowing) {
                result.success(true)
            } else {
                result.success(false)
            }
        } else {
            result.notImplemented()
        }
    }
}
