//
//  RCTRefreshLayoutManager.m
//  RNRefresh
//
//  Created by NOTHING on 2021/11/26.
//  Copyright © 2022 NOTHING. All rights reserved.
//

#import "RCTRefreshLayoutManager.h"
#import "RCTRefreshLayout.h"

@implementation RCTRefreshLayoutManager

RCT_EXPORT_MODULE()

- (UIView *)view {
    return [[RCTRefreshLayout alloc] init];
}

RCT_EXPORT_VIEW_PROPERTY(refreshing, BOOL)
RCT_EXPORT_VIEW_PROPERTY(onRefresh, RCTDirectEventBlock)
RCT_EXPORT_VIEW_PROPERTY(onChangeState, RCTDirectEventBlock)
RCT_EXPORT_VIEW_PROPERTY(onChangeOffset, RCTDirectEventBlock)

@end
