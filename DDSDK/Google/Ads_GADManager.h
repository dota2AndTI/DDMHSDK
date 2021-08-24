//
//  Ads_GADManager.h
//  AdsDemo
//
//  Created by  on 2021/8/18.
//

#import "Ads_GADManager.h"
#import "Ads_CommonTool.h"
#import "GoogleMobileAds/GoogleMobileAds.h"

NS_ASSUME_NONNULL_BEGIN
@class Ads_GADManager;
@protocol Ads_GADManagerDelegate <NSObject>

@optional
//激励广告
-(void)ads_gadRewardDidSkipWithManager:(Ads_GADManager *)manager;
-(void)ads_gadRewardPlayFinished:(Ads_GADManager*)manager;
-(void)ads_gadRewardShowFailed:(Ads_GADManager*)manager;
//全屏视频广告
-(void)ads_gadFullVideoDidSkip:(Ads_GADManager*)manager;
-(void)ads_gadFullVideoShowFailed:(Ads_GADManager*)manager error:(NSError *)error;
-(void)ads_gadFullVideoPlayFinished:(Ads_GADManager*)manager error:(NSError *)error;
// 插屏广告
-(void)ads_gadInterstitialShowFailed:(Ads_GADManager*)manager error:(NSError *)error;
// banner

// 开屏广告
-(void)ads_gadLoadSuccessWithManager:(Ads_GADManager *)manager;
-(void)ads_gadLoadFailedWithManager:(Ads_GADManager *)manager;
-(void)ads_gadLoadClosedWithManager:(Ads_GADManager *)manager;

@end

@interface Ads_GADManager : NSObject

@property (nonatomic,weak) id<Ads_GADManagerDelegate> delegate;
@property (nonatomic,strong)UIViewController *currentVC;

@end

NS_ASSUME_NONNULL_END
