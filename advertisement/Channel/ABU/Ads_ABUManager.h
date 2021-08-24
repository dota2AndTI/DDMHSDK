//
//  Ads_ABUManager.h
//  AdsDemo
//
//  Created by  on 2021/8/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@class Ads_ABUManager;
@protocol Ads_ABUManagerDelegate <NSObject>
@optional
// reward
-(void)ads_abuRewardDidSkip:(Ads_ABUManager*)manager;
-(void)ads_abuRewardPlayFinished:(Ads_ABUManager*)manager error:(NSError *)error;
-(void)ads_abuRewardShowFailed:(Ads_ABUManager*)manager;
// fullReward
-(void)ads_abuFullVideoDidSkip:(Ads_ABUManager*)manager;
-(void)ads_abuFullVideoShowFailed:(Ads_ABUManager*)manager error:(NSError *)error;
-(void)ads_abuFullVideoPlayFinished:(Ads_ABUManager*)manager error:(NSError *)error;
// interstitial
-(void)ads_abuInterstitialShowFailed:(Ads_ABUManager*)manager error:(NSError *)error;
// banner

// splash

//common
-(void)ads_abuLoadFailed:(Ads_ABUManager*)manager error:(NSError *)error;
-(void)ads_abuLoadSuccess:(Ads_ABUManager*)manager;
-(void)ads_abuRenderFailed:(Ads_ABUManager*)manager error:(NSError *)error;
-(void)ads_abuRenderSuccess:(Ads_ABUManager*)manager;
-(void)ads_abuDidClick:(Ads_ABUManager*)manager;
-(void)ads_abuDidClosed:(Ads_ABUManager*)manager;
@end


@interface Ads_ABUManager : NSObject

@property (nonatomic,strong)UIViewController *vc;
@property (nonatomic,assign)BOOL isImmediately;
@property (nonatomic,assign)BOOL adLoadSuccess;//广告加载成功

@property (nonatomic,weak) id<Ads_ABUManagerDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
