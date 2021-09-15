//
//  Ads_ABUFullRewardAdManager.m
//  AdsDemo
//
//  Created by  on 2021/8/23.
//

#import "Ads_ABUFullRewardAdManager.h"

@interface Ads_ABUFullRewardAdManager ()<ABUFullscreenVideoAdDelegate>

@property (nonatomic,strong)ABUFullscreenVideoAd *fullVideoAd;
@property (nonatomic,assign)BOOL playFinish;
@end

@implementation Ads_ABUFullRewardAdManager

-(void)ads_abuRequestFullVideoAdWith:(NSString *)adId viewController:(UIViewController *)vc immediatelyShow:(BOOL)isImmediately {
    self.vc = vc;
    self.isImmediately = isImmediately;
    
    self.fullVideoAd = [[ABUFullscreenVideoAd alloc] initWithAdUnitID:adId];
    self.fullVideoAd.delegate = self;
    [self.fullVideoAd loadAdData];
    
}

-(void)ads_abuShowFullVideoAdWith:(NSString *)adId {
    if (self.fullVideoAd && self.adLoadSuccess) {
        BOOL flag = [self.fullVideoAd showAdFromRootViewController:self.vc];
        if (!flag) {
            SDKLog(@"聚合 全屏视频广告未能展示出来");
        }
    }
}

-(BOOL)ads_getRewardStatus {
    return self.playFinish;
}

#pragma mark - ABUFullscreenVideoAdDelegate
-(void)fullscreenVideoAdDidLoad:(ABUFullscreenVideoAd *)fullscreenVideoAd {
    if (self.delegate && [self.delegate respondsToSelector:@selector(ads_abuLoadSuccess:)]) {
        [self.delegate ads_abuLoadSuccess:self];
    }
    if (self.isImmediately) {
        BOOL flag = [self.fullVideoAd showAdFromRootViewController:self.vc];
        if (!flag) {
            SDKLog(@"聚合 全屏视频广告未能展示出来");
        }
    }else {
        self.adLoadSuccess = YES;
    }
}

-(void)fullscreenVideoAdDidSkip:(ABUFullscreenVideoAd *)fullscreenVideoAd {
    if (self.delegate && [self.delegate respondsToSelector:@selector(ads_abuFullVideoDidSkip:)]) {
        [self.delegate ads_abuFullVideoDidSkip:self];
    }
}

-(void)fullscreenVideoAdDidClick:(ABUFullscreenVideoAd *)fullscreenVideoAd {
    if (self.delegate && [self.delegate respondsToSelector:@selector(ads_abuDidClick:)]) {
        [self.delegate ads_abuDidClick:self];
    }
}

-(void)fullscreenVideoAdDidClose:(ABUFullscreenVideoAd *)fullscreenVideoAd {
    if (self.delegate && [self.delegate respondsToSelector:@selector(ads_abuDidClosed:)]) {
        [self.delegate ads_abuDidClosed:self];
    }
}

-(void)fullscreenVideoAdDidVisible:(ABUFullscreenVideoAd *)fullscreenVideoAd {
    
}

-(void)fullscreenVideoAd:(ABUFullscreenVideoAd *)fullscreenVideoAd didFailWithError:(NSError *)error {
    if (self.delegate && [self.delegate respondsToSelector:@selector(ads_abuLoadFailed:error:)]) {
        [self.delegate ads_abuLoadFailed:self error:error];
    }
}

-(void)fullscreenVideoAdDidShowFailed:(ABUFullscreenVideoAd *)fullscreenVideoAd error:(NSError *)error {
    if (self.delegate && [self.delegate respondsToSelector:@selector(ads_abuFullVideoShowFailed:error:)]) {
        [self.delegate ads_abuFullVideoShowFailed:self error:error];
    }
}
//成功缓存时将调用此方法。
-(void)fullscreenVideoAdDidDownLoadVideo:(ABUFullscreenVideoAd *)fullscreenVideoAd {
    
}

- (void)fullscreenVideoAdDidPlayFinish:(ABUFullscreenVideoAd * _Nonnull)fullscreenVideoAd didFailWithError:(NSError *_Nullable)error {
    if (!error) {
        self.playFinish = YES;
    }
    if (self.delegate && [self.delegate respondsToSelector:@selector(ads_abuRewardPlayFinished:error:)]) {
        [self.delegate ads_abuRewardPlayFinished:self error:error];
    }
}

@end
