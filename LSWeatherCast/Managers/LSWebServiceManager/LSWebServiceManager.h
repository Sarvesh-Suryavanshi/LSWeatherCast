//
//  LSWebServiceManager.h
//  LSWeatherCast
//
//  Created by Sarvesh Suryavanshi on 01/10/15.
//  Copyright © 2015 Sarvesh Suryavanshi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LSResponseVODelegate.h"

@protocol LSWebServiceResponseDelegate <NSObject>
@required
- (void)onWebServiceSuccessResponse:(__weak id <LSResponseVODelegate>) responseVO;
- (void)onWebServiceFailureResponse:(__weak id <LSResponseVODelegate>) responseVO;
@end

@interface LSWebServiceManager : NSObject
+ (instancetype)sharedInstance;
- (void)callWebServiceGetWithApiURL:(NSString *)apiURL responseVO:(id <LSResponseVODelegate>)responseVO andListener:(id <LSWebServiceResponseDelegate>)listener;

  /*To Be Implemented*/
- (void)callWebServicePostWithParameter:(NSDictionary *)parameters apiURL:(NSString *)apiURL responseVO:(id <LSResponseVODelegate>)responseVO andListener:(id <LSWebServiceResponseDelegate>)listener;
- (void)callWebServicePostWithoutParameter:(NSDictionary *)parameters apiURL:(NSString *)apiURL responseVO:(id <LSResponseVODelegate>)responseVO andListener:(id <LSWebServiceResponseDelegate>)listener;


@end
