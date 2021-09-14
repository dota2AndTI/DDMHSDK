//
//  Ads_ABURewardAdManager.m
//  AdsDemo
//
//  Created by  on 2021/8/23.
//

#import "Ads_ABURewardAdManager.h"

@interface Ads_ABURewardAdManager ()<ABURewardedVideoAdDelegate>


@property (nonatomic,strong)ABURewardedVideoAd *rewardAd;

@property (nonatomic,assign)BOOL isGetReward;
@end

@implementation Ads_ABURewardAdManager

-(void)ads_abuRequestRewardAdWith:(NSString *)adId viewController:(UIViewController *)vc immediatelyShow:(BOOL)isImmediately {
    self.vc = vc;
    self.isImmediately = isImmediately;
    
    ABURewardedVideoModel *model = [[ABURewardedVideoModel alloc]init];
    model.userId = @"123";
    model.rewardAmount = 50;
    model.extra = @"khalsihucisacsa";
    
    self.rewardAd = [[ABURewardedVideoAd alloc]initWithAdUnitID:adId rewardedVideoModel:model];
    self.rewardAd.delegate = self;
    self.rewardAd.mutedIfCan = YES;// NO-静音，YES-有声音
    
    // TODO: 已经获得奖励 === NO
    self.isGetReward = NO;
    
    // 当前配置拉取成功
    if (self.rewardAd.hasAdConfig) {
        [self.rewardAd loadAdData]; // 加载广告
    }else{
        __weak typeof(self) weakSelf = self;
        // 当前配置未拉取成功,在成功之后会调用该callback
        [self.rewardAd setConfigSuccessCallback:^{
            [weakSelf.rewardAd loadAdData];
        }];
    }
}

-(void)ads_abuShowRewardAdWith:(NSString *)adId {
    if (self.adLoadSuccess && self.rewardAd) {
        BOOL isSuccessShow = [self.rewardAd showAdFromRootViewController:self.vc];
        if (isSuccessShow == NO) {// 展示失败
            // delegate
            
        }
    }
}

-(BOOL)ads_getRewardStatus {
    return self.isGetReward;
}


#pragma mark - ABURewardedVideoAdDelegate
- (void)rewardedVideoAdDidLoad:(ABURewardedVideoAd *_Nonnull)rewardedVideoAd {
    NSLog(@"log-%s",__func__);
    if (self.delegate && [self.delegate respondsToSelector:@selector(ads_abuLoadSuccess:)]) {
        [self.delegate ads_abuLoadSuccess:self];
    }
}

/**
 This method is called when video ad materia failed to load.
 @param error : the reason of error
 */
- (void)rewardedVideoAd:(ABURewardedVideoAd *_Nonnull)rewardedVideoAd didFailWithError:(NSError *_Nullable)error {
    NSLog(@"log-%s-error:%@s",__func__,error.description);
    if (self.delegate && [self.delegate respondsToSelector:@selector(ads_abuLoadFailed:error:)]) {
        [self.delegate ads_abuLoadFailed:self error:error];
    }
}

/**
 This method is called when a ABURewardedVideoAd failed to render.
 @param error : the reason of error
 Only for expressAd,hasExpressAdGot = yes
 */
- (void)rewardedVideoAdViewRenderFail:(ABURewardedVideoAd *_Nonnull)rewardedVideoAd error:(NSError *_Nullable)error {
    NSLog(@"log-%s-error:%@",__func__,error.description);
    if (self.delegate && [self.delegate respondsToSelector:@selector(ads_abuRenderFailed:error:)]) {
        [self.delegate ads_abuRenderFailed:self error:error];
    }
}

/**
 This method is called when cached successfully.
 */
- (void)rewardedVideoAdDidDownLoadVideo:(ABURewardedVideoAd *_Nonnull)rewardedVideoAd {
    //self.selectedView.showInvalid = YES;
    //self.selectedView.promptStatus = ABUDPromptStatusAdVideoLoadedSuccess;
    NSLog(@"log-%s",__func__);
    if (self.rewardAd) {
        if (self.isImmediately) {
            BOOL isSuccessShow = [self.rewardAd showAdFromRootViewController:self.vc];
            if (isSuccessShow == NO) {
                // delegate
                if (self.delegate && [self.delegate respondsToSelector:@selector(ads_abuRewardShowFailed:)]) {
                    [self.delegate ads_abuRewardShowFailed:self ];
                }
            }
        }else {
            self.adLoadSuccess = YES;
        }
    }else{
        // delegate
        if (self.delegate && [self.delegate respondsToSelector:@selector(ads_abuRewardShowFailed:)]) {
            [self.delegate ads_abuRewardShowFailed:self];
        }
    }
}

/**
 This method is called when video ad slot has been shown.
 */
- (void)rewardedVideoAdDidVisible:(ABURewardedVideoAd *_Nonnull)rewardedVideoAd {
    NSLog(@"%s", __func__);
    if (self.delegate && [self.delegate respondsToSelector:@selector(ads_abuRewardedDidVisible:)]) {
        [self.delegate ads_abuRewardedDidVisible:self];
    }
}

/**
 This method is called when video ad is closed.
 */
- (void)rewardedVideoAdDidClose:(ABURewardedVideoAd *_Nonnull)rewardedVideoAd {
    NSLog(@"%s", __func__);
    if (self.delegate && [self.delegate respondsToSelector:@selector(ads_abuDidClosed:)]) {
        [self.delegate ads_abuDidClosed:self];
    }
}

/**
 This method is called when video ad is clicked.
 */
- (void)rewardedVideoAdDidClick:(ABURewardedVideoAd *_Nonnull)rewardedVideoAd {
    NSLog(@"%s", __func__);
}

- (void)rewardedVideoAdDidSkip:(ABURewardedVideoAd *)rewardedVideoAd {
    NSLog(@"log-%s", __func__);
    // 因为激励视频时间过长，所以点击跳过也可以算
    self.isGetReward = YES;
    if (self.delegate && [self.delegate respondsToSelector:@selector(ads_abuRewardDidSkip:)]) {
        [self.delegate ads_abuRewardDidSkip:self];
    }
}


/**
 This method is called when video ad play completed or an error occurred.
 @param error : the reason of error
 */
- (void)rewardedVideoAdDidPlayFinish:(ABURewardedVideoAd * _Nonnull)rewardedVideoAd didFailWithError:(NSError *_Nullable)error {
    NSLog(@"log-%s error:%@", __func__, error);
    
    self.isGetReward = YES;
    if (self.delegate && [self.delegate respondsToSelector:@selector(ads_abuRewardPlayFinished:error:)]) {
        [self.delegate ads_abuRewardPlayFinished:self error:error];
    }
    
}

- (void)rewardedVideoAdServerRewardDidSucceed:(ABURewardedVideoAd *)rewardedVideoAd rewardInfo:(ABUAdapterRewardAdInfo *)rewardInfo verify:(BOOL)verify {
    NSLog(@"log-");
}

@end
