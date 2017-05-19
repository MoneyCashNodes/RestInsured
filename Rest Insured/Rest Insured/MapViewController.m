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
- (IBAction)dismissMapViewController:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)directionsButtonPressed:(UIButton *)sender {
    
    UIAlertAction *googleMaps;
    UIAlertAction *cancel;
    
    googleMaps = [UIAlertAction actionWithTitle:@"Go To Google Maps" style:UIAlertActionStyleDefault handler:nil];
    cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDestructive handler:nil];
    
    UIAlertController *alertView = [UIAlertController alertControllerWithTitle:@"alert" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    alertView.modalPresentationStyle = UIModalPresentationPopover;
    
    [alertView addAction:googleMaps];
    [alertView addAction:cancel];
    
    if ([[UIApplication sharedApplication] canOpenURL:
         [NSURL URLWithString:@"comgooglemaps://"]]) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"comgooglemaps://?saddr=Google+Inc,+8th+Avenue,+New+York,+NY&daddr=John+F.+Kennedy+International+Airport,+Van+Wyck+Expressway,+Jamaica,+New+York&directionsmode=transit"] options:@{} completionHandler:nil];
    } else {
        NSLog(@"Can't use comgooglemaps://");
    }
}

@end
