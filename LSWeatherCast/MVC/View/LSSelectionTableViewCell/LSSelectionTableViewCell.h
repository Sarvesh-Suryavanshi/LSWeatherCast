//
//  LSSelectionTableViewCell.h
//  LSWeatherCast
//
//  Created by Sarvesh Suryavanshi on 02/10/15.
//  Copyright © 2015 Sarvesh Suryavanshi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LSSelectionTableViewCell : UITableViewCell
- (void)setSelectedArray:(NSArray *)selectedArray;
- (void)setItem:(NSString *)item andIcon:(NSString *)icon;
@end
