//
//  Ads_GADManager.m
//  AdsDemo
//
//  Created by  on 2021/8/18.
//

#import "Ads_GADManager.h"

@implementation Ads_GADManager

-(UIViewController *)currentVC {
    if (!_currentVC) {
        _currentVC = [Ads_CommonTool ads_getCurrentViewController];
    }
    return _currentVC;
}

@end
