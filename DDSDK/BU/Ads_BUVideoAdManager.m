//
//  Ads_BUVideoAdManager.m
//  AdsDemo
//
//  Created by  on 2021/8/19.
//

#import "Ads_BUVideoAdManager.h"

@interface Ads_BUVideoAdManager ()<BUNativeExpressRewardedVideoAdDelegate>

@property (nonatomic,strong)BUNativeExpressRewardedVideoAd *buRewardedAd;
@property (nonatomic,assign)BOOL buRewardedAdLoaded;// yes:加载成功 no: 加载失败
@property (nonatomic,assign)BOOL isVideoImmediately;

@property (nonatomic,assign)BOOL playFinish;

@end

@implementation Ads_BUVideoAdManager

-(void)ads_buRequestVideoWithSlotID:(NSString *)slotID userId:(NSString *)userId currentVC:(UIViewController *)vc immediatelyShow:(BOOL) isVideoImmediately {
    self.currentVC = vc;
    self.isVideoImmediately = NO;
    self.isVideoImmediately = isVideoImmediately;
    
    BURewardedVideoModel *model = [[BURewardedVideoModel alloc] init];
    model.userId = userId;
    
    self.buRewardedAd = [[BUNativeExpressRewardedVideoAd alloc] initWithSlotID:slotID rewardedVideoModel:model];
    self.buRewardedAd.delegate = self;
    [self.buRewardedAd loadAdData];
}

-(void)ads_showVideoWithSlotID:(NSString *)slotID userId:(NSString *)userId {
    if (self.buRewardedAdLoaded) {
        [self.buRewardedAd showAdFromRootViewController:self.currentVC];
    }
}

#pragma mark - BUNativeExpressRewardedVideoAdDelegate
// 广告素材物料加载成功
-(void)nativeExpressRewardedVideoAdDidLoad:(BUNativeExpressRewardedVideoAd *)rewardedVideoAd {
    if ([rewardedVideoAd isEqual:self.buRewardedAd]) {
        if (self.isVideoImmediately) {
            [rewardedVideoAd showAdFromRootViewController:self.currentVC];
        }else {
            self.buRewardedAdLoaded = YES;
        }
    }
}
//渲染失败，网络原因或者硬件原因导致渲染失败,可以更换手机或者网络环境测试。建议升级到穿山甲平台最新版本
-(void)nativeExpressRewardedVideoAdViewRenderFail:(BUNativeExpressRewardedVideoAd *)rewardedVideoAd error:(NSError *)error {
    if (self.delegate && [self.delegate respondsToSelector:@selector(ads_buManager:videoRenderFailed:)]) {
        [self.delegate ads_buManager:self videoRenderFailed:error];
    }
}
// 渲染成功回调。3100之后版本SDK，广告展示之后才会回调
-(void)nativeExpressRewardedVideoAdViewRenderSuccess:(BUNativeExpressRewardedVideoAd *)rewardedVideoAd {
    if (self.delegate && [self.delegate respondsToSelector:@selector(ads_buVideoRenderSuccessManager:)]) {
        [self.delegate ads_buVideoRenderSuccessManager:self];
    }
}
// 返回的错误码(error)表示广告加载失败的原因，
-(void)nativeExpressRewardedVideoAd:(BUNativeExpressRewardedVideoAd *)rewardedVideoAd didFailWithError:(NSError *)error {
    if (self.delegate && [self.delegate respondsToSelector:@selector(ads_buManager:videoLoadFailed:)]) {
        [self.delegate ads_buManager:self videoLoadFailed:error];
    }
}
//用户关闭广告时会触发此回调，注意：任何广告的关闭操作必须用户主动触发;
-(void)nativeExpressRewardedVideoAdDidClose:(BUNativeExpressRewardedVideoAd *)rewardedVideoAd {
    if (self.playFinish) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(ads_buManager:videoPlayFinishCloseWith:)]) {
            [self.delegate ads_buManager:self videoPlayFinishCloseWith:@""];
        }
    }else {
        if (self.delegate && [self.delegate respondsToSelector:@selector(ads_buManager:videoSkipWith:)]) {
            [self.delegate ads_buManager:self videoSkipWith:@""];
        }
    }
}
// 点击回调方法
-(void)nativeExpressRewardedVideoAdDidClick:(BUNativeExpressRewardedVideoAd *)rewardedVideoAd {
    
}
// 跳过回调方法
-(void)nativeExpressRewardedVideoAdDidClickSkip:(BUNativeExpressRewardedVideoAd *)rewardedVideoAd {
    if (self.delegate && [self.delegate respondsToSelector:@selector(ads_buManager:videoSkipWith:)]) {
        [self.delegate ads_buManager:self videoSkipWith:@""];
    }
}
//当视频广告播放完成或出现错误时调用此方法。
-(void)nativeExpressRewardedVideoAdDidPlayFinish:(BUNativeExpressRewardedVideoAd *)rewardedVideoAd didFailWithError:(NSError *)error {
    if (!error) {
        self.playFinish = YES;
    }
}

@end
