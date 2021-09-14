//
//  Ads_AggregationViewController.m
//  AdsDemo
//
//  Created by  on 2021/8/23.
//

#import "Ads_AggregationViewController.h"
#import "AdsLaunchViewController.h"

#import "Ads_ABURewardAdManager.h"
#import "Ads_ABUFullRewardAdManager.h"
#import "Ads_ABUInterstitialAdManager.h"
#import "Ads_ABUBannerAdManager.h"

#import <ABUAdAdmobAdapter/ABUAdAdmobAdapter.h>
#import <ABUAdGdtAdapter/ABUAdGdtAdapter.h>
#import <ABUAdSDKAdapter/ABUAdSDKAdapter.h>

@interface Ads_AggregationViewController ()

@property (nonatomic,strong)Ads_ABUManager *manager;

@end

@implementation Ads_AggregationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *btn_1 = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 40)];
    [btn_1 setTitle:@"激励视频" forState:UIControlStateNormal];
    [btn_1 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btn_1 addTarget:self action:@selector(adsShowClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn_1];
    btn_1.tag = 1;
    
    UIButton *btn_2 = [[UIButton alloc] initWithFrame:CGRectMake(100, 200, 100, 40)];
    [btn_2 setTitle:@"全屏视频" forState:UIControlStateNormal];
    [btn_2 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btn_2 addTarget:self action:@selector(adsShowClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn_2];
    btn_2.tag = 2;
    
    UIButton *btn_3 = [[UIButton alloc] initWithFrame:CGRectMake(100, 300, 100, 40)];
    [btn_3 setTitle:@"插屏" forState:UIControlStateNormal];
    [btn_3 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btn_3 addTarget:self action:@selector(adsShowClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn_3];
    btn_3.tag = 3;
    
    UIButton *btn_4 = [[UIButton alloc] initWithFrame:CGRectMake(100, 400, 100, 40)];
    [btn_4 setTitle:@"Banner" forState:UIControlStateNormal];
    [btn_4 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btn_4 addTarget:self action:@selector(adsShowClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn_4];
    btn_4.tag = 4;
    
    UIButton *btn_5 = [[UIButton alloc] initWithFrame:CGRectMake(100, 500, 100, 40)];
    [btn_5 setTitle:@"开屏广告" forState:UIControlStateNormal];
    [btn_5 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btn_5 addTarget:self action:@selector(adsShowClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn_5];
    btn_5.tag = 5;
    
}

-(void)adsShowClick:(UIButton *)sender {
    if (sender.tag == 1) {
        Ads_ABURewardAdManager *manager = [[Ads_ABURewardAdManager alloc] init];
        self.manager = manager;
        [manager ads_abuRequestRewardAdWith:@"945494747" viewController:self immediatelyShow:YES];
    }else if (sender.tag == 2) {
        Ads_ABUFullRewardAdManager *manager = [[Ads_ABUFullRewardAdManager alloc] init];
        self.manager = manager;
        [manager ads_abuRequestFullVideoAdWith:@"945494752" viewController:self immediatelyShow:YES];
    }else if (sender.tag == 3) {
        Ads_ABUInterstitialAdManager *manager = [[Ads_ABUInterstitialAdManager alloc] init];
        self.manager = manager;
        [manager ads_abuRequestInterstitialAdWith:@"945494755" expectSize:self.view.bounds.size viewController:self immediatelyShow:YES];
    }else if (sender.tag == 4) {
        Ads_ABUBannerAdManager *manager = [[Ads_ABUBannerAdManager alloc] init];
        self.manager = manager;
        [manager ads_abuRequestBannaerAdWitSlotID:@"945494753" adFrame:CGRectMake(0, self.view.bounds.size.height-50, self.view.bounds.size.width, 50) interval:30 currentVC:self immediatelyShow:YES];
    }else if (sender.tag == 5) {
        AdsLaunchViewController *vc = [[AdsLaunchViewController alloc] init];
        vc.modalPresentationStyle = UIModalPresentationFullScreen;
        vc.type = 3;
        [self presentViewController:vc animated:YES completion:nil];
    }
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
