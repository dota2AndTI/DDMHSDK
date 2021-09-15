//
//  Ads_BUBannerAdManager.h
//  AdsDemo
//
//  Created by  on 2021/8/19.
//

#import "Ads_BUManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface Ads_BUBannerAdManager : Ads_BUManager

-(void)ads_requestBannaerAdWitSlotID:(NSString *)slotID adFrame:(CGRect)frame interval:(NSInteger)interval currentVC:(UIViewController *)vc immediatelyShow:(BOOL)isImmediately;

-(void)ads_showBannerAdWithSlotID:(NSString *)slotID;
-(void)ads_closeBannerAdWithSlotID:(NSString *)slotID;

-(void)ads_bannerWillAppearAnimated:(BOOL)animated;
-(void)ads_bannerWillDisappearAnimated:(BOOL)animated;

@end

NS_ASSUME_NONNULL_END
