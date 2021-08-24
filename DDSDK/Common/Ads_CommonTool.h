//
//  Ads_CommonTool.h
//  AdsDemo
//
//  Created by  on 2021/8/18.
//

#import <Foundation/Foundation.h>
#import "ABUAdSDK/ABUAdSDK.h"
//#import <ABUAdSDK/ABUAdSDK.h> /// 当前版本 2.9.1
#import "BUAdSDK/BUAdSDK.h"

NS_ASSUME_NONNULL_BEGIN
typedef enum DDMHAdsOperatorType {
    DDMHAdsOperatorGoogle = 1 << 0, // 0  0
    DDMHAdsOperatorBU = 1 << 1, // 1  1
    DDMHAdsOperatorABU = 1 << 2 // 2  10 转换成 10进制  2
} DDMHAdsOperatorType;

#define SDKLog(format, ...) NSLog((@"encapsulation_sdk " format), ##__VA_ARGS__); 

@interface Ads_CommonTool : NSObject

+(instancetype)ads_defaultCommonTool;

+ (UIViewController*)ads_getCurrentViewController;

+ (BOOL) ads_showLog;

/*
 type 类型可写多个
 idDict 是字典 @{@"google":@"***",@"BU",@"***",@"ABU",@"***",nil}
 extraPlat 用于聚合添加 Google 广点通 百度 快手等平台的广告适配
 */
-(void) ads_initWithType:(DDMHAdsOperatorType)type andAppIds:(NSDictionary *)idDict andABUExtraPlant:(void(^)(void))extraPlat;

@end

NS_ASSUME_NONNULL_END
