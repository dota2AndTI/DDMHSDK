//
//  Ads_ABUSplashAsManager.h
//  AdsDemo
//
//  Created by  on 2021/8/23.
//

#import "Ads_ABUManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface Ads_ABUSplashAsManager : Ads_ABUManager

-(void)ads_abuRequestSplashAdWithAppId:(NSString *)appId splashId:(NSString *)splashId viewController:(UIViewController *)vc;

@end

NS_ASSUME_NONNULL_END
