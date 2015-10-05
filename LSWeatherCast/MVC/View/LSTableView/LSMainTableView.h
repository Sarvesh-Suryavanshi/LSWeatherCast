//
//  LSMainTableView.h
//  LSWeatherCast
//
//  Created by Sarvesh Suryavanshi on 02/10/15.
//  Copyright (c) 2015 Sarvesh Suryavanshi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LSCustomizedView.h"
#import "LSWeatherVO.h"
#import "LSWeatherCollectionVO.h"

@protocol LSMainTableViewDelegate <NSObject>
@required
- (void)didSelectItem:(LSWeatherVO *)weatherVO withSectionTitle:(NSString *)title andWeatherCollectonItem:(LSWeatherCollectionVO *)item;
@end

@interface LSMainTableView : LSCustomizedView
- (void)setData:(NSArray *)data;
- (void)setDelegate:(__weak id<LSMainTableViewDelegate>)delegate;
@end
