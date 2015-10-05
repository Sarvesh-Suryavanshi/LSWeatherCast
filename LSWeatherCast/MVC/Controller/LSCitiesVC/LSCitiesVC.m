//
//  LSCitiesVC.m
//  LSWeatherCast
//
//  Created by Sarvesh Suryavanshi on 02/10/15.
//  Copyright © 2015 Sarvesh Suryavanshi. All rights reserved.
//

#import "LSCitiesVC.h"
#import "LSSelectionTableViewCell.h"
#import "LSTopBarView.h"
#import "LSWebServiceManager.h"
#import "LSWebServiceHelper.h"
#import "LSMainVC.h"
#import "LSIconManager.h"


NSString const *SCREENTITLE = @"Pick your Regions";
NSInteger const LSCitiesRowHeight = 72.0f;

@interface LSCitiesVC () <LSWebServiceResponseDelegate, LSTopBarDelegate>
{
    __weak IBOutlet UITableView *_tableView;
    __weak IBOutlet LSTopBarView *_topBarView;
    NSString *_geoID;
    NSArray *_contentArray;
    NSMutableArray *_iconArray;
    NSMutableArray *_selectedLocations;
}
@end

@implementation LSCitiesVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self updateView];
    [self setupTableView];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Setter Methods

- (void)setSelectedGeoID:(NSString *)geoID
{
    _geoID = geoID;
}

#pragma mark - Helper Methods

- (void)updateView
{
    [self.navigationController setNavigationBarHidden:YES];
    [_topBarView setTitle:(NSString *)SCREENTITLE];
    [_topBarView setDelegate:self];
    [_topBarView setBackButotnHidden:YES];
    _selectedLocations = [[NSMutableArray alloc] init];
    [_topBarView setBackgroundColor:[[LSIconManager sharedInstance] getTopBarColour]];
    
    /*Static Data*/
    /* Use of this type of static data is not prefered at all. I am using this static data to save time and testing*/
    _iconArray = [[NSMutableArray alloc] init];
    _contentArray = [[NSArray alloc] initWithObjects:@"Mumbai",
    @"Delhi",@"Bangalore",@"Hyderabad",@"Ahmedabad",@"Chennai",@"Kolkata",
    @"Surat",@"Pune",@"Jaipur",@"Lucknow",@"Kanpur",@"Nagpur",@"Indore",
    @"Thane",@"Bhopal",@"Visakhapatnam",@"Pimpri",@"Chinchwad",@"Patna",
    @"Vadodara",@"Ghaziabad", @"Ludhiana",@"Agra",@"Nashik",@"Faridabad",
    @"Meerut",@"Rajkot",@"Kalyan",@"Dombivali",@"Varanasi",
    @"Srinagar",@"Aurangabad",@"Dhanbad",@"Amritsar",@"Navi Mumbai",
    @"Allahabad",@"Ranchi",@"Haora",@"Coimbatore",@"Jabalpur",@"Gwalior",
    @"Vijayawada",@"Jodhpur",@"Madurai",@"Raipur",@"Kota",@"Guwahati",
    @"Chandigarh",@"Solapur",@"Hubli and Dharwad",@"Bareilly",@"Moradabad",
    @"Mysore",@"Gurgaon",@"Aligarh",@"Jalandhar",@"Tiruchirappalli",@"Bhubaneswar",
    @"Salem",@"Mira and Bhayander",@"Thiruvananthapuram",@"Bhiwandi",@"Saharanpur",
    @"Gorakhpur",@"Guntur",@"Bikaner",@"Amravati",@"Noida",@"Jamshedpur",@"Durgapur",
    @"Asansol",@"Kolapur",@"Ajmer",@"Gulbarga",@"Jamnagar",@"Ujjain",
    @"Loni",@"Siliguri",@"Jhansi",@"Ulhasnagar",@"Nellore",@"Jammu",
    @"Belgaum",@"Mangalore",@"Ambattur",@"Tirunelveli",@"Malegoan",@"Gaya",@"Jalgaon",
    @"Udaipur",nil];
    
    for (__unused id demo in _contentArray)
    {
        [_iconArray addObject:[[LSIconManager sharedInstance] getCityIcon]];
    }
}

- (void)setupTableView
{
    [_tableView registerNib:[UINib nibWithNibName:NSStringFromClass([LSSelectionTableViewCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass([LSSelectionTableViewCell class])];
    _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
}

#pragma mark - TopBarDelegate Methods

- (void)backAction
{}

- (void)doneAction
{
    if (_selectedLocations && _selectedLocations.count>0)
    {
        LSMainVC *mainVC = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:NSStringFromClass([LSMainVC class])];
        [mainVC setSelectedLocations:_selectedLocations];
        [self.navigationController pushViewController:mainVC animated:YES];
    }
}

#pragma mark - TableViewDelegateMethods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_contentArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LSSelectionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([LSSelectionTableViewCell class]) forIndexPath:indexPath];
    [cell setSelectedArray:_selectedLocations];
    [cell setItem:[_contentArray objectAtIndex:indexPath.row] andIcon:[_iconArray objectAtIndex:indexPath.row]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return LSCitiesRowHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cityName = [_contentArray objectAtIndex:indexPath.row];

    if (_selectedLocations)
    {
        BOOL state = NO;
        for (NSString *city in _selectedLocations)
        {
          if ([city isEqualToString:cityName])
          {
              state = YES;
              [_selectedLocations removeObject:city];
                 [tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryNone;
              break;
          }
        }
        
        if (!state)
        {
            [_selectedLocations addObject:cityName];
             [tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryCheckmark;
        }
    }
}

#pragma mark - LSWebServiceManager Delegate

- (void)onWebServiceSuccessResponse:(__weak id<LSResponseVODelegate>)responseVO
{}

- (void)onWebServiceFailureResponse:(__weak id<LSResponseVODelegate>)responseVO
{}

@end
