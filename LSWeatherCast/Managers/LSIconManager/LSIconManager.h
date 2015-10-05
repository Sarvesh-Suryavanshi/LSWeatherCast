//
//  LSIconManager.h
//  LSWeatherCast
//
//  Created by Sarvesh Suryavanshi on 02/10/15.
//  Copyright © 2015 Sarvesh Suryavanshi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

extern NSString const *  LSICONS;
extern NSString const *  LSLIKE;
extern NSString const *  LSBACK;
extern NSString const *  LSSEARCH;
extern NSString const *  LSUNSELECTED;
extern NSString const *  LSSELECTED;
extern NSString const *  LSPOINTER;
extern NSString const *  LSRIGHTINDICATOR;
extern NSString const *  LSLOCATION;
extern NSString const *  LSRANDOM;

@interface LSIconManager : NSObject
+ (instancetype)sharedInstance;
- (NSString *)getStateIcon;
- (NSString *)getCityIcon;
- (NSString *)getStateFontName;
- (NSString *)getCityFontName;
- (NSString *)getWeatherIcon;
- (NSString *)getWeatherFontName;
- (UIColor *)getTopBarColour;
@end
