//
//  LSTopBarView.h
//  LSWeatherCast
//
//  Created by Sarvesh Suryavanshi on 01/10/15.
//  Copyright © 2015 Sarvesh Suryavanshi. All rights reserved.
//

#import "LSCustomizedView.h"

@protocol LSTopBarDelegate <NSObject>
@required
- (void)backAction;
- (void)doneAction;
@end

@interface LSTopBarView : LSCustomizedView
- (void)setTitle:(NSString *)title;
- (void)setRefreshButotnHidden:(BOOL)state;
- (void)setDoneButotnHidden:(BOOL)state;
- (void)setBackButotnHidden:(BOOL)state;
- (void)setDelegate:(__weak id <LSTopBarDelegate>)delegate;
@end
