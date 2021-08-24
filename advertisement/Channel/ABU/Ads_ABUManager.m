//
//  Ads_ABUManager.m
//  AdsDemo
//
//  Created by  on 2021/8/23.
//

#import "Ads_ABUManager.h"

@interface Ads_ABUManager ()



@end

@implementation Ads_ABUManager

-(UIViewController *)vc {
    if (!_vc) {
        _vc = [Ads_CommonTool ads_getCurrentViewController];
    }
    return _vc;
}

@end
