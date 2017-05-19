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
//    self.mapView.showsUserLocation = YES;
}

-(void)getPracticeLocation{
    long double latValue = [self.lat doubleValue];
    long double lonValue = [self.lon doubleValue];
    CLLocationCoordinate2D practiceCoordinate = CLLocationCoordinate2DMake(latValue, lonValue);
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(practiceCoordinate, 200.0, 200.0);
    MKPointAnnotation *pinPointOfPractice = [[MKPointAnnotation alloc]init];
    pinPointOfPractice.coordinate = practiceCoordinate;
    
    pinPointOfPractice.title = @"Doctors Name";
    
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
    
//    MKPinAnnotationView *annotationView = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:@"annotationView"];
    
    pin.enabled = YES;
    pin.canShowCallout = YES;
    
    return pin;
}

- (IBAction)directionsButtonPressed:(UIButton *)sender {
    
    UIAlertAction *googleMaps;
    UIAlertAction *appleMaps;
    UIAlertAction *cancel;
    
    appleMaps =[UIAlertAction actionWithTitle:@"Maps" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (action) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"Maps://?saddr=NY&daddr=John+F.+Kennedy+International+Airport,+Van+Wyck+Expressway,+Jamaica,+New+York&directionsmode=transit"] options:@{} completionHandler:nil];
        }
    }];
    
    googleMaps = [UIAlertAction actionWithTitle:@"Google Maps" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (action) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"comgooglemaps://?saddr=Google+Inc,+8th+Avenue,+New+York,+NY&daddr=John+F.+Kennedy+International+Airport,+Van+Wyck+Expressway,+Jamaica,+New+York&directionsmode=transit"] options:@{} completionHandler:nil];
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
