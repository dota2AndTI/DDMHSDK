//
//  Ads_BUFullVideoAdManager.m
//  AdsDemo
//
//  Created by  on 2021/8/19.
//

#import "Ads_BUFullVideoAdManager.h"

@interface Ads_BUFullVideoAdManager ()<BUNativeExpressFullscreenVideoAdDelegate>

@property (nonatomic,strong)BUNativeExpressFullscreenVideoAd *fullscreenAd;
@property (nonatomic,assign)BOOL buFullAdLoaded;// yes:加载成功 no: 加载失败
@property (nonatomic,assign)BOOL isFullImmediately;
@property (nonatomic,assign)BOOL playFinish;
@end

@implementation Ads_BUFullVideoAdManager

-(void)ads_requestFullAdsWithSlotID:(NSString *)slotID currentVC:(UIViewController *)vc immediatelyShow:(BOOL) isImmediately {
    self.currentVC = vc;
    self.isFullImmediately = isImmediately;
    self.fullscreenAd = [[BUNativeExpressFullscreenVideoAd alloc] initWithSlotID:slotID];
    self.fullscreenAd.delegate = self;
    [self.fullscreenAd loadAdData];
}

-(void)ads_showFullAdsWithSlotID:(NSString *)slotID {
    if (self.buFullAdLoaded) {
        [self.fullscreenAd showAdFromRootViewController:self.currentVC];
    }
}

-(BOOL)ads_isGetRewarded {
    return self.playFinish;
}

#pragma mark - BUNativeExpressFullscreenVideoAdDelegate
//广告素材物料加载成功
-(void)nativeExpressFullscreenVideoAdDidLoad:(BUNativeExpressFullscreenVideoAd *)fullscreenVideoAd {
    
}
// 返回的错误码(error)表示广告加载失败的原因，
- (void)nativeExpressFullscreenVideoAd:(BUNativeExpressFullscreenVideoAd *)fullscreenVideoAd didFailWithError:(NSError *_Nullable)error {
    if (self.delegate && [self.delegate respondsToSelector:@selector(ads_buLoadFailedWithManager:error:)]) {
        [self.delegate ads_buLoadFailedWithManager:self error:error];
    }
}

//视频下载完成   在此回调方法中进行广告的展示，可保证播放流畅和展示流畅，用户体验更好。
-(void)nativeExpressFullscreenVideoAdDidDownLoadVideo:(BUNativeExpressFullscreenVideoAd *)fullscreenVideoAd {
    if (self.delegate && [self.delegate respondsToSelector:@selector(ads_buLoadSuccessWithManager:)]) {
        [self.delegate ads_buLoadSuccessWithManager:self];
    }
    if ([self.fullscreenAd isEqual:fullscreenVideoAd]) {
        if (self.isFullImmediately) {
            [fullscreenVideoAd showAdFromRootViewController:self.currentVC];
        }else {
            self.buFullAdLoaded = YES;
        }
    }
}

// 渲染失败，网络原因或者硬件原因导致渲染失败,可以更换手机或者网络环境测试。建议升级到穿山甲最新版本SDK
-(void)nativeExpressFullscreenVideoAdViewRenderFail:(BUNativeExpressFullscreenVideoAd *)rewardedVideoAd error:(NSError *)error {
    if (self.delegate && [self.delegate respondsToSelector:@selector(ads_buManager:videoRenderFailed:)]) {
        [self.delegate ads_buManager:self videoRenderFailed:error];
    }
}
// 此回调可知模版全屏视频的广告类型
-(void)nativeExpressFullscreenVideoAdCallback:(BUNativeExpressFullscreenVideoAd *)fullscreenVideoAd withType:(BUNativeExpressFullScreenAdType)nativeExpressVideoAdType {
    
}
// 点击回调
-(void)nativeExpressFullscreenVideoAdDidClick:(BUNativeExpressFullscreenVideoAd *)fullscreenVideoAd {
    
}
// 点击5s跳过会触发此回调，如果需要在用户点击跳过时做相关的逻辑处理，可在此回调中进行相关逻辑处理
-(void)nativeExpressFullscreenVideoAdDidClickSkip:(BUNativeExpressFullscreenVideoAd *)fullscreenVideoAd {
    if (self.delegate && [self.delegate respondsToSelector:@selector(ads_buManager:videoSkipWith:)]) {
        [self.delegate ads_buManager:self videoSkipWith:@""];
    }
}
// 点击关闭按钮会触发此回调
-(void)nativeExpressFullscreenVideoAdDidClose:(BUNativeExpressFullscreenVideoAd *)fullscreenVideoAd {
    if (self.delegate && [self.delegate respondsToSelector:@selector(ads_buClosedWithManager:)]) {
        [self.delegate ads_buClosedWithManager:self];
    }
}
// 广告播放完成会触发此回调
-(void)nativeExpressFullscreenVideoAdDidPlayFinish:(BUNativeExpressFullscreenVideoAd *)fullscreenVideoAd didFailWithError:(NSError *)error {
    if (!error) {
        self.playFinish = YES;
    }
}

@end
