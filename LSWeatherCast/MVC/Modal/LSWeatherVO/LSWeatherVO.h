//
//  LSWeatherVO.h
//  LSWeatherCast
//
//  Created by Sarvesh Suryavanshi on 02/10/15.
//  Copyright © 2015 Sarvesh Suryavanshi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LSWeatherVO : NSObject
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
- (NSString *)getDate;
- (NSString *)getDayTemp;
- (NSString *)getMinTemp;
- (NSString *)getMaxTemp;
- (NSString *)getNightTemp;
- (NSString *)getEveningTemp;
- (NSString *)getMorningTemp;
- (NSString *)getPreasure;
- (NSString *)getHumidity;
- (NSString *)getWeatherType;
- (NSString *)getCloudPercentage;
- (NSString *)getWeatherIcon;
@end