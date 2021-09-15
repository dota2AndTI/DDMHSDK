//
//  Ads_BUVideoAdManager.h
//  AdsDemo
//
//  Created by  on 2021/8/19.
//

#import "Ads_BUManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface Ads_BUVideoAdManager : Ads_BUManager

-(void)ads_buRequestVideoWithSlotID:(NSString *)slotID userId:(NSString *)userId currentVC:(UIViewController *)vc immediatelyShow:(BOOL) isVideoImmediately;

-(void)ads_showVideoWithSlotID:(NSString *)slotID userId:(NSString *)userId;

-(BOOL)ads_isGetRewarded;

@end

NS_ASSUME_NONNULL_END
