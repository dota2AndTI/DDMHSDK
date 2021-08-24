//
//  Ads_BUSplashAd.h
//  AdsDemo
//
//  Created by  on 2021/8/19.
//

#import "Ads_BUManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface Ads_BUSplashAdManager : Ads_BUManager

-(void)ads_buShowVideoWithSlotID:(NSString *)slotID frame:(CGRect)frame hideSkipBtn:(BOOL)isHide tolerateTimeout:(NSTimeInterval)tolerate currentVC:(UIViewController *)vc;

@end

NS_ASSUME_NONNULL_END
