//
//  Ads_GADRewardManager.m
//  AdsDemo
//
//  Created by  on 2021/8/18.
//

#import "Ads_GADRewardManager.h"
#import "Ads_GADFullVideoManager.h"
#import "Ads_GADInterstitialManager.h"
@interface Ads_GADRewardManager ()<GADFullScreenContentDelegate>

@property(nonatomic, strong) GADRewardedAd *rewardedAd;
@property (nonatomic,assign)BOOL gadRewardedAdLoaded;// yes:加载成功 no: 加载失败
@property (nonatomic,assign)BOOL isVideoImmediately;

@property (nonatomic,assign)BOOL isGetReward;

@end

@implementation Ads_GADRewardManager

-(void)ads_gadRequestVideoWithUnitID:(NSString *)unitID currentVC:(UIViewController *)vc immediatelyShow:(BOOL) isImmediately {
    GADRequest *request = [GADRequest request];
    [GADRewardedAd loadWithAdUnitID:unitID request:request completionHandler:^(GADRewardedAd *ad, NSError *error) {
        if (error) {
            NSLog(@"Rewarded ad failed to load with error: %@", [error localizedDescription]);
            if (self.delegate && [self.delegate respondsToSelector:@selector(ads_gadLoadFailedWithManager:)]) {
                [self.delegate ads_gadLoadFailedWithManager:self];
            }
            return;
        }
        self.rewardedAd = ad;
        self.rewardedAd.fullScreenContentDelegate = self;
        if (isImmediately) {
            [ad presentFromRootViewController:vc userDidEarnRewardHandler:^{
                NSLog(@"激励视频 获取奖励");
                self.isGetReward = YES;
                if (self.delegate && [self.delegate respondsToSelector:@selector(ads_gadRewardPlayFinished:)]) {
                    [self.delegate ads_gadRewardPlayFinished:self];
                }
            }];
        }else {
            self.gadRewardedAdLoaded = YES;
        }
        NSLog(@"Rewarded ad loaded.");
    }];
}

-(void)showAdWithUnitID:(NSString *)unitID {
    if (self.rewardedAd && self.gadRewardedAdLoaded) {
        [self.rewardedAd presentFromRootViewController:self.currentVC userDidEarnRewardHandler:^{
            NSLog(@"激励视频 获取奖励");
            self.isGetReward = YES;
            if (self.delegate && [self.delegate respondsToSelector:@selector(ads_gadRewardPlayFinished:)]) {
                [self.delegate ads_gadRewardPlayFinished:self];
            }
        }];
    }
}

-(BOOL) ads_gadGetRewarded {
    return self.isGetReward;
}

#pragma mark - GADFullScreenContentDelegate
// 广告无法呈现全屏内容。
- (void)ad:(nonnull id<GADFullScreenPresentingAd>)ad
didFailToPresentFullScreenContentWithError:(nonnull NSError *)error {
    if (self.delegate && [self.delegate respondsToSelector:@selector(ads_gadRewardShowFailed:error:)]) {
        [self.delegate ads_gadRewardShowFailed:self error:error];
    }
}

// 广告呈现全屏内容。
- (void)adDidPresentFullScreenContent:(nonnull id<GADFullScreenPresentingAd>)ad {
    
}

// 广告取消了全屏内容。
- (void)adDidDismissFullScreenContent:(nonnull id<GADFullScreenPresentingAd>)ad {
    if (self.delegate && [self.delegate respondsToSelector:@selector(ads_gadClosedWithManager:)]) {
        [self.delegate ads_gadClosedWithManager:self];
    }
}

@end
