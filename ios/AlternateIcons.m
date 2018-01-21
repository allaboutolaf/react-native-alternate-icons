#import "AlternateIcons.h"
#import <React/RCTClipboard.h>
#import <React/RCTLog.h>
#import <React/RCTUtils.h>
#import <UIKit/UIKit.h>

@implementation AlternateIcons

#define SYSTEM_VERSION_EQUAL_TO(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)             ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)    ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

RCT_EXPORT_MODULE();

- (dispatch_queue_t)methodQueue {
    return dispatch_get_main_queue();
}

RCT_EXPORT_METHOD(setIconName: (NSString *)name
                  resolver: (RCTPromiseResolveBlock)resolve
                  rejecter: (RCTPromiseRejectBlock)reject) {
    if (SYSTEM_VERSION_LESS_THAN(@"10.3")) {
        return reject(@"error", @"Alternate icons are not supported on iOS versions < 10.3", nil);
    }

    if (![[UIApplication sharedApplication] supportsAlternateIcons]) {
        return reject(@"error", @"Alternate icons are not supported", nil);
    }

    [[UIApplication sharedApplication] setAlternateIconName:name
                                          completionHandler:^(NSError *_Nullable error) {
                                              if (error != nil) {
                                                  return reject(@"error", @"Problem changing the icon", error);
                                              } else {
                                                  return resolve(@true);
                                              }
                                          }];
}

RCT_EXPORT_METHOD(reset: (RCTPromiseResolveBlock)resolve
                  rejecter: (RCTPromiseRejectBlock)reject) {
    if (SYSTEM_VERSION_LESS_THAN(@"10.3")) {
        return resolve(@false);
    }

    if (![[UIApplication sharedApplication] supportsAlternateIcons]) {
        return resolve(@false);
    }

    [[UIApplication sharedApplication] setAlternateIconName:nil
                                          completionHandler:^(NSError *_Nullable error) {
                                              if (error != nil) {
                                                  return reject(@"error", @"Problem changing the icon", error);
                                              } else {
                                                  return resolve(@true);
                                              }
                                          }];
}

RCT_EXPORT_METHOD(getIconName: (RCTPromiseResolveBlock)resolve
                  rejecter: (RCTPromiseRejectBlock)reject) {
    if (SYSTEM_VERSION_LESS_THAN(@"10.3")) {
        return resolve(@"default");
    }

    if (![[UIApplication sharedApplication] supportsAlternateIcons]) {
        return resolve(@"default");
    }

    NSString *name = [[UIApplication sharedApplication] alternateIconName];
    if (name == nil) {
        name = @"default";
    }
    return resolve(name);
}

RCT_EXPORT_METHOD(isSupported: (RCTPromiseResolveBlock)resolve
                  rejecter: (RCTPromiseRejectBlock)reject) {
    if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"10.3")) {
        if ([[UIApplication sharedApplication] supportsAlternateIcons]) {
            return resolve(@YES);
        }
        return resolve(@NO);
    }
    return resolve(@NO);
}

@end
