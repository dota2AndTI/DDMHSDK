//
//  Ads_BUManager.m
//  AdsDemo
//
//  Created by  on 2021/8/18.
//

#import "Ads_BUManager.h"
#import "Ads_CommonTool.h"
@interface Ads_BUManager ()



@end

@implementation Ads_BUManager

-(UIViewController *)currentVC {
    if (!_currentVC) {
        _currentVC = [Ads_CommonTool ads_getCurrentViewController];
    }
    return _currentVC;
}






@end
