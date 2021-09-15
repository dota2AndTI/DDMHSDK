//
//  Ads_GADFullVideoManager.m
//  AdsDemo
//
//  Created by  on 2021/8/18.
//

#import "Ads_GADFullVideoManager.h"

@interface Ads_GADFullVideoManager ()<GADFullScreenContentDelegate>

@property(nonatomic, strong) GADRewardedInterstitialAd* rewardedInterstitialAd;
@property (nonatomic,assign)BOOL gadFullRewardedAdLoaded;// yes:加载成功 no: 加载失败
@property (nonatomic,assign)BOOL isFullVideoImmediately;
@property (nonatomic,assign)BOOL isGetReward;
@end

@implementation Ads_GADFullVideoManager

-(void)ads_gadRequestFullVideoWithUnitID:(NSString *)unitID currentVC:(UIViewController *)vc immediatelyShow:(BOOL)isImmediately {
    self.currentVC = vc;
    [GADRewardedInterstitialAd loadWithAdUnitID:unitID request:[GADRequest request] completionHandler:^(
                                                                                                        GADRewardedInterstitialAd* _Nullable rewardedInterstitialAd,
                                                                                                        NSError* _Nullable error) {
        if (!error) {
            self.rewardedInterstitialAd = rewardedInterstitialAd;
            self.gadFullRewardedAdLoaded = YES;
            rewardedInterstitialAd.fullScreenContentDelegate = self;
            dispatch_async(dispatch_get_main_queue(), ^{
                if (isImmediately) {
                    [rewardedInterstitialAd presentFromRootViewController:vc userDidEarnRewardHandler:^{
                        // 奖励内容
                        SDKLog(@"激励插屏 获取奖励");
                        self.isGetReward = YES;
                        if (self.delegate && [self.delegate respondsToSelector:@selector(ads_gadRewardPlayFinished:)]) {
                            [self.delegate ads_gadRewardPlayFinished:self];
                        }
                    }];
                }
            });
        }else {
            if (self.delegate && [self.delegate respondsToSelector:@selector(ads_gadLoadFailedWithManager:)]) {
                [self.delegate ads_gadLoadFailedWithManager:self];
            }
        }
    }];
}

-(void)ads_showFullVideoWithUnitID:(NSString *)unitID {
    if (self.rewardedInterstitialAd && self.gadFullRewardedAdLoaded) {
        [self.rewardedInterstitialAd presentFromRootViewController:self.currentVC userDidEarnRewardHandler:^{
            // 奖励内容
            SDKLog(@"激励插屏 获取奖励");
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

- (void)ad:(nonnull id<GADFullScreenPresentingAd>)ad
didFailToPresentFullScreenContentWithError:(nonnull NSError *)error {
    SDKLog(@"Ad did fail to present full screen content.");
    if (self.delegate && [self.delegate respondsToSelector:@selector(ads_gadFullVideoShowFailed:error:)]) {
        [self.delegate ads_gadFullVideoShowFailed:self error:error];
    }
}

- (void)adDidPresentFullScreenContent:(nonnull id<GADFullScreenPresentingAd>)ad {
    SDKLog(@"Ad did present full screen content.");
}

- (void)adWillDismissFullScreenContent:(nonnull id<GADFullScreenPresentingAd>)ad {
    SDKLog(@"Ad will dismiss full screen content.");
}

- (void)adDidDismissFullScreenContent:(nonnull id<GADFullScreenPresentingAd>)ad {
    SDKLog(@"Ad did dismiss full screen content.");
    if (self.delegate && [self.delegate respondsToSelector:@selector(ads_gadClosedWithManager:)]) {
        [self.delegate ads_gadClosedWithManager:self];
    }
}

@end
