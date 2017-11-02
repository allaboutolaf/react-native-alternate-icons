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

RCT_REMAP_MATHOD(setIconName: (NSString *)name,
                 resolver: (RCTPromiseResolveBlock)resolve,
                 rejecter: (RCTPromiseRejectBlock)reject) {
    if (SYSTEM_VERSION_LESS_THAN(@"10.3")) {
        reject(RCTMakeAndLogError(@"Alternate icons are not supported on iOS versions < 10.3"));
    }

    if (![[UIApplication sharedApplication] supportsAlternateIcons]) {
        reject(RCTMakeError(@"Alternate icons are not supported"));
    }

    [[UIApplication sharedApplication] setAlternateIconName:name
                                          completionHandler:^(NSError *_Nullable error) {
                                              if (error != nil) {
                                                  reject(RCTJSErrorFromNSError(error));
                                              } else {
                                                  resolve();
                                              }
                                          }];
}

RCT_REMAP_METHOD(reset,
                 resolver: (RCTPromiseResolveBlock)resolve,
                 rejecter: (RCTPromiseRejectBlock)reject) {
    if (SYSTEM_VERSION_LESS_THAN(@"10.3")) {
        reject(RCTMakeAndLogError(@"Alternate icons are not supported on iOS versions < 10.3"));
    }

    if (![[UIApplication sharedApplication] supportsAlternateIcons]) {
        reject(RCTMakeError(@"Alternate icons are not supported"));
    }

    [[UIApplication sharedApplication] setAlternateIconName:nil
                                          completionHandler:^(NSError *_Nullable error) {
                                              if (error != nil) {
                                                  reject(RCTJSErrorFromNSError(error));
                                              } else {
                                                  resolve();
                                              }
                                          }];
}

RCT_REMAP_METHOD(getIconName,
                 resolver: (RCTPromiseResolveBlock)resolve,
                 rejecter: (RCTPromiseRejectBlock)reject) {
    if (SYSTEM_VERSION_LESS_THAN(@"10.3")) {
        reject(RCTMakeAndLogError(@"Alternate icons are not supported on iOS versions < 10.3"));
    }

    if (![[UIApplication sharedApplication] supportsAlternateIcons]) {
        reject(RCTMakeError(@"Alternate icons are not supported"));
    }

    NSString *name = [[UIApplication sharedApplication] alternateIconName];
    if (name == nil) {
        name = @"default";
    }
    resolve(name);
}

RCT_REMAP_METHOD(isSupported,
                 resolver: (RCTPromiseResolveBlock)resolve,
                 rejecter: (RCTPromiseRejectBlock)reject) {
    if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"10.3")) {
        if ([[UIApplication sharedApplication] supportsAlternateIcons]) {
            resolve(@YES);
        } else {
            resolve(@NO);
        }
    } else {
        resolve(@NO);
    }
}

@end
