//
//  LSDetailTableHeaderView.m
//  LSWeatherCast
//
//  Created by Sarvesh Suryavanshi on 05/10/15.
//  Copyright © 2015 Sarvesh Suryavanshi. All rights reserved.
//

#import "LSDetailTableHeaderView.h"
#import <MapKit/MapKit.h>

NSInteger const ONE_MILE_IN_METERS = 1609.344;

@interface LSDetailTableHeaderView () <CLLocationManagerDelegate>
{
    __weak IBOutlet MKMapView *_mapView;
    CLLocationManager *_locationManager;
    CLLocationCoordinate2D _locationCoordinate;
    MKCoordinateRegion _mapCoordinateRegion;
}

@end

@implementation LSDetailTableHeaderView

- (instancetype)init
{
    self = [super init];
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
{}

- (void)setData:(LSWeatherCollectionVO *)weatherCollectionVO
{
    _locationManager = [[CLLocationManager alloc] init];
    [_locationManager setDelegate:self];
    [_locationManager startUpdatingLocation];
    [_locationManager requestWhenInUseAuthorization];
    _mapView.showsUserLocation = YES;
    
   _locationCoordinate.latitude = [[weatherCollectionVO getLatitude] doubleValue];
    _locationCoordinate.longitude =  [[weatherCollectionVO getLongitude] doubleValue];
    
    _mapCoordinateRegion = MKCoordinateRegionMakeWithDistance(_locationCoordinate, 0.5 * ONE_MILE_IN_METERS, 0.5 * ONE_MILE_IN_METERS);
    [_mapView setRegion:_mapCoordinateRegion animated:YES];
}

@end
