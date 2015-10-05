//
//  LSDetailView.h
//  LSWeatherCast
//
//  Created by Sarvesh Suryavanshi on 04/10/15.
//  Copyright © 2015 Sarvesh Suryavanshi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LSWeatherVO.h"
#import "LSWeatherCollectionVO.h"

@interface LSDetailVC : UIViewController
- (void)setData:(LSWeatherVO *)weather withTitle:(NSString *)title andWeatherCollectonItem:(LSWeatherCollectionVO *)item;
@end
