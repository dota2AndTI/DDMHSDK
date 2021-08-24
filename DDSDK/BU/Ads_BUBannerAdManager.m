//
//  Ads_BUBannerAdManager.m
//  AdsDemo
//
//  Created by  on 2021/8/19.
//

#import "Ads_BUBannerAdManager.h"

@interface Ads_BUBannerAdManager ()<BUNativeExpressBannerViewDelegate>

@property (nonatomic,strong)BUNativeExpressBannerView *buBannerView;
@property (nonatomic,assign)BOOL buBannerAdLoaded;// yes:加载成功 no: 加载失败
@property (nonatomic,assign)BOOL isBannerImmediately;

@end

@implementation Ads_BUBannerAdManager

-(void)ads_requestBannaerAdWitSlotID:(NSString *)slotID adFrame:(CGRect)frame interval:(NSInteger)interval currentVC:(UIViewController *)vc immediatelyShow:(BOOL)isImmediately {
    self.currentVC = vc;
    self.isBannerImmediately = isImmediately;
    self.buBannerView = [[BUNativeExpressBannerView alloc] initWithSlotID:slotID rootViewController:vc adSize:frame.size interval:interval];
    self.buBannerView.frame = frame;
    self.buBannerView.delegate = self;
    [self.buBannerView loadAdData];
}

-(void)ads_showBannerAdWithSlotID:(NSString *)slotID {
    if (self.buBannerAdLoaded) {
        [self.currentVC.view addSubview:self.buBannerView];
    }
}

-(void)ads_closeBannerAdWithSlotID:(NSString *)slotID {
    [self.buBannerView removeFromSuperview];
    self.buBannerView = nil;
}

#pragma mark - BUNativeExpressBannerViewDelegate
// 加载成功
-(void)nativeExpressBannerAdViewDidLoad:(BUNativeExpressBannerView *)bannerAdView {
    if ([bannerAdView isEqual:self.buBannerView]) {
        if (self.isBannerImmediately ) {
            [self.currentVC.view addSubview:bannerAdView];
        }else{
            self.buBannerAdLoaded = YES;
        }
    }
}
// 返回的错误码(error)表示广告加载失败的原因
-(void)nativeExpressBannerAdView:(BUNativeExpressBannerView *)bannerAdView didLoadFailWithError:(NSError *)error {
    
}
// dislike回调方法，需要在此回调方法中进行广告的移除操作，并将广告对象置为nil，如若不实现此回调方法，关闭按钮将不会生效
-(void)nativeExpressBannerAdView:(BUNativeExpressBannerView *)bannerAdView dislikeWithReason:(NSArray<BUDislikeWords *> *)filterwords {
    [bannerAdView removeFromSuperview];
    self.buBannerView = nil;
}

@end
