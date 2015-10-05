//
//  LSCollectionViewCell.m
//  LSWeatherCast
//
//  Created by Sarvesh Suryavanshi on 02/10/15.
//  Copyright (c) 2015 Sarvesh Suryavanshi. All rights reserved.
//

//

#import "LSCollectionViewCell.h"
#import "LSIconManager.h"

@interface LSCollectionViewCell ()
{
    __weak IBOutlet UILabel *_titleLabel;
    __weak IBOutlet UILabel *_iconLabel;
}
@end

@implementation LSCollectionViewCell

- (void)awakeFromNib
{
    [_iconLabel.layer setBorderWidth:1.0f];
    [_iconLabel.layer setBorderColor:[[LSIconManager sharedInstance] getTopBarColour].CGColor];
    [_iconLabel.layer setCornerRadius:_iconLabel.bounds.size.width/2];
    [_iconLabel setClipsToBounds:YES];
    
    [self.layer setBorderWidth:1.0f];
    [self.layer setBorderColor:[[LSIconManager sharedInstance] getTopBarColour].CGColor];
    [self.layer setCornerRadius:10];
    [self setClipsToBounds:YES];
}

- (void)setItem:(LSWeatherVO *)item
{
    [_iconLabel setText:[item getWeatherIcon]];
    [_titleLabel setText:[item getDate]];
}
@end
