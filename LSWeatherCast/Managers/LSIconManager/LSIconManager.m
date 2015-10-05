//
//  LSIconManager.m
//  LSWeatherCast
//
//  Created by Sarvesh Suryavanshi on 02/10/15.
//  Copyright © 2015 Sarvesh Suryavanshi. All rights reserved.
//

#import "LSIconManager.h"

NSString const * STATE_FONT_NAME     = @"stateicons";
NSString const * CITY_FONT_NAME_SET1 = @"cityiconsset1";
NSString const * CITY_FONT_NAME_SET2 = @"cityiconsset2";
NSString const * LSICONS             = @"lsicons";
NSString const * WEATHER_ICONS       = @"weathericons";

NSString const *  LSLIKE            = @"a";
NSString const *  LSBACK            = @"b";
NSString const *  LSSEARCH          = @"c";
NSString const *  LSUNSELECTED      = @"e";
NSString const *  LSSELECTED        = @"d";
NSString const *  LSPOINTER         = @"f";
NSString const *  LSRIGHTINDICATOR  = @"g";
NSString const *  LSLOCATION        = @"h";
NSString const *  LSRANDOM          = @"i";


@interface LSIconManager ()
{
    NSArray * _cityIconSet;
    NSArray * _stateIconSet;
    NSArray * _weatherIconSet;
}
@end

@implementation LSIconManager

#pragma mark - Initialize

+ (instancetype)sharedInstance
{
    static LSIconManager *manager = nil;
    static dispatch_once_t token;
    dispatch_once(&token, ^{
        manager = [[LSIconManager alloc] init];
    });
    
    return manager;
}

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        [self preProcessData];
    }
    return self;
}

#pragma mark - Helper Methods

- (void)preProcessData
{
    _cityIconSet = [[NSArray alloc]
                    initWithObjects:@"a",@"b",@"c",@"d",@"e",@"f",@"g",@"h",@"i",
                    @"j",@"k",@"l",@"m",@"n",@"o",@"p",@"q",@"r",@"s",@"t",@"u",
                    @"v",@"w",@"x",@"y",@"z",@"A",@"B",@"C",@"D",@"E",@"F",@"G",
                    @"H",@"I",@"J",@"K",@"L",@"M",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",
                    @"V",@"W",@"X",@"Y",@"Z",@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",
                    @"8",@"9",@"\"",@"#",@"$",@"!",nil];
    _stateIconSet = [[NSArray alloc]
                     initWithObjects:@"a",@"b",@"c",@"d",@"e",@"f",@"g",@"h",@"i",
                     @"j",@"k",@"l",@"m",@"n",@"o",@"p",@"q",@"r",@"s",@"t",@"u",
                     @"v",@"w",@"x",@"y",@"z",@"A",@"B",@"C",@"D",@"E",@"F",@"G",
                     @"H",@"I",@"J",nil];
    _weatherIconSet = [[NSArray alloc]
                    initWithObjects:@"a",@"b",@"c",@"d",@"e",@"f",@"g",@"i",
                    @"j",@"k",@"l",@"m",@"n",@"o",@"p",@"q",@"r",@"s",@"u",
                    @"v",@"w",@"x",@"y",@"z",@"A",@"B",@"C",@"D",@"E",@"F",@"G",
                    @"H",@"I",@"J",@"K",@"L",@"O",@"P",@"Q",@"R",nil];
    
}

-(int)getRandomNumberBetween:(int)from to:(int)to
{
    return (int)from + arc4random() % (to-from+1);
}

#pragma mark - Getter Methods

- (NSString *)getStateIcon
{
    NSInteger index = [self getRandomNumberBetween:0 to:(int)[_stateIconSet count]-1];
    return [_stateIconSet objectAtIndex:index];
}

- (NSString *)getCityIcon
{
    NSInteger index = [self getRandomNumberBetween:0 to:(int)[_cityIconSet count]-1];
    return [_cityIconSet objectAtIndex:index];
}

- (NSString *)getStateFontName
{
    return (NSString *)STATE_FONT_NAME;
}

- (NSString *)getCityFontName
{
    NSInteger index = [self getRandomNumberBetween:0 to:1];
    return  index?(NSString *)CITY_FONT_NAME_SET2:(NSString *)CITY_FONT_NAME_SET1;
}

- (NSString *)getWeatherIcon;
{
    NSInteger index = [self getRandomNumberBetween:0 to:(int)[_weatherIconSet count]-1];
    return [_weatherIconSet objectAtIndex:index];
}

- (NSString *)getWeatherFontName
{
    return (NSString *)WEATHER_ICONS;
}

- (UIColor *)getTopBarColour
{
    return [UIColor colorWithRed:212.0f/255.0f green:26.0f/255.0f blue:34.0f/255.0f alpha:1.0];
}


@end