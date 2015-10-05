//
//  LSWebServiceManager.m
//  LSWeatherCast
//
//  Created by Sarvesh Suryavanshi on 01/10/15.
//  Copyright © 2015 Sarvesh Suryavanshi. All rights reserved.
//

#import "LSWebServiceManager.h"

@interface  LSWebServiceManager() <NSURLSessionDataDelegate>
{
      id<LSResponseVODelegate> _responseVODelegate;
    __weak id<LSWebServiceResponseDelegate> _webServiceDelegate;
}

@end

@implementation LSWebServiceManager

#pragma mark - Initialize

+ (instancetype)sharedInstance
{
    static LSWebServiceManager *manager = nil;
    static dispatch_once_t token;
    dispatch_once(&token, ^{
        manager = [[LSWebServiceManager alloc] init];
    });
    
    return manager;
}


#pragma mark - Assembly Methods

- (void)callWebServiceGetWithApiURL:(NSString *)apiURL responseVO:(id<LSResponseVODelegate>)responseVO andListener:(id<LSWebServiceResponseDelegate>)listener
{
    _webServiceDelegate = listener;
    _responseVODelegate = responseVO;
    
    NSURLRequest *urlRequest = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:apiURL]];
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *task = [session dataTaskWithRequest:urlRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self sendResponse:data];
        });
    }];
    [task resume];
}

- (void)callWebServicePostWithParameter:(NSDictionary *)parameters apiURL:(NSString *)apiURL responseVO:(id<LSResponseVODelegate>)responseVO andListener:(id<LSWebServiceResponseDelegate>)listener
{}

- (void)callWebServicePostWithoutParameter:(NSDictionary *)parameters apiURL:(NSString *)apiURL responseVO:(id<LSResponseVODelegate>)responseVO andListener:(id<LSWebServiceResponseDelegate>)listener
{}

#pragma mark - Helper Methods

- (void)sendResponse:(NSData *)data
{
    if (_responseVODelegate && [_responseVODelegate respondsToSelector:@selector(processResponseData:)])
    {
        BOOL success = [_responseVODelegate processResponseData:data];
        success?[self sendSuccessResponseVO:_responseVODelegate]:[self sendFailureResponseVO:_responseVODelegate];
    }
}

- (void)sendSuccessResponseVO:(__weak id<LSResponseVODelegate>)responseVO
{
    if (_webServiceDelegate && [_webServiceDelegate respondsToSelector:@selector(onWebServiceSuccessResponse:)])
    {
        [_webServiceDelegate onWebServiceSuccessResponse:responseVO];
    }
}

- (void)sendFailureResponseVO:(__weak id<LSResponseVODelegate>)responseVO
{
    if (_webServiceDelegate && [_webServiceDelegate respondsToSelector:@selector(onWebServiceFailureResponse:)])
    {
        [_webServiceDelegate onWebServiceFailureResponse:responseVO];
    }
}

@end
