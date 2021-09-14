//
//  Ads_ABURewardAdManager.h
//  AdsDemo
//
//  Created by  on 2021/8/23.
//

#import "Ads_ABUManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface Ads_ABURewardAdManager : Ads_ABUManager

-(void)ads_abuRequestRewardAdWith:(NSString *)adId viewController:(UIViewController *)vc immediatelyShow:(BOOL) isImmediately;

-(void)ads_abuShowRewardAdWith:(NSString *)adId;

-(BOOL)ads_getRewardStatus;

@end

NS_ASSUME_NONNULL_END
