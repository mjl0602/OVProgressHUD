#import "ProgresshudPlugin.h"
#import "SVProgressHUD.h"

@implementation ProgresshudPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"progresshud"
            binaryMessenger:[registrar messenger]];
  [SVProgressHUD setMaximumDismissTimeInterval:2.5];
  [SVProgressHUD setMinimumDismissTimeInterval:1.5];
  ProgresshudPlugin* instance = [[ProgresshudPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"getPlatformVersion" isEqualToString:call.method]) {
    result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
  }
    /// show loading
  else if ([@"show" isEqualToString:call.method]) {
      [SVProgressHUD show];
    result(@"success");
  }
//  else if ([@"showProgress" isEqualToString:call.method]) {
//      [SVProgressHUD showProgress:call.arguments];
//      result(@"success");
//  }
    /// show status
  else if ([@"showWithStatus" isEqualToString:call.method]) {
      [SVProgressHUD showWithStatus:call.arguments];
      result(@"success");
  }

  else if ([@"showInfoWithStatus" isEqualToString:call.method]) {
      [SVProgressHUD showInfoWithStatus:call.arguments];
      result(@"success");
  }
  else if ([@"showErrorWithStatus" isEqualToString:call.method]) {
      [SVProgressHUD showErrorWithStatus:call.arguments];
      result(@"success");
  }
  else if ([@"showSuccessWithStatus" isEqualToString:call.method]) {
      [SVProgressHUD showSuccessWithStatus:call.arguments];
      result(@"success");
  }
  /// style
  else if ([@"setDefaultStyleDark" isEqualToString:call.method]) {
      [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
      result(@"success");
  }
  else if ([@"setDefaultStyleLight" isEqualToString:call.method]) {
      [SVProgressHUD setDefaultStyle:SVProgressHUDStyleLight];
      result(@"success");
  }
    /// mask type
  else if ([@"setDefaultMaskTypeNone" isEqualToString:call.method]) {
      [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeNone];
      result(@"success");
  }
  else if ([@"setDefaultMaskTypeBlack" isEqualToString:call.method]) {
      [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
      result(@"success");
  }
  else if ([@"setDefaultMaskTypeClear" isEqualToString:call.method]) {
      [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeClear];
      result(@"success");
  }
  else if ([@"setDefaultMaskTypeGradient" isEqualToString:call.method]) {
      [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeGradient];
      result(@"success");
  }
    /// visiable
  else if ([@"isVisible" isEqualToString:call.method]) {
      bool visible = [SVProgressHUD isVisible];
      result(@(visible));
  }
  /// dismiss
  else if ([@"dismiss" isEqualToString:call.method]) {
      [SVProgressHUD dismiss];
      result(@"success");
  }
  /// error
  else {
    result(FlutterMethodNotImplemented);
  }
}

@end
