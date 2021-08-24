//
//  Ads_GADInterstitialManager.m
//  AdsDemo
//
//  Created by  on 2021/8/18.
//

#import "Ads_GADInterstitialManager.h"

@interface Ads_GADInterstitialManager ()<GADFullScreenContentDelegate>

@property(nonatomic, strong) GADInterstitialAd *ads_interstitial;
@property (nonatomic,assign)BOOL isInterstitialImmediately;//

@end

@implementation Ads_GADInterstitialManager

-(void)ads_gadRequestInterstitialAdWithUnitID:(NSString *)unitID currentVC:(UIViewController *)vc immediatelyShow:(BOOL) isImmediately {
    self.currentVC = vc;
    self.isInterstitialImmediately = isImmediately;
    GADRequest *request = [GADRequest request];
      [GADInterstitialAd loadWithAdUnitID:unitID
                                  request:request
                        completionHandler:^(GADInterstitialAd *ad, NSError *error) {
        if (error) {
          NSLog(@"Failed to load interstitial ad with error: %@", [error localizedDescription]);
          return;
        }
        self.ads_interstitial = ad;
          ad.fullScreenContentDelegate = self;
          if (isImmediately) {
              [ad presentFromRootViewController:vc];
          }
      }];
}

-(void)ads_showInterstitialAdWithUnitID:(NSString *)unitId {
    if (self.ads_interstitial && !self.isInterstitialImmediately) {
        [self.ads_interstitial presentFromRootViewController:self.currentVC];
    }
}

#pragma mark - GADFullScreenContentDelegate
- (void)ad:(nonnull id<GADFullScreenPresentingAd>)ad
didFailToPresentFullScreenContentWithError:(nonnull NSError *)error {
    NSLog(@"Ad did fail to present full screen content.");
}

- (void)adDidPresentFullScreenContent:(nonnull id<GADFullScreenPresentingAd>)ad {
    NSLog(@"Ad did present full screen content.");
}

- (void)adDidDismissFullScreenContent:(nonnull id<GADFullScreenPresentingAd>)ad {
   NSLog(@"Ad did dismiss full screen content.");
}

@end
