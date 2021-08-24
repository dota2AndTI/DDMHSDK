//
//  Ads_GADSplashAdManager.h
//  AdsDemo
//
//  Created by  on 2021/8/19.
//

#import "Ads_GADManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface Ads_GADSplashAdManager : Ads_GADManager

-(void)ads_showSplashAdWithUnitID:(NSString *)unitID viewController:(UIViewController *)vc;

@end

NS_ASSUME_NONNULL_END
