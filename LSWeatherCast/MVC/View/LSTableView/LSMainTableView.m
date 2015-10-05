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
NSInteger const LSRowHeight = 217.0f;

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

#pragma mark - Helper Methods

- (void)updateView
{
    [self setBackgroundColor:[UIColor whiteColor]];
     _data = [[NSMutableArray alloc] init];
}

- (void)setupTableView
{
    [_commonTableView registerNib:[UINib nibWithNibName:(NSString *)LSTableViewCellIdentifier bundle:[NSBundle mainBundle]] forCellReuseIdentifier:(NSString *)LSTableViewCellIdentifier];
    _commonTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
}

#pragma mark - Setter Methods

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
    return LSRowHeight;
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
