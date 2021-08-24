//
//  Ads_BUExpressAdManager.m
//  AdsDemo
//
//  Created by  on 2021/8/19.
//

#import "Ads_BUExpressAdManager.h"

@interface Ads_BUExpressAdManager ()<BUNativeExpressAdViewDelegate>

@property (nonatomic,strong)BUNativeExpressAdManager *buExpressAd;

@property (nonatomic,strong)NSMutableArray<BUNativeExpressAdView *> *buExpressAds;

@end

@implementation Ads_BUExpressAdManager

- (NSMutableArray<BUNativeExpressAdView *> *)buExpressAds {
    if (!_buExpressAds) {
        _buExpressAds = [NSMutableArray arrayWithCapacity:3];
    }
    return _buExpressAds;
}

-(void)ads_requestExpressAdWithSlotID:(NSString *)slotID adSize:(CGSize)size count:(NSInteger)count currentVC:(UIViewController *)vc immediatelyShow:(BOOL)isImmediately {
    self.currentVC = vc;
    BUAdSlot *slot1 = [[BUAdSlot alloc] init];
    slot1.ID = slotID;
    slot1.AdType = BUAdSlotAdTypeFeed;
    BUSize *imgSize = [BUSize sizeBy:BUProposalSize_Feed228_150];
    slot1.imgSize = imgSize;
    slot1.position = BUAdSlotPositionFeed;
    // self.nativeExpressAdManager可以重用
    self.buExpressAd = [[BUNativeExpressAdManager alloc] initWithSlot:slot1 adSize:size];
    self.buExpressAd.delegate = self;
    [self.buExpressAd loadAdDataWithCount:count];
    
}

-(void)ads_showExpressAdWithSlotID:(NSString *)slotID {
    
}

-(NSMutableArray *)ads_getExpressAdWithSlotID:(NSString *)slotID {
    return self.buExpressAds;
}

#pragma mark - BUNativeExpressAdViewDelegate
//广告视图加载成功
-(void)nativeExpressAdSuccessToLoad:(BUNativeExpressAdManager *)nativeExpressAdManager views:(NSArray<__kindof BUNativeExpressAdView *> *)views {
    self.buExpressAds = [views mutableCopy];
    if (self.delegate && [self.delegate respondsToSelector:@selector(ads_buManager:expressLoadSuccess:)]) {
        [self.delegate ads_buManager:self expressLoadSuccess:views];
    }
}
// 返回的错误码(error)表示广告加载失败的原因
-(void)nativeExpressAdFailToLoad:(BUNativeExpressAdManager *)nativeExpressAdManager error:(NSError *)error {
    if (self.delegate && [self.delegate respondsToSelector:@selector(ads_buManager:expressLoadFailed:)]) {
        [self.delegate ads_buManager:self expressLoadFailed:error];
    }
}
// 渲染成功
-(void)nativeExpressAdViewRenderSuccess:(BUNativeExpressAdView *)nativeExpressAdView {
    
}
// 穿山甲会主动关闭掉广告，广告移除后需要开发者对界面进行适配
-(void)nativeExpressAdViewDidRemoved:(BUNativeExpressAdView *)nativeExpressAdView {
    [self.buExpressAds removeObject:nativeExpressAdView];
    if (self.delegate && [self.delegate respondsToSelector:@selector(ads_buManager:expressDislikeWithView:)]) {
        [self.delegate ads_buManager:self expressDislikeWithView:nativeExpressAdView];
    }
}
//点击了不喜欢 广告移除后需要开发者对界面进行适配
-(void)nativeExpressAdView:(BUNativeExpressAdView *)nativeExpressAdView dislikeWithReason:(NSArray<BUDislikeWords *> *)filterWords {
    [self.buExpressAds removeObject:nativeExpressAdView];
    if (self.delegate && [self.delegate respondsToSelector:@selector(ads_buManager:expressDislikeWithView:)]) {
        [self.delegate ads_buManager:self expressDislikeWithView:nativeExpressAdView];
    }
}


@end
