//
//  AdsLaunchViewController.m
//  AdsDemo
//
//  Created by  on 2021/8/19.
//

#import "AdsLaunchViewController.h"

#import "Ads_GADSplashAdManager.h"
#import "Ads_BUSplashAdManager.h"
#import "Ads_ABUSplashAsManager.h"
@interface AdsLaunchViewController ()<Ads_GADManagerDelegate,Ads_BUManagerDelegate,Ads_ABUManagerDelegate>

@property (nonatomic,strong)Ads_GADSplashAdManager *gadSplash;
@property (nonatomic,strong)Ads_BUSplashAdManager *buSplash;
@property (nonatomic,strong)Ads_ABUSplashAsManager *abuSplashAd;
@property (nonatomic,strong)UIButton *btn_5;

@end

@implementation AdsLaunchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    if (self.type == 1) {
        self.buSplash = [[Ads_BUSplashAdManager alloc] init];
        [self.buSplash ads_buShowVideoWithSlotID:@"800546808" frame:self.view.bounds hideSkipBtn:YES tolerateTimeout:5 currentVC:self];
        self.buSplash.delegate = self;
    }else if(self.type == 2) {
        self.gadSplash = [[Ads_GADSplashAdManager alloc] init];
        self.gadSplash.delegate = self;
        [self.gadSplash ads_showSplashAdWithUnitID:@"ca-app-pub-3940256099942544/5662855259" viewController:self];
    }else if (self.type == 3) {
        Ads_ABUSplashAsManager *abuSplashAd = [[Ads_ABUSplashAsManager alloc] init];
        self.abuSplashAd = abuSplashAd;
        abuSplashAd.delegate = self;
        [abuSplashAd ads_abuRequestSplashAdWithAppId:@"5000546" splashId:@"887418500" viewController:self];
    }
    
    UIButton *btn_5 = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 40)];
    self.btn_5 = btn_5;
    [btn_5 setTitle:@"退出" forState:UIControlStateNormal];
    [btn_5 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btn_5 addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn_5];
    
    btn_5.hidden = YES;
}

#pragma mark - Ads_GADManagerDelegate
-(void)ads_gadSplashLoadClosedWithManager:(Ads_GADManager *)manager {
    NSLog(@"google 开屏广告结束 退出 VC");
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)ads_gadSplashLoadFailedWithManager:(Ads_GADManager *)manager {
    NSLog(@"google 开屏广告请求失败");
    self.btn_5.hidden = NO;
}

-(void)backClick {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Ads_BUManagerDelegate
-(void)ads_buSplashLoadSuccessWithManager:(Ads_BUManager *)manager {
    
}
-(void)ads_buSplashLoadFailedWithManager:(Ads_BUManager *)manager {
    NSLog(@"穿山甲 开屏广告请求失败 退出 VC");
    self.btn_5.hidden = NO;
}
-(void)ads_buSplashLoadClosedWithManager:(Ads_BUManager *)manager {
    NSLog(@"穿山甲 开屏广告结束 退出 VC");
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Ads_ABUManagerDelegate
-(void)ads_abuLoadSuccess:(Ads_ABUManager *)manager {
    
}

-(void)ads_abuDidClosed:(Ads_ABUManager *)manager {
    
}

-(void)ads_abuDidClick:(Ads_ABUManager *)manager {
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
