//
//  Ads_ABUBannerAdManager.h
//  AdsDemo
//
//  Created by  on 2021/8/23.
//

#import "Ads_ABUManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface Ads_ABUBannerAdManager : Ads_ABUManager

-(void)ads_abuRequestBannaerAdWitSlotID:(NSString *)slotID adFrame:(CGRect)frame interval:(NSInteger)interval currentVC:(UIViewController *)vc immediatelyShow:(BOOL)isImmediately;

-(void)ads_abuShowBannerAdWithSlotID:(NSString *)slotID;

-(void)ads_abuCloseBannerAdWithSlotID:(NSString *)slotID;

-(void)ads_bannerWillAppearAnimated:(BOOL)animated;
-(void)ads_bannerWillDisappearAnimated:(BOOL)animated;

@end

NS_ASSUME_NONNULL_END
