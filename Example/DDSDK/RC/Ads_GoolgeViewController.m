//
//  Ads_GoolgeViewController.m
//  AdsDemo
//
//  Created by  on 2021/8/18.
//

#import "Ads_GoolgeViewController.h"
#import "AdsLaunchViewController.h"

#import "Ads_GADRewardManager.h"
#import "Ads_GADFullVideoManager.h"
#import "Ads_GADInterstitialManager.h"
#import "Ads_GADBannerManager.h"
@interface Ads_GoolgeViewController ()

@property (nonatomic,strong)Ads_GADManager *manager;

@end

@implementation Ads_GoolgeViewController

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
        Ads_GADRewardManager *mangager = [[Ads_GADRewardManager alloc] init];
        [mangager ads_gadRequestVideoWithUnitID:@"ca-app-pub-3940256099942544/1712485313" currentVC:self immediatelyShow:YES];
        self.manager = mangager;
//        mangager ads_gadRequestVideoWithUnit
    }else if (sender.tag == 2) {
        Ads_GADFullVideoManager *manager = [[Ads_GADFullVideoManager alloc] init];
        [manager ads_gadRequestFullVideoWithUnitID:@"ca-app-pub-3940256099942544/6978759866" currentVC:self immediatelyShow:YES];
        self.manager = manager;
    }else if (sender.tag == 3) {
        Ads_GADInterstitialManager *manager = [[Ads_GADInterstitialManager alloc]init];
        [manager ads_gadRequestInterstitialAdWithUnitID:@"ca-app-pub-3940256099942544/4411468910" currentVC:self immediatelyShow:YES];
        self.manager = manager;
    }else if (sender.tag == 4) {
        Ads_GADBannerManager *manager = [[Ads_GADBannerManager alloc] init];
        [manager ads_gadRequestBannerAdWithUnitID:@"ca-app-pub-3940256099942544/2934735716" bannerFrame:CGRectMake(0, self.view.frame.size.height - 100, self.view.frame.size.width, 50) currentVC:self immediatelyShow:YES];
        self.manager = manager;
    }else if (sender.tag == 5) {
        AdsLaunchViewController *vc = [[AdsLaunchViewController alloc] init];
        vc.modalPresentationStyle = UIModalPresentationFullScreen;
        vc.type = 2;
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
