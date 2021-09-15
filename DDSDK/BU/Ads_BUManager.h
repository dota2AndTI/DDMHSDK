//
//  Ads_BUManager.h
//  AdsDemo
//
//  Created by  on 2021/8/18.
//

#import <Foundation/Foundation.h>
#import "Ads_CommonTool.h"
NS_ASSUME_NONNULL_BEGIN

@class Ads_BUManager;
@protocol Ads_BUManagerDelegate <NSObject>

@optional
//视频的代理
-(void)ads_buManager:(Ads_BUManager *)manager videoPlayFinishCloseWith:(NSString *)soltId;
-(void)ads_buManager:(Ads_BUManager *)manager videoSkipWith:(NSString *)soltId;
-(void)ads_buManager:(Ads_BUManager *)manager videoRenderFailed:(NSError *)error;
-(void)ads_buVideoRenderSuccessManager:(Ads_BUManager *)manager;

// 插屏广告
-(void)ads_buManager:(Ads_BUManager *)manager interstitialClosedWith:(NSString *)soltId;

//信息流广告
-(void)ads_buManager:(Ads_BUManager *)manager expressLoadSuccess:(NSArray<__kindof BUNativeExpressAdView *> *)views;
-(void)ads_buManager:(Ads_BUManager *)manager expressLoadFailed:(NSError *)error;
-(void)ads_buManager:(Ads_BUManager *)manager expressDislikeWithView:(BUNativeExpressAdView *)expressAdView;
//开屏广告

//Common
-(void)ads_buLoadSuccessWithManager:(Ads_BUManager *)manager;
-(void)ads_buLoadFailedWithManager:(Ads_BUManager *)manager error:(NSError *)error;;
-(void)ads_buClosedWithManager:(Ads_BUManager *)manager;

@end

@interface Ads_BUManager : NSObject

@property (nonatomic,weak) id<Ads_BUManagerDelegate> delegate;
@property (nonatomic,strong)UIViewController *currentVC;

@end

NS_ASSUME_NONNULL_END
