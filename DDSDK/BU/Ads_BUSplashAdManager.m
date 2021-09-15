//
//  Ads_BUSplashAd.m
//  AdsDemo
//
//  Created by  on 2021/8/19.
//

#import "Ads_BUSplashAdManager.h"

@interface Ads_BUSplashAdManager ()<BUSplashAdDelegate>

@property (nonatomic,strong)BUSplashAdView *buSplashAdView;
@property (nonatomic,assign)BOOL buSplashAdLoaded;// yes:加载成功 no: 加载失败
@property (nonatomic,assign)BOOL isSplashImmediately;

@property (nonatomic, assign) CFTimeInterval buSplashstartTime;

@end

@implementation Ads_BUSplashAdManager

-(void)ads_buShowVideoWithSlotID:(NSString *)slotID frame:(CGRect)frame hideSkipBtn:(BOOL)isHide tolerateTimeout:(NSTimeInterval)tolerate currentVC:(UIViewController *)vc {
    
    self.buSplashAdView = [[BUSplashAdView alloc] initWithSlotID:slotID frame:frame];
    // tolerateTimeout = CGFLOAT_MAX , The conversion time to milliseconds will be equal to 0
    self.buSplashAdView.hideSkipButton = isHide;
    self.buSplashAdView.tolerateTimeout = tolerate;
    self.buSplashAdView.delegate = self;
    //optional
//    self.buSplashAdView.needSplashZoomOutAd = YES;
    self.buSplashstartTime = CACurrentMediaTime();
    [self.buSplashAdView loadAdData];
    [vc.view addSubview:self.buSplashAdView];
}

#pragma mark - BUSplashAdDelegate
-(void)splashAdDidLoad:(BUSplashAdView *)splashAd {
    NSLog(@"穿山甲 开屏广告请求成功");
    if (self.delegate && [self.delegate respondsToSelector:@selector(ads_buLoadSuccessWithManager:)]) {
        [self.delegate ads_buLoadSuccessWithManager:self];
    }
}
//请求失败的回调
-(void)splashAd:(BUSplashAdView *)splashAd didFailWithError:(NSError *)error {
    NSLog(@"穿山甲 开屏广告请求失败->%@",error);
    if (self.delegate && [self.delegate respondsToSelector:@selector(ads_buLoadFailedWithManager:error:)]) {
        [self.delegate ads_buLoadFailedWithManager:self error:error];
    }
}

-(void)splashAdDidClick:(BUSplashAdView *)splashAd {
    
}
// 用户点击跳过按钮时会触发此回调，可在此回调方法中处理用户点击跳转后的相关逻辑
-(void)splashAdDidClickSkip:(BUSplashAdView *)splashAd {
    if (self.delegate && [self.delegate respondsToSelector:@selector(ads_buClosedWithManager:)]) {
        [self.delegate ads_buClosedWithManager:self];
    }
}
//SDK渲染开屏广告关闭回调，当用户点击广告时会直接触发此回调，建议在此回调方法中直接进行广告对象的移除操作
-(void)splashAdDidClose:(BUSplashAdView *)splashAd {
    if (self.delegate && [self.delegate respondsToSelector:@selector(ads_buClosedWithManager:)]) {
        [self.delegate ads_buClosedWithManager:self];
    }
}
// 倒计时为0时会触发此回调，如果客户端使用了此回调方法，建议在此回调方法中进行广告的移除操作
-(void)splashAdCountdownToZero:(BUSplashAdView *)splashAd {
    
}

@end
