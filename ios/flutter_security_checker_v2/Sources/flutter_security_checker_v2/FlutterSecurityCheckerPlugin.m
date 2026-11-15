#if __has_include(<flutter_security_checker_v2/FlutterSecurityCheckerPlugin.h>)
#import <flutter_security_checker_v2/FlutterSecurityCheckerPlugin.h>
#else
#import "include/flutter_security_checker_v2/FlutterSecurityCheckerPlugin.h"
#endif
#import "security/JailBreakChecker.h"
#import "security/IntegrityChecker.h"

@implementation FlutterSecurityCheckerPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
                                   methodChannelWithName:@"flutter_security_checker"
                                   binaryMessenger:[registrar messenger]];
  FlutterSecurityCheckerPlugin* instance = [[FlutterSecurityCheckerPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"isRooted" isEqualToString:call.method]) {
    result([NSNumber numberWithBool:[JailBreakChecker isJailBroken]]);
  } else if ([@"isRealDevice" isEqualToString:call.method]) {
    result([NSNumber numberWithBool:!TARGET_OS_SIMULATOR]);
  } else if ([@"hasCorrectlyInstalled" isEqualToString:call.method]) {
    result([NSNumber numberWithBool:[IntegrityChecker isBinaryEncrypted]]);
  } else {
    result(FlutterMethodNotImplemented);
  }
}
@end
