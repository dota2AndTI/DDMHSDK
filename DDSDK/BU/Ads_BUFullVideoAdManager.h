//
//  Ads_BUFullVideoAdManager.h
//  AdsDemo
//
//  Created by  on 2021/8/19.
//

#import "Ads_BUManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface Ads_BUFullVideoAdManager : Ads_BUManager

-(void)ads_requestFullAdsWithSlotID:(NSString *)slotID currentVC:(UIViewController *)vc immediatelyShow:(BOOL) isImmediately;
-(void)ads_showFullAdsWithSlotID:(NSString *)slotID;
-(BOOL)ads_isGetRewarded;
@end

NS_ASSUME_NONNULL_END
