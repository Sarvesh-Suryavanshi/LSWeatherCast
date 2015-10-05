//
//  LSTableViewCell.m
//  LSWeatherCast
//
//  Created by Sarvesh Suryavanshi on 02/10/15.
//  Copyright (c) 2015 Sarvesh Suryavanshi. All rights reserved.
//
#import "LSTableViewCell.h"
#import "LSCollectionViewCell.h"

const NSString * HBSectionDataKey           =   @"HBSectionDataKey";
const NSString * HBProductNameKey           =   @"HBProductNameKey";

@interface LSTableViewCell () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>
{
    __weak IBOutlet UICollectionView *_collectionView;
    NSArray *_dataCollection;
    __weak IBOutlet UILabel *_sectionTitle;
    __weak id<LSTableViewCellDelegate> _delegate;
    LSWeatherCollectionVO * _collectionItem;
}

@end

@implementation LSTableViewCell

- (void)awakeFromNib {
    // Initialization code
    _dataCollection = [[NSArray alloc] init];
    [self setSelectionStyle:UITableViewCellSelectionStyleNone];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - Setter Methods

- (void)setDataDictionary:(LSWeatherCollectionVO*)item
{
    _collectionItem = item;
    _sectionTitle.text = [item getName];
    _dataCollection = [item getCollectionItems];
    [_collectionView setDataSource:self];
    [_collectionView setDelegate:self];
    [_collectionView registerNib:[UINib nibWithNibName:@"LSCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"LSCollectionViewCell"];
    [_collectionView setBackgroundColor:[UIColor colorWithWhite:1.0f alpha:87.0f]];
}

- (void)setDelegate:(__weak id<LSTableViewCellDelegate>)delegate
{
    _delegate = delegate;
}

#pragma mark - CollectionView DataSource Method


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section;
{
    return [_dataCollection count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    LSCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"LSCollectionViewCell" forIndexPath:indexPath];
    [cell setItem:(LSWeatherVO *)[_dataCollection objectAtIndex:indexPath.row]];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (_delegate && [_delegate respondsToSelector:@selector(didSelectItem: withSectionTitle: andWeatherCollectonItem:)])
    {
        [_delegate didSelectItem:[_dataCollection objectAtIndex:indexPath.row] withSectionTitle:_sectionTitle.text andWeatherCollectonItem:_collectionItem];
    }
}

@end
