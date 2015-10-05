//
//  LSTableViewCell.h
//  LSWeatherCast
//
//  Created by Sarvesh Suryavanshi on 02/10/15.
//  Copyright (c) 2015 Sarvesh Suryavanshi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LSWeatherCollectionVO.h"
#import "LSWeatherVO.h"

extern NSString const * HBSectionDataKey;
extern NSString const * HBProductNameKey;

@protocol LSTableViewCellDelegate <NSObject>
@required
- (void)didSelectItem:(LSWeatherVO *)weatherVO withSectionTitle:(NSString *)title andWeatherCollectonItem:(LSWeatherCollectionVO *)item;
@end

@interface LSTableViewCell : UITableViewCell
- (void)setDataDictionary:(LSWeatherCollectionVO *)item;
- (void)setDelegate:( __weak id <LSTableViewCellDelegate>) delegate;
@end
