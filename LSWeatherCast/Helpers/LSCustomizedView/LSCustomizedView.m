//
//  LSCustomizedView.m
//  LSWeatherCast
//
//  Created by Sarvesh Suryavanshi on 01/10/15.
//  Copyright © 2015 Sarvesh Suryavanshi. All rights reserved.
//

#import "LSCustomizedView.h"

@interface LSCustomizedView ()
{
    UIView *_nibView;
}

@end

@implementation LSCustomizedView

#pragma mark - Initialization

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        [self processView];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        [self processView];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self processView];
    }
    return self;
}

- (void)processView
{
    _nibView = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil] lastObject];
    _nibView.frame = self.bounds;
    [self addSubview:_nibView];
    _nibView.backgroundColor = self.backgroundColor = [UIColor clearColor];
}


@end
