//
//  LSMainTableView.m
//  LSWeatherCast
//
//  Created by Sarvesh Suryavanshi on 02/10/15.
//  Copyright (c) 2015 Sarvesh Suryavanshi. All rights reserved.
//

#import "LSMainTableView.h"
#import "LSTableViewCell.h"

NSString const * LSTableViewCellIdentifier  =   @"LSTableViewCell";

@interface LSMainTableView () <UITableViewDataSource,UITableViewDelegate,LSTableViewCellDelegate>
{
    __weak IBOutlet UITableView *_commonTableView;
    NSMutableArray *_data;
    __weak id<LSMainTableViewDelegate> _delegate;

}
@end

@implementation LSMainTableView

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        [self updateView];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        [self updateView];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        [self updateView];
    }
    return self;
}

- (void)updateView
{
    [self setBackgroundColor:[UIColor whiteColor]];
     _data = [[NSMutableArray alloc] init];
    
      [_commonTableView registerNib:[UINib nibWithNibName:(NSString *)LSTableViewCellIdentifier bundle:[NSBundle mainBundle]] forCellReuseIdentifier:(NSString *)LSTableViewCellIdentifier];
      _commonTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
 
    /*
    [_commonTableView registerNib:[UINib nibWithNibName:(NSString *)LSTableViewCellIdentifier bundle:[NSBundle mainBundle]] forCellReuseIdentifier:(NSString *)LSTableViewCellIdentifier];
    
    
    //Creating Temporary Data Structure  => DATA
    
    _dataArray = @[
                   
                   @{ HBSectionDataKey:@[
                              @{HBProductNameKey:@"1"},
                              @{HBProductNameKey:@"2"},
                              @{HBProductNameKey:@"3"},
                              @{HBProductNameKey:@"4"},
                              @{HBProductNameKey:@"5"},
                              @{HBProductNameKey:@"6"},
                              @{HBProductNameKey:@"7"},
                              @{HBProductNameKey:@"8"},
                              @{HBProductNameKey:@"9"},
                              @{HBProductNameKey:@"10"},
                              ]},
                   @{ HBSectionDataKey:@[
                              @{HBProductNameKey:@"A"},
                              @{HBProductNameKey:@"B"},
                              @{HBProductNameKey:@"C"},
                              @{HBProductNameKey:@"D"},
                              @{HBProductNameKey:@"E"},
                              @{HBProductNameKey:@"F"},
                              @{HBProductNameKey:@"G"},
                              @{HBProductNameKey:@"H"},
                              @{HBProductNameKey:@"I"},
                              @{HBProductNameKey:@"J"},
                              @{HBProductNameKey:@"K"},
                              ]},
                   @{ HBSectionDataKey:@[
                              @{HBProductNameKey:@"111"},
                              @{HBProductNameKey:@"222"},
                              @{HBProductNameKey:@"333"},
                              @{HBProductNameKey:@"444"},
                              @{HBProductNameKey:@"555"},
                              @{HBProductNameKey:@"666"},
                              @{HBProductNameKey:@"777"},
                              @{HBProductNameKey:@"888"},
                              @{HBProductNameKey:@"999"},
                              @{HBProductNameKey:@"1000"},
                              ]},
                   @{ HBSectionDataKey:@[
                              @{HBProductNameKey:@"ABC"},
                              @{HBProductNameKey:@"PQR"},
                              @{HBProductNameKey:@"QWE"},
                              @{HBProductNameKey:@"FFS"},
                              @{HBProductNameKey:@"SDG"},
                              @{HBProductNameKey:@"SDF"},
                              @{HBProductNameKey:@"RWE"},
                              @{HBProductNameKey:@"GDS"},
                              @{HBProductNameKey:@"HSR"},
                              @{HBProductNameKey:@"UGD"},
                              @{HBProductNameKey:@"ERY"},
                              ]},
                   @{ HBSectionDataKey:@[
                              @{HBProductNameKey:@"ABC"},
                              @{HBProductNameKey:@"PQR"},
                              @{HBProductNameKey:@"QWE"},
                              @{HBProductNameKey:@"FFS"},
                              @{HBProductNameKey:@"SDG"},
                              @{HBProductNameKey:@"SDF"},
                              @{HBProductNameKey:@"RWE"},
                              @{HBProductNameKey:@"GDS"},
                              @{HBProductNameKey:@"HSR"},
                              @{HBProductNameKey:@"UGD"},
                              @{HBProductNameKey:@"ERY"},
                              ]},
                   ];
    */
    
}


- (void)setData:(NSMutableArray *)data
{
    _data = data;
    [_commonTableView reloadData];
}

- (void)setDelegate:(__weak id<LSMainTableViewDelegate>)delegate
{
    _delegate = delegate;
}

#pragma mark - TableView DataSource Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return _data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    LSTableViewCell *cell = (LSTableViewCell *)[tableView dequeueReusableCellWithIdentifier:(NSString *)LSTableViewCellIdentifier forIndexPath:indexPath];
    [cell setDelegate:self];
    [cell setDataDictionary:[_data objectAtIndex:indexPath.row]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 216.0f;
}

#pragma mark - LSTableViewCellDelegate Method

- (void)didSelectItem:(LSWeatherVO *)weatherVO withSectionTitle:(NSString *)title  andWeatherCollectonItem:(LSWeatherCollectionVO *)item
{
    if (_delegate && [_delegate respondsToSelector:@selector(didSelectItem: withSectionTitle: andWeatherCollectonItem:)])
    {
        [_delegate didSelectItem:weatherVO withSectionTitle:title andWeatherCollectonItem:item];
    }
}

@end
