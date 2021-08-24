//
//  Ads_ABUInterstitialAdManager.m
//  AdsDemo
//
//  Created by  on 2021/8/23.
//

#import "Ads_ABUInterstitialAdManager.h"

@interface Ads_ABUInterstitialAdManager ()<ABUInterstitialAdDelegate>

@property (nonatomic,strong)ABUInterstitialAd *interstitialAd;

@end

@implementation Ads_ABUInterstitialAdManager

-(void)ads_abuRequestInterstitialAdWith:(NSString *)adId expectSize:(CGSize)size viewController:(nonnull UIViewController *)vc immediatelyShow:(BOOL)isImmediately {
    self.vc = vc;
    self.isImmediately = isImmediately;
    
    self.interstitialAd = [[ABUInterstitialAd alloc] initWithAdUnitID:adId size:size];
    self.interstitialAd.delegate = self;
    [self.interstitialAd loadAdData];
}

-(void)ads_abuShowInterstitialAdWith:(NSString *)adId {
    if (self.interstitialAd && self.adLoadSuccess) {
        [self.interstitialAd showAdFromRootViewController:self.vc];
    }
}

#pragma mark - ABUInterstitialAdDelegate
- (void)interstitialAdDidLoad:(ABUInterstitialAd *)interstitialAd {
    SDKLog(@"%s",__func__);
    if (interstitialAd && self.isImmediately) {
        [interstitialAd showAdFromRootViewController:self.vc];
    }
    self.adLoadSuccess = YES;
    if (self.delegate && [self.delegate respondsToSelector:@selector(ads_abuLoadSuccess:)]) {
        [self.delegate ads_abuLoadSuccess:self];
    }
}

-(void)interstitialAd:(ABUInterstitialAd *)interstitialAd didFailWithError:(NSError *)error {
    SDKLog(@"%s",__func__);
    if (self.delegate && [self.delegate respondsToSelector:@selector(ads_abuLoadFailed:error:)]) {
        [self.delegate ads_abuLoadFailed:self error:error];
    }
}

-(void)interstitialAdDidClick:(ABUInterstitialAd *)interstitialAd {
    SDKLog(@"%s",__func__);
    if (self.delegate && [self.delegate respondsToSelector:@selector(ads_abuDidClick:)]) {
        [self.delegate ads_abuDidClick:self];
    }
}

-(void)interstitialAdDidClose:(ABUInterstitialAd *)interstitialAd {
    SDKLog(@"%s",__func__);
    if (self.delegate && [self.delegate respondsToSelector:@selector(ads_abuDidClosed:)]) {
        [self.delegate ads_abuDidClosed:self];
    }
}

-(void)interstitialAdDidShowFailed:(ABUInterstitialAd *)interstitialAd error:(NSError *)error {SDKLog(@"%s",__func__);
    if (self.delegate && [self.delegate respondsToSelector:@selector(ads_abuInterstitialShowFailed:error:)]) {
        [self.delegate ads_abuInterstitialShowFailed:self error:error];
    }
}

-(void)interstitialAdViewRenderFail:(ABUInterstitialAd *)interstitialAd error:(NSError *)error {
    SDKLog(@"%s",__func__);
    if (!error) {
        self.adLoadSuccess = YES;
    }else {
        if (self.delegate && [self.delegate respondsToSelector:@selector(ads_abuRenderFailed:error:)]) {
            [self.delegate ads_abuRenderFailed:self error:error];
        }
    }
}

@end
