//
//  Ads_GADRewardManager.h
//  AdsDemo
//
//  Created by  on 2021/8/18.
//

#import "Ads_GADManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface Ads_GADRewardManager : Ads_GADManager

-(void)ads_gadRequestVideoWithUnitID:(NSString *)unitID currentVC:(UIViewController *)vc immediatelyShow:(BOOL) isImmediately;

-(void)showAdWithUnitID:(NSString *)unitID;

@end

NS_ASSUME_NONNULL_END
