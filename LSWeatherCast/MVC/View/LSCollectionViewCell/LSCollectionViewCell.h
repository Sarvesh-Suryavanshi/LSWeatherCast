//
//  LSCollectionViewCell.h
//  LSWeatherCast
//
//  Created by Sarvesh Suryavanshi on 02/10/15.
//  Copyright (c) 2015 Sarvesh Suryavanshi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LSWeatherVO.h"

@interface LSCollectionViewCell : UICollectionViewCell
- (void)setItem:(LSWeatherVO *)item;
@end
