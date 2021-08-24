//
//  Ads_CommonTool.m
//  AdsDemo
//
//  Created by  on 2021/8/18.
//

#import "Ads_CommonTool.h"

@implementation Ads_CommonTool

+(instancetype)ads_defaultCommonTool {
    static Ads_CommonTool *tool = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        tool = [[Ads_CommonTool alloc] init];
    });
    return tool;
}

-(void)ads_initWithType:(DDMHAdsOperatorType)type andAppIds:(NSDictionary *)idDict andABUExtraPlant:(void(^)(void))extraPlat{
    if (type&DDMHAdsOperatorGoogle) {
        SDKLog(@"google init");
        // 初始化 Google 广告的实现
    }
    if (type&DDMHAdsOperatorBU) {
        SDKLog(@"穿山甲 init");
        NSString *appId = idDict[@"BU"];
        [self configBUAdsWithAppId:appId];
    }
    if (type && DDMHAdsOperatorABU) {
        SDKLog(@"聚合 init");
        NSString *appId = idDict[@"ABU"];
        [self ads_initABUWithAppId:appId andExtraPlant:extraPlat];
    }
    
}

- (void)configBUAdsWithAppId:(NSString *)appId{
    [BUAdSDKManager setAppID:appId];//@"5000546"
    [BUAdSDKManager setIsPaidApp:NO];
    [BUAdSDKManager setLoglevel:BUAdSDKLogLevelDebug];
}

-(void)ads_initABUWithAppId:(NSString *)appId andExtraPlant:(void(^)(void))extraPlat{
    SDKLog(@"初始化 聚合");
    
    extraPlat();
    
    NSString *appid = appId;//@"5000546"
    // init app id
    [ABUAdSDKManager setAppID:appid];
}


//获取手机当前显示的ViewController
+ (UIViewController*)ads_getCurrentViewController {
    UIViewController* vc = [UIApplication sharedApplication].keyWindow.rootViewController;
    while (1) {
        if ([vc isKindOfClass:[UITabBarController class]]) {
            vc = ((UITabBarController*)vc).selectedViewController;
        }
        if ([vc isKindOfClass:[UINavigationController class]]) {
            vc = ((UINavigationController*)vc).visibleViewController;
        }
        if (vc.presentedViewController) {
            vc = vc.presentedViewController;
        }else{
            break;
        }
    }
    return vc;
}

+(BOOL)ads_showLog {
    NSDictionary *infoDic = [[NSBundle mainBundle] infoDictionary];
    BOOL flag = [infoDic valueForKey:@"encapsulation_sdk_show_log"];
    return flag;
}


@end
