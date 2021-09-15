//
//  Ads_GADBannerManager.m
//  AdsDemo
//
//  Created by  on 2021/8/18.
//

#import "Ads_GADBannerManager.h"

@interface Ads_GADBannerManager ()<GADBannerViewDelegate>

@property(nonatomic, strong) GADBannerView *bannerView;
@property (nonatomic,assign) CGPoint point;
@property (nonatomic,assign)BOOL isBannerImmediately;//

@property (nonatomic,assign)NSInteger methods;
@property (nonatomic,assign)BOOL isShowed;

@end

@implementation Ads_GADBannerManager

-(void)ads_gadRequestBannerAdWithUnitID:(NSString *)unitID bannerOriginal:(CGPoint)point bannerSize:(GADAdSize)size currentVC:(UIViewController *)vc immediatelyShow:(BOOL) isImmediately {
    self.currentVC = vc;
    self.point = point;
    self.isBannerImmediately = isImmediately;
    self.bannerView = [[GADBannerView alloc] initWithAdSize:size];
    self.bannerView.adUnitID = unitID;
    [self.bannerView loadRequest:[GADRequest request]];
    self.bannerView.delegate = self;
    self.methods = 1;
    if (isImmediately) {
        [vc.view addSubview:self.bannerView];
    }
}

-(void)ads_gadRequestBannerAdWithUnitID:(NSString *)unitID bannerFrame:(CGRect)frame currentVC:(UIViewController *)vc immediatelyShow:(BOOL) isImmediately {
    self.currentVC = vc;
    self.isBannerImmediately = isImmediately;
    
    self.bannerView = [[GADBannerView alloc] initWithFrame:frame];
    self.bannerView.adUnitID = unitID;
    if (isImmediately) {
        self.bannerView.rootViewController = vc;
        [vc.view addSubview:self.bannerView];
    }
    
    if (@available(iOS 11.0, *)) {
        frame = UIEdgeInsetsInsetRect(vc.view.frame, vc.view.safeAreaInsets);
    }
    CGFloat viewWidth = frame.size.width;
    self.bannerView.adSize = GADCurrentOrientationAnchoredAdaptiveBannerAdSizeWithWidth(viewWidth);
    GADRequest *request = [GADRequest request];
    [self.bannerView loadRequest:request];
    self.methods = 2;
}

-(void)ads_showBannerAdWithUnitID:(NSString *)unitID {
    if (!self.isBannerImmediately) {
        [self.currentVC.view addSubview:self.bannerView];
    }
}

-(void)ads_closeBannerAdWithUnitID:(NSString *)unitID {
    [self.bannerView removeFromSuperview];
}

-(void)ads_bannerWillAppearAnimated:(BOOL)animated {
    if (!self.isShowed) {
        [self.currentVC.view addSubview:self.bannerView];
    }
}

-(void)ads_bannerWillDisappearAnimated:(BOOL)animated {
    if (self.isShowed) {
        self.isShowed = NO;
        [self.bannerView removeFromSuperview];
    }
}

#pragma mark - GADBannerViewDelegate

- (void)bannerViewDidReceiveAd:(nonnull GADBannerView *)bannerView {
    NSLog(@"google banner did receive");
    if (self.methods == 1) {
        CGRect frame = bannerView.frame;
        frame.origin = self.point;
        bannerView.frame = frame;
    }
    self.isShowed = YES;
    if (self.delegate && [self.delegate respondsToSelector:@selector(ads_gadLoadSuccessWithManager:)]) {
        [self.delegate ads_gadLoadSuccessWithManager:self];
    }
}

- (void)bannerView:(nonnull GADBannerView *)bannerView
didFailToReceiveAdWithError:(nonnull NSError *)error {
    NSLog(@"google banner fail receive");
    if (self.delegate && [self.delegate respondsToSelector:@selector(ads_gadLoadFailedWithManager:)]) {
        [self.delegate ads_gadLoadFailedWithManager:self];
    }
}

@end
