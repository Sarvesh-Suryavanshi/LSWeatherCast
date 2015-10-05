//
//  LSDetailViewCell.m
//  LSWeatherCast
//
//  Created by Sarvesh Suryavanshi on 04/10/15.
//  Copyright © 2015 Sarvesh Suryavanshi. All rights reserved.
//

#import "LSDetailViewCell.h"

@interface LSDetailViewCell ()
{
    __weak IBOutlet UILabel *_titleLabel;
    __weak IBOutlet UILabel *_valueLabel;
}
@end

@implementation LSDetailViewCell

- (void)awakeFromNib
{
    [self setSelectionStyle:UITableViewCellSelectionStyleNone];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)setTitle:(NSString *)title andValue:(NSString *)value
{
    [_titleLabel setText:title];
    [_valueLabel setText:value];
}
@end
