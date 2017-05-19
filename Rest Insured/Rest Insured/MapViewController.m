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

@interface MapViewController ()<MKMapViewDelegate, CLLocationManagerDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end

@implementation MapViewController

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self getPracticeLocation];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.mapView.delegate = self;
}

-(void)getPracticeLocation{
    long double latValue = [self.lat doubleValue];
    long double lonValue = [self.lon doubleValue];
    CLLocationCoordinate2D practiceCoordinate = CLLocationCoordinate2DMake(latValue, lonValue);
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(practiceCoordinate, 200.0, 200.0);
    MKPointAnnotation *pinPointOfPractice = [[MKPointAnnotation alloc]init];
    pinPointOfPractice.coordinate = practiceCoordinate;
    
    pinPointOfPractice.title = self.practiceName;
    
    [self.mapView addAnnotation:pinPointOfPractice];
    [self.mapView setRegion:region animated:YES];
}

-(void)locationControllerUpdatedLocation:(CLLocation *)location{
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(location.coordinate, 500.0, 500.0);
    [self.mapView setRegion:region animated:YES];
}
- (IBAction)dismissMapViewController:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    MKPinAnnotationView *pin = [[MKPinAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:nil];
    
    pin.enabled = YES;
    pin.canShowCallout = YES;
    
    return pin;
}

- (IBAction)directionsButtonPressed:(UIButton *)sender {
    long double latValue = [self.lat doubleValue];
    long double lonValue = [self.lon doubleValue];
    CLLocationCoordinate2D practiceCoordinate = CLLocationCoordinate2DMake(latValue, lonValue);
    
    UIAlertAction *googleMaps;
    UIAlertAction *appleMaps;
    UIAlertAction *cancel;
    
    appleMaps =[UIAlertAction actionWithTitle:@"Maps" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (action) {
            
            MKPlacemark *place = [[MKPlacemark alloc]initWithCoordinate:practiceCoordinate];
            MKMapItem *destination = [[MKMapItem alloc]initWithPlacemark:place];
            destination.name = self.practiceName;
            NSArray *items = [[NSArray alloc]initWithObjects:destination, nil];
            NSDictionary *options = [[NSDictionary alloc]initWithObjectsAndKeys:MKLaunchOptionsDirectionsModeDriving, MKLaunchOptionsDirectionsModeKey, nil];
            [MKMapItem openMapsWithItems:items launchOptions:options];
        }
    }];
    
    googleMaps = [UIAlertAction actionWithTitle:@"Google Maps" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (action) {
            NSString *queryString = [NSString stringWithFormat:@"comgooglemaps://?saddr=%f,%f&daddr=%f,%f", self.mapView.userLocation.coordinate.latitude, self.mapView.userLocation.coordinate.longitude, practiceCoordinate.latitude, practiceCoordinate.longitude];
            NSURL *url = [NSURL URLWithString:queryString];
            [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
        }
    }];
    
    cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDestructive handler:nil];
    
    UIAlertController *alertView = [UIAlertController alertControllerWithTitle:@"alert" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    alertView.modalPresentationStyle = UIModalPresentationPopover;
    
    [alertView addAction:appleMaps];
    
    if ([[UIApplication sharedApplication] canOpenURL:
         [NSURL URLWithString:@"comgooglemaps://"]]) {
        [alertView addAction:googleMaps];
    }
    
    [alertView addAction:cancel];
    
    [self presentViewController:alertView animated:YES completion:nil];
}

@end
