//
//  LSMainVC.m
//  LSWeatherCast
//
//  Created by Sarvesh Suryavanshi on 03/10/15.
//  Copyright © 2015 Sarvesh Suryavanshi. All rights reserved.
//

#import "LSMainVC.h"
#import "LSWeatherCollectionVO.h"
#import "LSWebServiceManager.h"
#import "LSWebServiceHelper.h"
#import "LSMainTableView.h"
#import "LSTopBarView.h"
#import "LSDetailVC.h"
#import "LSIconManager.h"

@interface LSMainVC () <LSWebServiceResponseDelegate,LSMainTableViewDelegate, LSTopBarDelegate>
{
    NSArray *_selectedArray;
    __weak IBOutlet LSMainTableView *_commonTableView;
    __weak IBOutlet LSTopBarView *_topBarView;
    NSMutableArray *_contentArray;
}
@end

@implementation LSMainVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    [_topBarView setBackgroundColor:[[LSIconManager sharedInstance] getTopBarColour]];
    [_commonTableView setDelegate:self];
    [_topBarView setTitle:@"WeatherCast"];
    [_topBarView setDoneButotnHidden:YES];
    [_topBarView setDelegate:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)callWeatherWebService
{
    if (!_contentArray)
    {
        _contentArray = [[NSMutableArray alloc] init];
    }

    for (NSString *item in _selectedArray)
    {
        LSWeatherCollectionVO *_weatherVO = [[LSWeatherCollectionVO alloc] init];
        NSString *apiURL = [[LSWebServiceHelper sharedInstance] getAPIForCity:item forNumberOfDays:@"14"];
        [[LSWebServiceManager sharedInstance] callWebServiceGetWithApiURL:apiURL responseVO:_weatherVO andListener:self];
    }
}

- (void)setSelectedLocations:(NSArray *)selectedArray;
{
    _selectedArray = selectedArray;
    [self callWeatherWebService];
}


#pragma mark - LSMainTableViewDelegate Methods

- (void)didSelectItem:(LSWeatherVO *)weatherVO withSectionTitle:(NSString *)title andWeatherCollectonItem:(LSWeatherCollectionVO *)item
{
    LSDetailVC *detailView = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:NSStringFromClass([LSDetailVC class])];
    [self presentViewController:detailView animated:YES completion:nil];
    [detailView setData:weatherVO withTitle:title andWeatherCollectonItem:item];
}

#pragma mark - LSWebServiceManager Delegate

- (void)onWebServiceSuccessResponse:(__weak id<LSResponseVODelegate>)responseVO
{
    if ([responseVO isKindOfClass:[LSWeatherCollectionVO class]])
    {        
        LSWeatherCollectionVO *responseObject =  [[LSWeatherCollectionVO alloc] initWithLSWeatherCollectionVO:(LSWeatherCollectionVO *)responseVO];
        if (responseObject)
        {
            [_contentArray insertObject:responseObject atIndex:[_contentArray count]];
            if (_contentArray && _contentArray.count>0)
            {
                [_commonTableView setData:_contentArray];
            }
        }
    }
}

- (void)onWebServiceFailureResponse:(__weak id<LSResponseVODelegate>)responseVO
{}

#pragma mark - LSTopBarDelegate Method

- (void)backAction
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)doneAction
{}

@end
