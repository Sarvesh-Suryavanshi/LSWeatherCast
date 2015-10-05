//
//  LSTopBarView.m
//  LSWeatherCast
//
//  Created by Sarvesh Suryavanshi on 01/10/15.
//  Copyright © 2015 Sarvesh Suryavanshi. All rights reserved.
//

#import "LSTopBarView.h"

@interface LSTopBarView ()
{
    __weak IBOutlet UIButton *_leftButton;
    __weak IBOutlet UILabel *_titleLabel;
    __weak IBOutlet UIButton *_refreshButton;
    __weak IBOutlet UIButton *_doneButton;
    __weak id <LSTopBarDelegate> _delegate;
}
@end

@implementation LSTopBarView

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        [self updateView];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        [self updateView];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self updateView];
    }
    return self;
}

- (void)updateView
{
}

#pragma mark - Setter Methods

- (void)setTitle:(NSString *)title
{
    _titleLabel.text = title;
}

- (void)setRefreshButotnHidden:(BOOL)state
{
    _refreshButton.hidden = state;
}

- (void)setDoneButotnHidden:(BOOL)state
{
    _doneButton.hidden = state;
}

- (void)setBackButotnHidden:(BOOL)state
{
    _leftButton.hidden = state;
}

- (void)setDelegate:(__weak id <LSTopBarDelegate>)delegate
{
    _delegate = delegate;
}

#pragma mark - Action Methods

- (IBAction)backAction:(id)sender
{
    if (_delegate && [_delegate respondsToSelector:@selector(backAction)])
    {
        [_delegate backAction];
    }
}

- (IBAction)doneAction:(id)sender
{
    if (_delegate && [_delegate respondsToSelector:@selector(doneAction)])
    {
        [_delegate doneAction];
    }
}


@end
