//
//  Ads_ABUSplashAsManager.m
//  AdsDemo
//
//  Created by  on 2021/8/23.
//

#import "Ads_ABUSplashAsManager.h"

@interface Ads_ABUSplashAsManager ()<ABUSplashAdDelegate>

@property (nonatomic,strong)ABUSplashAd *splashAd;

@end

@implementation Ads_ABUSplashAsManager

-(void)ads_abuRequestSplashAdWithAppId:(NSString *)appId splashId:(NSString *)splashId viewController:(UIViewController *)vc {
    self.vc = vc;
    
    self.splashAd = [[ABUSplashAd alloc] initWithAdUnitID:splashId];
    self.splashAd.delegate = self;
//    self.splashAd.rootViewController = vc;
    
    [self ads_splashLoadUserDataWithAppId:appId splashId:splashId];
    [self.splashAd loadAdData];
}

-(void)ads_splashLoadUserDataWithAppId:(NSString *)appId splashId:(NSString *)splashId {
    //用于在广告位还在失败，采用传入的rit进行广告加载;该配置需要在load前设置
    ABUSplashUserData *userData = [[ABUSplashUserData alloc] init];
    userData.adnType = ABUAdnPangle;
    
    userData.appID = appId;     // 如果使用穿山甲兜底，请务必传入与MSDK初始化时一致的appID
    userData.rit = splashId;    // 开屏对应的代码位
    NSError *error = nil;
    
    // 在广告位配置拉取失败后，会使用传入的rit和appID兜底，进行广告加载，需要在创建manager时就调用该接口（仅支持穿山甲/MTG/GDT/百度）
    [self.splashAd setUserData:userData error:&error];
    // ！！！如果有错误信息说明setUserData调用有误，需按错误提示重新设置
    if (error) {
        SDKLog(@"log-error:%@",error);
    }
}


#pragma mark - ABUSplashAdDelegate
- (void)splashAdDidLoad:(ABUSplashAd *)splashAd {
    SDKLog(@"%s",__func__);
    if (self.splashAd) {
        UIWindow *window = self.vc.view.window;
        [self.splashAd showInWindow:window];
    }
    if (self.delegate && [self.delegate respondsToSelector:@selector(ads_abuLoadSuccess:)]) {
        [self.delegate ads_abuLoadSuccess:self];
    }
}

- (void)splashAd:(ABUSplashAd *)splashAd didFailWithError:(NSError *)error {
    SDKLog(@"%s-error:%@",__func__,error);
    if (self.delegate && [self.delegate respondsToSelector:@selector(ads_abuLoadFailed:error:)]) {
        [self.delegate ads_abuLoadFailed:self error:error];
    }
}

- (void)splashAdDidShowFailed:(ABUSplashAd *_Nonnull)splashAd error:(NSError *)error {
    SDKLog(@"%s-聚合启动广告展示失败->%@",__func__,error);
    if (self.delegate && [self.delegate respondsToSelector:@selector(ads_abuSplashShowFailed:error:)]) {
        [self.delegate ads_abuSplashShowFailed:self error:error];
    }
}

- (void)splashAdDidClose:(ABUSplashAd *_Nonnull)splashAd {
    SDKLog(@"%s",__func__);
    if (self.splashAd) {
        [self.splashAd destoryAd];
    }
    if (self.delegate && [self.delegate respondsToSelector:@selector(ads_abuDidClosed:)]) {
        [self.delegate ads_abuDidClosed:self];
    }
}

- (void)splashAdWillVisible:(ABUSplashAd *_Nonnull)splashAd {
//    NSLog(@"ecpm:%@", [self.splashAd getPreEcpm]);
//    NSLog(@"platformID:%ld", (long)[self.splashAd getAdNetworkPlaformId]);
//    NSLog(@"ritID:%@", [self.splashAd getAdNetworkRitId]);
    SDKLog(@"%s",__func__);
}


@end
