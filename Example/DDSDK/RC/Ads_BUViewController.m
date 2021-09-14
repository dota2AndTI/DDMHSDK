//
//  Ads_BUViewController.m
//  AdsDemo
//
//  Created by  on 2021/8/18.
//

#import "Ads_BUViewController.h"
#import "AdsLaunchViewController.h"
#import "Ads_BUVideoAdManager.h"
#import "Ads_BUFullVideoAdManager.h"
#import "Ads_BUInterstitialAdManager.h"
#import "Ads_BUBannerAdManager.h"

@interface Ads_BUViewController ()
@property (nonatomic,strong)Ads_BUManager *manager;
@end

@implementation Ads_BUViewController

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
        Ads_BUVideoAdManager *manager = [[Ads_BUVideoAdManager alloc] init];
        self.manager = manager;
        [manager ads_buRequestVideoWithSlotID:@"900546566" userId:@"123" currentVC:self immediatelyShow:YES];
    }else if (sender.tag == 2) {
        Ads_BUFullVideoAdManager *manager = [[Ads_BUFullVideoAdManager alloc] init];
        self.manager = manager;
        [manager ads_requestFullAdsWithSlotID:@"900546551" currentVC:self immediatelyShow:YES];
    }else if (sender.tag == 3) {
        Ads_BUInterstitialAdManager *manager = [[Ads_BUInterstitialAdManager alloc] init];
        self.manager = manager;
        [manager ads_requestInterstitialAdWithSlotID:@"900546270" adSize:self.view.bounds.size currentVC:self immediatelyShow:YES];
    }else if (sender.tag == 4) {
        Ads_BUBannerAdManager *manager = [[Ads_BUBannerAdManager alloc] init];
        self.manager = manager;
        [manager ads_requestBannaerAdWitSlotID:@"900546269" adFrame:CGRectMake(0, self.view.bounds.size.height-50, self.view.bounds.size.width, 50) interval:30 currentVC:self immediatelyShow:YES];
    }else if (sender.tag == 5) {
        AdsLaunchViewController *vc = [[AdsLaunchViewController alloc] init];
        vc.modalPresentationStyle = UIModalPresentationFullScreen;
        vc.type = 1;
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
