//
//  Ads_GADManager.h
//  AdsDemo
//
//  Created by  on 2021/8/18.
//

#import "Ads_GADManager.h"

NS_ASSUME_NONNULL_BEGIN
@class Ads_GADManager;
@protocol Ads_GADManagerDelegate <NSObject>

@optional
//激励广告

//全屏视频广告

// 插屏广告

// banner

// 开屏广告
-(void)ads_gadSplashLoadSuccessWithManager:(Ads_GADManager *)manager;
-(void)ads_gadSplashLoadFailedWithManager:(Ads_GADManager *)manager;
-(void)ads_gadSplashLoadClosedWithManager:(Ads_GADManager *)manager;

@end

@interface Ads_GADManager : NSObject

@property (nonatomic,weak) id<Ads_GADManagerDelegate> delegate;
@property (nonatomic,strong)UIViewController *currentVC;

@end

NS_ASSUME_NONNULL_END
