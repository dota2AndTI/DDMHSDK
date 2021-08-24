//
//  Ads_BUInterstitialAdManager.m
//  AdsDemo
//
//  Created by  on 2021/8/19.
//

#import "Ads_BUInterstitialAdManager.h"

@interface Ads_BUInterstitialAdManager ()<BUNativeExpresInterstitialAdDelegate>

@property (nonatomic,strong)BUNativeExpressInterstitialAd *buInterstitialAd;
@property (nonatomic,assign)BOOL buInterstitialAdLoaded;// yes:加载成功 no: 加载失败
@property (nonatomic,assign)BOOL isInterstitialImmediately;
@end

@implementation Ads_BUInterstitialAdManager

-(void)ads_requestInterstitialAdWithSlotID:(NSString *)slotID adSize:(CGSize)size currentVC:(UIViewController *)vc immediatelyShow:(BOOL) isImmediately {
    self.currentVC = vc;
    self.isInterstitialImmediately = isImmediately;
    self.buInterstitialAd = [[BUNativeExpressInterstitialAd alloc] initWithSlotID:slotID adSize:size];
    self.buInterstitialAd.delegate = self;
    [self.buInterstitialAd loadAdData];
}

-(void)ads_showInterstitialAdWithSlotID:(NSString *)slotID {
    if (self.buInterstitialAdLoaded) {
        [self.buInterstitialAd showAdFromRootViewController:self.currentVC];
    }
}

#pragma mark - BUNativeExpresInterstitialAdDelegate
// 广告素材物料加载成功
-(void)nativeExpresInterstitialAdDidLoad:(BUNativeExpressInterstitialAd *)interstitialAd {
    NSLog(@"穿山甲 插屏广告加载成功");
}
// 渲染成功回调
-(void)nativeExpresInterstitialAdRenderSuccess:(BUNativeExpressInterstitialAd *)interstitialAd {
    NSLog(@"穿山甲 插屏广告渲染成功");
    if (_isInterstitialImmediately) {
        [self.buInterstitialAd showAdFromRootViewController:self.currentVC];
    }else {
        self.buInterstitialAdLoaded = YES;
    }
}

//返回的错误码(error)表示广告加载失败的原因，
-(void)nativeExpresInterstitialAd:(BUNativeExpressInterstitialAd *)interstitialAd didFailWithError:(NSError *)error {
    NSLog(@"穿山甲 插屏广告加载失败->%@",error);
}

- (void)nativeExpresInterstitialAdDidClose:(BUNativeExpressInterstitialAd *)interstitialAd {
    
}

@end
