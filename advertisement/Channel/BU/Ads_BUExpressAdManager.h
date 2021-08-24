//
//  Ads_BUExpressAdManager.h
//  AdsDemo
//
//  Created by  on 2021/8/19.
//

#import "Ads_BUManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface Ads_BUExpressAdManager : Ads_BUManager

-(void)ads_requestExpressAdWithSlotID:(NSString *)slotID adSize:(CGSize)size count:(NSInteger)count currentVC:(UIViewController *)vc immediatelyShow:(BOOL)isImmediately;

-(void)ads_showExpressAdWithSlotID:(NSString *)slotID;

-(NSMutableArray *)ads_getExpressAdWithSlotID:(NSString *)slotID;

@end

NS_ASSUME_NONNULL_END
