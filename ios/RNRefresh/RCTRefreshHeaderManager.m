//
//  RCTRefreshHeaderManager.m
//  RNRefresh
//
//  Created by NOTHING on 2021/11/26.
//  Copyright © 2022 NOTHING. All rights reserved.
//

#import "RCTRefreshHeaderManager.h"
#import "RCTRefreshHeader.h"

@implementation RCTRefreshHeaderManager

RCT_EXPORT_MODULE()

- (UIView *)view {
    return [[RCTRefreshHeader alloc] init];
}

@end
