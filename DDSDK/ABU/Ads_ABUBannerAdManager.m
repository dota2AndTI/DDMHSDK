//
//  Ads_ABUBannerAdManager.m
//  AdsDemo
//
//  Created by  on 2021/8/23.
//

#import "Ads_ABUBannerAdManager.h"

@interface Ads_ABUBannerAdManager ()<ABUBannerAdDelegate>

@property (nonatomic,strong)ABUBannerAd *bannerAd;
@property (nonatomic,strong)UIView *bannerAdView;

@property (nonatomic,assign)CGRect bannerFrame;

@end

@implementation Ads_ABUBannerAdManager

- (void)ads_abuRequestBannaerAdWitSlotID:(NSString *)slotID adFrame:(CGRect)frame interval:(NSInteger)interval currentVC:(UIViewController *)vc immediatelyShow:(BOOL)isImmediately {
    self.vc = vc;
    self.isImmediately = isImmediately;
    self.bannerFrame = frame;
    
    self.bannerAd = [[ABUBannerAd alloc] initWithAdUnitID:slotID rootViewController:vc adSize:frame.size autoRefreshTime:interval];
    self.bannerAd.delegate = self;
    [self.bannerAd loadAdData];
}

-(void)ads_abuShowBannerAdWithSlotID:(NSString *)slotID {
    if (self.bannerAdView && self.adLoadSuccess) {
        [self.vc.view addSubview:self.bannerAdView];
    }
}

-(void)ads_abuCloseBannerAdWithSlotID:(NSString *)slotID {
    if (self.bannerAdView) {
        [self.bannerAdView removeFromSuperview];
    }
}

#pragma mark - ABUBannerAdDelegate
-(void)bannerAdDidLoad:(ABUBannerAd *)bannerAd bannerView:(UIView *)bannerView {
    SDKLog(@"%s",__func__);
    bannerView.frame = self.bannerFrame;
    self.bannerAdView = bannerView;
    if (!self.isImmediately) {
        self.adLoadSuccess = YES;
    }else {
        [self.vc.view addSubview:bannerView];
    }
    if (self.delegate && [self.delegate respondsToSelector:@selector(ads_abuLoadSuccess:)]) {
        [self.delegate ads_abuLoadSuccess:self];
    }
}

-(void)bannerAd:(ABUBannerAd *)bannerAd didLoadFailWithError:(NSError *)error {
    SDKLog(@"%s",__func__);
    if (self.delegate && [self.delegate respondsToSelector:@selector(ads_abuLoadFailed:error:)]) {
        [self.delegate ads_abuLoadFailed:self error:error];
    }
}

-(void)bannerAdDidClick:(ABUBannerAd *)ABUBannerAd bannerView:(UIView *)bannerView {
    SDKLog(@"%s",__func__);
    if (self.delegate && [self.delegate respondsToSelector:@selector(ads_abuDidClick:)]) {
        [self.delegate ads_abuDidClick:self];
    }
}

-(void)bannerAdDidClosed:(ABUBannerAd *)ABUBannerAd bannerView:(UIView *)bannerView dislikeWithReason:(NSArray<ABUDislikeWords *> *)filterwords {
    SDKLog(@"%s",__func__);
    if (self.delegate && [self.delegate respondsToSelector:@selector(ads_abuDidClosed:)]) {
        [self.delegate ads_abuDidClosed:self];
    }
}

- (void)bannerAdDidBecomVisible:(ABUBannerAd * _Nonnull)ABUBannerAd bannerView:(nonnull UIView *)bannerView {
    <#code#>
}


- (void)bannerAdWillDismissFullScreenModal:(ABUBannerAd * _Nonnull)ABUBannerAd bannerView:(nonnull UIView *)bannerView {
    <#code#>
}


- (void)bannerAdWillPresentFullScreenModal:(ABUBannerAd * _Nonnull)ABUBannerAd bannerView:(nonnull UIView *)bannerView {
    <#code#>
}





@end
