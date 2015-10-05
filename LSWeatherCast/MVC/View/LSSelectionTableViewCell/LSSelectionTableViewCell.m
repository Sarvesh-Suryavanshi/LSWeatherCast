//
//  LSSelectionTableViewCell.m
//  LSWeatherCast
//
//  Created by Sarvesh Suryavanshi on 02/10/15.
//  Copyright © 2015 Sarvesh Suryavanshi. All rights reserved.
//

#import "LSSelectionTableViewCell.h"
#import "LSIconManager.h"

NSInteger const ICON_SIZE = 35.0f;

@interface LSSelectionTableViewCell ()
{
    __weak IBOutlet UILabel *_title;
    __weak IBOutlet UILabel *_iconLabel;
    NSArray * _selectedArray;
    NSString * _currentCity;
}
@end

@implementation LSSelectionTableViewCell

- (void)awakeFromNib
{
    [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    [_iconLabel.layer setBorderWidth:1.0f];
    [_iconLabel.layer setBorderColor:[[LSIconManager sharedInstance] getTopBarColour].CGColor];
    [_iconLabel.layer setCornerRadius:_iconLabel.bounds.size.width/2];
    [_iconLabel setClipsToBounds:YES];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{}

- (void)setSelectedArray:(NSArray *)selectedArray
{
    _selectedArray = selectedArray;
}

- (void)checkAndUpdateButton
{
    if (_selectedArray && _selectedArray.count>0)
    {
        BOOL state = NO;
        for (NSString *city in _selectedArray)
        {
            if ([city isEqualToString:_currentCity])
            {
                state = YES;
                self.accessoryType = UITableViewCellAccessoryCheckmark;
                break;
            }
        }
        
        if (!state)
        {
            self.accessoryType = UITableViewCellAccessoryNone;
        }
    }
}

#pragma mark - Setter Method

- (void)setItem:(NSString *)item andIcon:(NSString *)icon
{
    _title.text = item;
     _currentCity = item;
    [_iconLabel setFont:[UIFont fontWithName:[[LSIconManager sharedInstance] getCityFontName] size:ICON_SIZE]];
    [_iconLabel setText:icon];
    [self checkAndUpdateButton];
}
@end
