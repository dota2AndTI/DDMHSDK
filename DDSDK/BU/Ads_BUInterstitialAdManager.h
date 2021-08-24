//
//  Ads_BUInterstitialAdManager.h
//  AdsDemo
//
//  Created by  on 2021/8/19.
//

#import "Ads_BUManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface Ads_BUInterstitialAdManager : Ads_BUManager

-(void)ads_requestInterstitialAdWithSlotID:(NSString *)slotID adSize:(CGSize)size currentVC:(UIViewController *)vc immediatelyShow:(BOOL) isImmediately;
-(void)ads_showInterstitialAdWithSlotID:(NSString *)slotID;

@end

NS_ASSUME_NONNULL_END
