//
//  LSWeatherCollectionVO.h
//  LSWeatherCast
//
//  Created by Sarvesh Suryavanshi on 02/10/15.
//  Copyright © 2015 Sarvesh Suryavanshi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LSResponseVODelegate.h"

@interface LSWeatherCollectionVO : NSObject <LSResponseVODelegate>
- (instancetype)initWithLSWeatherCollectionVO:(LSWeatherCollectionVO *)_weatherCollectionVO;
- (NSArray *)getCollectionItems;
- (NSString *)getName;
- (NSString *)getLatitude;
- (NSString *)getLongitude;
- (NSString *)getCount;
@end
