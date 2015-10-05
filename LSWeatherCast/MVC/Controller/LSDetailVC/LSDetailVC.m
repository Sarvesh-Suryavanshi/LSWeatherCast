//
//  LSDetailView.m
//  LSWeatherCast
//
//  Created by Sarvesh Suryavanshi on 04/10/15.
//  Copyright © 2015 Sarvesh Suryavanshi. All rights reserved.
//

#import "LSDetailVC.h"
#import "LSTopBarView.h"
#import "LSDetailViewCell.h"
#import "LSDetailTableHeaderView.h"
#import "LSIconManager.h"

NSInteger const LSDetailRowHeight = 71.0f;

@interface LSDetailVC () <LSTopBarDelegate, UITableViewDataSource, UITableViewDelegate>
{
    __weak IBOutlet UITableView *_tableView;
    __weak IBOutlet UILabel *_iconLabel;
    __weak IBOutlet UILabel *_dateLabel;
    __weak IBOutlet UILabel *_temperatureLabel;
    __weak IBOutlet LSTopBarView *_topBarView;
    
    NSArray *_titleArray;
    NSMutableArray *_valuesArray;
    LSWeatherCollectionVO *_collectionVO;
    LSWeatherVO *_weatherVO;
    NSString *_title;
}
@end

@implementation LSDetailVC

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Helper Methods

- (void)setData:(LSWeatherVO *)weather withTitle:(NSString *)title andWeatherCollectonItem:(LSWeatherCollectionVO *)item
{
    _collectionVO = item;
    _weatherVO = weather;
    _title = title;
   
    [self updateView];
    [self constructStaticData];
    [self setupTableView];
}

- (void)updateView
{
    [_topBarView setTitle:_title];
    [_topBarView setDoneButotnHidden:YES];
    [_topBarView setBackgroundColor:[[LSIconManager sharedInstance] getTopBarColour]];
    [_topBarView setDelegate:self];
    [_iconLabel setText:[_weatherVO getWeatherIcon]];
    [_dateLabel setText:[_weatherVO getDate]];
    [_temperatureLabel setText:[_weatherVO getDayTemp]];
}

- (void)constructStaticData
{
    /*Static Data*/
    /*Use of this type of static data is not prefered at all.
     I am using this static data to save time and testing*/
    _valuesArray = [[NSMutableArray alloc] init];
    [_valuesArray addObject:[_weatherVO getMorningTemp]];
    [_valuesArray addObject:[_weatherVO getMinTemp]];
    [_valuesArray addObject:[_weatherVO getMaxTemp]];
    [_valuesArray addObject:[_weatherVO getEveningTemp]];
    [_valuesArray addObject:[_weatherVO getNightTemp]];
    [_valuesArray addObject:[_weatherVO getPreasure]];
    [_valuesArray addObject:[_weatherVO getHumidity]];
    [_valuesArray addObject:[_weatherVO getCloudPercentage]];
    
    _titleArray = @[@"Morning Temperature",@"Min Temperature",@"Max Temperature",@"Evening Temperature",@"Night Temperature",@"Preasure",@"Humidity",@"Cloud Percentage"];
}

- (void)setupTableView
{
    [_tableView registerNib:[UINib nibWithNibName:NSStringFromClass([LSDetailViewCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass([LSDetailViewCell class])];
    [_tableView setDelegate:self];
    [_tableView setDataSource:self];
    _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    [_tableView setBackgroundColor:[[LSIconManager sharedInstance] getTopBarColour]];
    
    LSDetailTableHeaderView *headerView = [self getHeaderView];
    _tableView.tableHeaderView = headerView;
    [headerView setData:_collectionVO];
    [_tableView reloadData];
}

- (LSDetailTableHeaderView *)getHeaderView
{
    LSDetailTableHeaderView *headerView = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([LSDetailTableHeaderView class]) owner:self options:nil] lastObject];
    [headerView setFrame:CGRectMake(0, 0, _tableView.bounds.size.width, 150)];
    return headerView;
}

#pragma mark - LSTopBarDelegate Method

- (void)backAction
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)doneAction{}


#pragma mark - TableViewDelegateMethods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_titleArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LSDetailViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([LSDetailViewCell class]) forIndexPath:indexPath];
    [cell setTitle:[_titleArray objectAtIndex:indexPath.row] andValue:[_valuesArray objectAtIndex:indexPath.row]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return LSDetailRowHeight;
}

@end
