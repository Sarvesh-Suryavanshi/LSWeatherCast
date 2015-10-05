//
//  ViewController.m
//  LSWeatherCast
//
//  Created by Sarvesh Suryavanshi on 30/09/15.
//  Copyright © 2015 Sarvesh Suryavanshi. All rights reserved.
//

#import "ViewController.h"
#import "LSWebServiceManager.h"
@interface ViewController () <LSResponseVODelegate, LSWebServiceResponseDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [[LSWebServiceManager sharedInstance] callWebServicePostWithParameter:nil apiURL:nil responseVO:self andListener:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)processResponseData:(NSData *)data
{
    return YES;
}


- (void)onWebServiceFailureResponse:(__weak id<LSResponseVODelegate>)responseVO
{
    
}

- (void)onWebServiceSuccessResponse:(__weak id<LSResponseVODelegate>)responseVO
{
    
}

@end
