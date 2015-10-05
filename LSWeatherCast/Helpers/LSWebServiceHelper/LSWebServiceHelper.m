//
//  LSWebServiceHelper.m
//  LSWeatherCast
//
//  Created by Sarvesh Suryavanshi on 02/10/15.
//  Copyright © 2015 Sarvesh Suryavanshi. All rights reserved.
//

#import "LSWebServiceHelper.h"

NSString const * LOCATION_API_BASE_URL = @"http://api.geonames.org/childrenJSON";
NSString const * API_KEY = @"f46f29d463d34f7709b9e82d58f3c174";

@implementation LSWebServiceHelper

#pragma mark - Initialize

+ (instancetype)sharedInstance
{
    static LSWebServiceHelper *helper = nil;
    static dispatch_once_t token;
    dispatch_once(&token, ^{
        helper = [[LSWebServiceHelper alloc] init];
    });
    
    return helper;
}

- (NSString *)getAPIFor:(NSString *)geoID
{
    return [LOCATION_API_BASE_URL stringByAppendingString:[NSString stringWithFormat:@"?geonameId=%@&username=amit",geoID]];
}

- (NSString *)getAPIForCity:(NSString *)city forNumberOfDays:(NSString *)days
{
    return [NSString stringWithFormat:@"http://api.openweathermap.org/data/2.5/forecast/daily?q=%@&units=metric&cnt=%@&APPID=%@",city,days,API_KEY];
}

@end
