//
//  MapViewController.m
//  Rest Insured
//
//  Created by Luay Younus on 5/16/17.
//  Copyright © 2017 Brandon Little. All rights reserved.
//

#import "MapViewController.h"
#import "DoctorDetailViewController.h"

@import MapKit;

@interface MapViewController ()<MKMapViewDelegate,CLLocationManagerDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.mapView.delegate = self;
    self.mapView.showsUserLocation = YES;
    
    [self getPracticeLocation];
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    self.mapView.showsUserLocation = YES;
}

-(void)getPracticeLocation{
    CLLocationCoordinate2D practiceCoordinate = CLLocationCoordinate2DMake(0,0);
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(practiceCoordinate, 200.0, 200.0);
    [self.mapView setRegion:region animated:YES];
    
    MKPointAnnotation *pinPointOfPractice = [[MKPointAnnotation alloc]init];
    
    pinPointOfPractice.coordinate = practiceCoordinate;
}

-(void)locationControllerUpdatedLocation:(CLLocation *)location{
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(location.coordinate, 500.0, 500.0);
    [self.mapView setRegion:region animated:YES];
}

@end
