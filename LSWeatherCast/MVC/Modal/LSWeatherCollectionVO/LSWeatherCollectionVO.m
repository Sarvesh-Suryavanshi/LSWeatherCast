//
//  LSWeatherCollectionVO.m
//  LSWeatherCast
//
//  Created by Sarvesh Suryavanshi on 02/10/15.
//  Copyright © 2015 Sarvesh Suryavanshi. All rights reserved.
//

#import "LSWeatherCollectionVO.h"
#import "LSWeatherVO.h"

NSString const * LSWeatherCityKey = @"city";
NSString const * LSWeatherCoordinateKey = @"coord";
NSString const * LSWeatherLatitudeKey = @"lat";
NSString const * LSWeatherLongitudeKey = @"lon";
NSString const * LSWeatherCityNameKey = @"name";
NSString const * LSWeatherCountKey = @"cnt";
NSString const * LSWeatherMessageCodeKey = @"cod";
NSString const * LSWeatherListKey = @"list";

/*
 
 city =     {
 coord =         {
 lat = "55.75222";
 lon = "37.615555";
 };
 country = RU;
 id = 524901;
 name = Moscow;
 population = 0;
 };
 cnt = 14;
 cod = 200;
 list =     (
 {
 } )
 */

@interface LSWeatherCollectionVO ()
{
    NSMutableArray *_collectionItems;
    NSString *_name;
    NSString *_latitude;
    NSString *_longitude;
    NSString *_count;
}
@end

@implementation LSWeatherCollectionVO

#pragma mark - LSResponseVO Delegate Method

- (BOOL)processResponseData:(NSData *)data;
{
    if (data)
    {
        NSError *error;
        id response = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
        if (response && [response isKindOfClass:[NSDictionary class]])
        {
            return [self processDictionary:(NSDictionary *)response];
        }
    }
    return NO;
}

- (instancetype)initWithLSWeatherCollectionVO:(LSWeatherCollectionVO *)_weatherCollectionVO
{
    self = [super init];
    if (self)
    {
        _collectionItems = [[NSMutableArray alloc] initWithArray:[_weatherCollectionVO getCollectionItems]];
        _name = [[NSString alloc] initWithString:[_weatherCollectionVO getName]];
        _longitude = [_weatherCollectionVO getLongitude];
        _latitude = [_weatherCollectionVO getLatitude];
        _count = [_weatherCollectionVO getCount];
    }
    
    return self;
}


#pragma mark - Helper Method

- (BOOL)processDictionary:(NSDictionary *)dictionary
{
    if (dictionary && [[dictionary valueForKey:(NSString *)LSWeatherMessageCodeKey] intValue]==200)
    {
        _collectionItems = [[NSMutableArray alloc] init];
        
        NSDictionary *cityData = [dictionary valueForKey:(NSString *)LSWeatherCityKey];
        NSDictionary *coordinate = [cityData valueForKey:(NSString *)LSWeatherCoordinateKey];
        _latitude = [coordinate valueForKey:(NSString *)LSWeatherLatitudeKey];
        _longitude = [coordinate valueForKey:(NSString *)LSWeatherLongitudeKey];
        _name = [cityData valueForKey:(NSString *)LSWeatherCityNameKey];
        _count = [dictionary valueForKey:(NSString *)LSWeatherCountKey];
        NSArray *list = [dictionary valueForKey:(NSString *)LSWeatherListKey];
        for (NSDictionary *data in list)
        {
            LSWeatherVO *item = [[LSWeatherVO alloc] initWithDictionary:data];
            [_collectionItems addObject:item];
        }
        
        return YES;
    }
    
    return NO;
}

NSMutableArray *_collectionItems;
NSString *_name;
NSString *_latitude;
NSString *_longitude;
NSString *_count;

#pragma mark - Getter Methods

- (NSArray *)getCollectionItems
{
    return _collectionItems;
}

- (NSString *)getName
{
    return _name;
}

- (NSString *)getLatitude
{
    return _latitude;
}

- (NSString *)getLongitude
{
    return _longitude;
}

- (NSString *)getCount
{
    return _count;
}



@end
