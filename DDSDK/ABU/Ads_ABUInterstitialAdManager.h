//
//  Ads_ABUInterstitialAdManager.h
//  AdsDemo
//
//  Created by  on 2021/8/23.
//

#import "Ads_ABUManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface Ads_ABUInterstitialAdManager : Ads_ABUManager

-(void)ads_abuRequestInterstitialAdWith:(NSString *)adId expectSize:(CGSize)size viewController:(UIViewController *)vc immediatelyShow:(BOOL) isImmediately;

-(void)ads_abuShowInterstitialAdWith:(NSString *)adId;

@end

NS_ASSUME_NONNULL_END
