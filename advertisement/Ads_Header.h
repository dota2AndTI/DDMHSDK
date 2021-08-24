//
//  Ads_Header.h
//  AdsDemo
//
//  Created by  on 2021/8/18.
//

#ifndef Ads_Header_h
#define Ads_Header_h

#import <BUAdSDK/BUAdSDK.h>
#import <GoogleMobileAds/GoogleMobileAds.h>

#import "Ads_CommonTool.h"

#import <ABUAdSDK/ABUAdSDK.h> /// 当前版本 2.9.1
#import <ABUAdAdmobAdapter/ABUAdAdmobAdapter.h>
#import <ABUAdGdtAdapter/ABUAdGdtAdapter.h>
#import <ABUAdSDKAdapter/ABUAdSDKAdapter.h>
#import <GDTMobSDK/GDTSDKConfig.h>


#define SDKLog(format, ...) NSLog((@"encapsulation_sdk " format), ##__VA_ARGS__); 

#endif /* Ads_Header_h */
