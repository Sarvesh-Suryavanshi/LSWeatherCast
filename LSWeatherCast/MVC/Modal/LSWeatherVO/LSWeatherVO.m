//
//  LSWeatherVO.m
//  LSWeatherCast
//
//  Created by Sarvesh Suryavanshi on 02/10/15.
//  Copyright © 2015 Sarvesh Suryavanshi. All rights reserved.
//

#import "LSWeatherVO.h"
#import "LSIconManager.h"


NSString const * LSWeatherDateKey             =   @"dt";

NSString const * LSWeatherTemperatureKey      =   @"temp";
NSString const * LSWeatherTemperatureDayKey   =   @"day";
NSString const * LSWeatherTemperatureMinKey   =   @"min";
NSString const * LSWeatherTemperatureMaxKey   =   @"max";
NSString const * LSWeatherTemperatureNightKey    =   @"night";
NSString const * LSWeatherTemperatureEveningKey  =   @"eve";
NSString const * LSWeatherTemperatureMorningKey  =   @"morn";

NSString const * LSWeatherPreasureKey   =   @"preasure";
NSString const * LSWeatherHumidityKey   =   @"humidity";

NSString const * LSWeatherWeatherKey       =   @"weather";
NSString const * LSWeatherWeatherTypeKey   =   @"main";

NSString const * LSWeatherWindSpeedKey          =   @"speed";
NSString const * LSWeatherCloudsPercentaageKey  =   @"clouds";


/*
 
 {
 "dt": 1443776400,
 "temp": {
 "day": 287.37,
 "min": 286.87,
 "max": 288.93,
 "night": 286.87,
 "eve": 287.63,
 "morn": 287.37
 },
 "pressure": 1005.59,
 "humidity": 76,
 "weather": [
 {
 "id": 803,
 "main": "Clouds",
 "description": "broken clouds",
 "icon": "04d"
 }
 ],
 "speed": 5.51,
 "deg": 286,
 "clouds": 68
 }
 
 */


@interface LSWeatherVO ()
{

    NSString  * _date;
    NSString  * _temperatureDay;
    NSString  * _temperatureMin;
    NSString  * _temperatureMax;
    NSString  * _temperatureNight;
    NSString  * _temperatureEvening;
    NSString  * _temperatureMorning;
    NSString  * _preasure;
    NSString  * _humidity;
    NSString  * _weatherType;
    NSString  * _windSpeed;
    NSString  * _cloudsPercentaage;
    NSString  * _icon;
}


@end


/*
 
 {
 "dt": 1443776400,
 "temp": {
 "day": 287.37,
 "min": 286.87,
 "max": 288.93,
 "night": 286.87,
 "eve": 287.63,
 "morn": 287.37
 },
 "pressure": 1005.59,
 "humidity": 76,
 "weather": [
 {
 "id": 803,
 "main": "Clouds",
 "description": "broken clouds",
 "icon": "04d"
 }
 ],
 "speed": 5.51,
 "deg": 286,
 "clouds": 68
 }
 
 */

@implementation LSWeatherVO

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self)
    {
        _date = [dictionary valueForKey:(NSString *)LSWeatherDateKey];
        NSDictionary *temperature = [dictionary valueForKey:(NSString *)LSWeatherTemperatureKey];
        _temperatureDay = [temperature valueForKey:(NSString *)LSWeatherTemperatureDayKey];
        _temperatureMin = [temperature valueForKey:(NSString *)LSWeatherTemperatureMinKey];
        _temperatureMax = [temperature valueForKey:(NSString *)LSWeatherTemperatureMaxKey];
        _temperatureNight = [temperature valueForKey:(NSString *)LSWeatherTemperatureNightKey];
        _temperatureEvening = [temperature valueForKey:(NSString *)LSWeatherTemperatureEveningKey];
        _temperatureMorning = [temperature valueForKey:(NSString *)LSWeatherTemperatureMorningKey];
        
        _preasure = [dictionary valueForKey:(NSString *)LSWeatherPreasureKey];
        _humidity = [dictionary valueForKey:(NSString *)LSWeatherHumidityKey];
        
        NSDictionary *weather = [dictionary valueForKey:(NSString *)LSWeatherWeatherKey];
        _weatherType = [weather valueForKey:(NSString *)LSWeatherWeatherTypeKey];
        
        _windSpeed = [dictionary valueForKey:(NSString *)LSWeatherWindSpeedKey];
        _cloudsPercentaage = [dictionary valueForKey:(NSString *)LSWeatherCloudsPercentaageKey];
        
        _icon = [[LSIconManager sharedInstance] getWeatherIcon];
        
    }
    return self;
}

#pragma mark - Getter Methods

- (NSString *)getDate
{
    NSTimeInterval _interval=[_date longLongValue];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:_interval];
    NSDateFormatter *formatter= [[NSDateFormatter alloc] init];
    [formatter setLocale:[NSLocale currentLocale]];
    formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    NSString *tempraryDateString = [formatter stringFromDate:date];
    NSDate *yourDate = [formatter dateFromString:tempraryDateString];
    formatter.dateFormat = @"dd-MMM-yyyy";
    NSString * actualDate = [formatter stringFromDate:yourDate];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"EEEE"];
    NSString * day = [dateFormatter stringFromDate:yourDate];
    
    NSString *finalDate = [NSString stringWithFormat:@"%@ %@",day,actualDate];
    _date = finalDate;
    return _date;
}

- (NSString *)getDayTemp
{
    return [NSString stringWithFormat:@"%.2f",[_temperatureDay doubleValue]];
}

- (NSString *)getMinTemp
{
    return [NSString stringWithFormat:@"%.2f",[_temperatureMin doubleValue]];
}

- (NSString *)getMaxTemp
{
    return [NSString stringWithFormat:@"%.2f",[_temperatureMax doubleValue]];
}
- (NSString *)getNightTemp
{
    return [NSString stringWithFormat:@"%.2f",[_temperatureNight doubleValue]];
}
- (NSString *)getEveningTemp
{
    return [NSString stringWithFormat:@"%.2f",[_temperatureEvening doubleValue]];
}

- (NSString *)getMorningTemp
{
    return [NSString stringWithFormat:@"%.2f",[_temperatureMorning doubleValue]];
}

- (NSString *)getPreasure
{
    return [NSString stringWithFormat:@"%.2f",[_preasure doubleValue]];
}

- (NSString *)getHumidity
{
    return  [NSString stringWithFormat:@"%.2f",[_humidity doubleValue]];
}

- (NSString *)getWeatherType
{
    return [NSString stringWithFormat:@"%@",_weatherType];
}

- (NSString *)getCloudPercentage
{
    return [NSString stringWithFormat:@"%.2f",[_cloudsPercentaage doubleValue]];
}

- (NSString *)getWeatherIcon
{
    return _icon;
}

@end
