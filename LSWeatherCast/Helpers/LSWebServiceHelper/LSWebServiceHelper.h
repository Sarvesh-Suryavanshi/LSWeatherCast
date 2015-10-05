//
//  LSWebServiceHelper.h
//  LSWeatherCast
//
//  Created by Sarvesh Suryavanshi on 02/10/15.
//  Copyright © 2015 Sarvesh Suryavanshi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LSWebServiceHelper : NSObject
+ (instancetype)sharedInstance;
- (NSString *)getAPIFor:(NSString *)geoID;
- (NSString *)getAPIForCity:(NSString *)city forNumberOfDays:(NSString *)days;
@end
