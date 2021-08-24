//
//  Ads_GADFullVideoManager.h
//  AdsDemo
//
//  Created by  on 2021/8/18.
//

#import "Ads_GADManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface Ads_GADFullVideoManager : Ads_GADManager

-(void)ads_gadRequestFullVideoWithUnitID:(NSString *)unitID currentVC:(UIViewController *)vc immediatelyShow:(BOOL) isImmediately;

-(void)ads_showFullVideoWithUnitID:(NSString *)unitID;

@end

NS_ASSUME_NONNULL_END
