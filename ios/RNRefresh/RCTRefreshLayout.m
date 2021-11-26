//
//  RCTRefreshLayout
//  RNRefresh
//
//  Created by NOTHING on 2021/11/26.
//  Copyright © 2022 NOTHING. All rights reserved.
//

#import "RCTRefreshLayout.h"

@interface RCTRefreshLayout ()

@property (nonatomic, assign) MJRefreshState preState;

@end

@implementation RCTRefreshLayout

- (instancetype)init {
    if (self = [super init]) {
        _preState = MJRefreshStateIdle;
    }
    return self;
}

- (void)setState:(MJRefreshState)state {
    [super setState:state];
    if (self.onChangeState) {
        if (state == MJRefreshStateIdle && (_preState == MJRefreshStateRefreshing || _preState == MJRefreshStateWillRefresh)) {
            self.onChangeState(@{@"state":@(4)}); // 结束刷新
        } else if (state == MJRefreshStateWillRefresh){
            self.onChangeState(@{@"state":@(3)}); // 正在刷新
        } else {
            self.onChangeState(@{@"state":@(state)});
        }
    }
    _preState = state;
}

- (void)scrollViewContentOffsetDidChange:(NSDictionary *)change {
    [super scrollViewContentOffsetDidChange:change];
    if (self.onChangeOffset) {
        CGPoint newPoint = [change[@"new"] CGPointValue];
        CGPoint oldPoint = [change[@"old"] CGPointValue];
        if (!CGPointEqualToPoint(newPoint, oldPoint)) {
            self.onChangeOffset(@{@"offset":@(fabs(newPoint.y))});
        }
    }
}

- (void)setRefreshing:(BOOL)refreshing {
    if (refreshing && self.state == MJRefreshStateIdle) {
        MJRefreshDispatchAsyncOnMainQueue({
            [self beginRefreshing];
        })
    } else if (!refreshing && (self.state == MJRefreshStateRefreshing || self.state == MJRefreshStateWillRefresh)) {
        __weak typeof(self) weakSelf = self;
        [self endRefreshingWithCompletionBlock:^{
            typeof(weakSelf) self = weakSelf;
            if (self.onChangeState) {
                self.onChangeState(@{@"state":@(MJRefreshStateIdle)});
            }
        }];
    }
}

@end
