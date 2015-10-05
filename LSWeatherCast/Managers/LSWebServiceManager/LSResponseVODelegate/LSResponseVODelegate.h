//
//  LSResponseVODelegate.h
//  LSWeatherCast
//
//  Created by Sarvesh Suryavanshi on 01/10/15.
//  Copyright © 2015 Sarvesh Suryavanshi. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol LSResponseVODelegate <NSObject>
@required
- (BOOL)processResponseData:(NSData *)data;
@end
