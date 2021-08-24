//
//  Ads_GADBannerManager.h
//  AdsDemo
//
//  Created by  on 2021/8/18.
//

#import "Ads_GADManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface Ads_GADBannerManager : Ads_GADManager

-(void)ads_gadRequestBannerAdWithUnitID:(NSString *)unitID bannerOriginal:(CGPoint)point bannerSize:(GADAdSize)size currentVC:(UIViewController *)vc immediatelyShow:(BOOL) isImmediately;

-(void)ads_gadRequestBannerAdWithUnitID:(NSString *)unitID bannerFrame:(CGRect)frame currentVC:(UIViewController *)vc immediatelyShow:(BOOL) isImmediately;

-(void)ads_showBannerAdWithUnitID:(NSString *)unitID;

-(void)ads_closeBannerAdWithUnitID:(NSString *)unitID;

@end

NS_ASSUME_NONNULL_END
