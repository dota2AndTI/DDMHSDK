//
//  Ads_GADInterstitialManager.h
//  AdsDemo
//
//  Created by  on 2021/8/18.
//

#import "Ads_GADManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface Ads_GADInterstitialManager : Ads_GADManager

-(void)ads_gadRequestInterstitialAdWithUnitID:(NSString *)unitID currentVC:(UIViewController *)vc immediatelyShow:(BOOL) isImmediately;

-(void)ads_showInterstitialAdWithUnitID:(NSString *)unitId;

@end

NS_ASSUME_NONNULL_END
