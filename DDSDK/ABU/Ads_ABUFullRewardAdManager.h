//
//  Ads_ABUFullRewardAdManager.h
//  AdsDemo
//
//  Created by  on 2021/8/23.
//

#import "Ads_ABUManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface Ads_ABUFullRewardAdManager : Ads_ABUManager

-(void)ads_abuRequestFullVideoAdWith:(NSString *)adId viewController:(UIViewController *)vc immediatelyShow:(BOOL) isImmediately;

-(void)ads_abuShowFullVideoAdWith:(NSString *)adId;

-(BOOL)ads_getRewardStatus;

@end

NS_ASSUME_NONNULL_END
