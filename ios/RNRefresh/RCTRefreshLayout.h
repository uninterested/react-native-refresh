//
//  RCTRefreshLayout.h
//  RNRefresh
//
//  Created by NOTHING on 2021/11/26.
//  Copyright © 2022 NOTHING. All rights reserved.
//

#import <MJRefresh/MJRefresh.h>
#import <React/RCTConvert.h>
#import <React/RCTComponent.h>
#import <React/RCTScrollableProtocol.h>

NS_ASSUME_NONNULL_BEGIN

@interface RCTRefreshLayout : MJRefreshHeader<RCTCustomRefreshContolProtocol>

@property (nullable, nonatomic, copy) RCTDirectEventBlock onRefresh;
@property (nullable, nonatomic, copy) RCTDirectEventBlock onChangeState;
@property (nullable, nonatomic, copy) RCTDirectEventBlock onChangeOffset;

@end

NS_ASSUME_NONNULL_END
