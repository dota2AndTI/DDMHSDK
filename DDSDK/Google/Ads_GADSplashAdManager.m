//
//  Ads_GADSplashAdManager.m
//  AdsDemo
//
//  Created by  on 2021/8/19.
//

#import "Ads_GADSplashAdManager.h"

@interface Ads_GADSplashAdManager ()<GADFullScreenContentDelegate>

@property(strong, nonatomic) GADAppOpenAd* appOpenAd;

@end

@implementation Ads_GADSplashAdManager

-(void)ads_showSplashAdWithUnitID:(NSString *)unitID viewController:(UIViewController *)vc {
    self.currentVC = vc;
    [GADAppOpenAd loadWithAdUnitID:unitID
                           request:[GADRequest request]
                       orientation:UIInterfaceOrientationPortrait
                 completionHandler:^(GADAppOpenAd *_Nullable appOpenAd, NSError *_Nullable error) {
        if (error) {
            NSLog(@"Failed to load app open ad: %@", error);
            if (self.delegate && [self.delegate respondsToSelector:@selector(ads_gadLoadFailedWithManager:)]) {
                [self.delegate ads_gadLoadFailedWithManager:self];
            }
            return;
        }
        self.appOpenAd = appOpenAd;
        self.appOpenAd.fullScreenContentDelegate = self;
        [self ads_showAds];
        if (self.delegate && [self.delegate respondsToSelector:@selector(ads_gadLoadSuccessWithManager:)]) {
            [self.delegate ads_gadLoadSuccessWithManager:self];
        }
    }];
}

-(void)ads_showAds {
    if (self.appOpenAd) {
        [self.appOpenAd presentFromRootViewController:self.currentVC];
    }
}

#pragma mark - GADFullScreenContentDelegate
- (void)ad:(nonnull id<GADFullScreenPresentingAd>)ad
    didFailToPresentFullScreenContentWithError:(nonnull NSError *)error {
  NSLog(@"didFailToPresentFullScreenContentWithError");
    
}

- (void)adDidPresentFullScreenContent:(nonnull id<GADFullScreenPresentingAd>)ad {
  NSLog(@"adDidPresentFullScreenContent");
}

- (void)adDidDismissFullScreenContent:(nonnull id<GADFullScreenPresentingAd>)ad {
  NSLog(@"adDidDismissFullScreenContent");
    if (self.delegate && [self.delegate respondsToSelector:@selector(ads_gadClosedWithManager:)]) {
        [self.delegate ads_gadClosedWithManager:self];
    }
}

@end
