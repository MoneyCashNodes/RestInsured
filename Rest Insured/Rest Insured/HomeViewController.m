//
//  HomeViewController.m
//  Rest Insured
//
//  Created by Luay Younus on 5/15/17.
//  Copyright © 2017 Brandon Little. All rights reserved.
//

#import "HomeViewController.h"
#import "LoginViewController.h"
#import "User.h"
#import "RestInsuredAPI.h"

@import MapKit;
@import CoreLocation;

@interface HomeViewController ()

@property (weak, nonatomic) IBOutlet UILabel *welcomeLabel;
@property (weak, nonatomic) IBOutlet UITextField *locationTextField;
@property (weak, nonatomic) IBOutlet UIButton *getCurrentLocationButton;

@property (strong, nonatomic) User *currentUser;
@property (strong, nonatomic) NSArray<Practice *> *practices;

@property (strong, nonatomic) CLLocationManager *locationManager;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.locationManager = [[CLLocationManager alloc] init];
    
    self.locationManager.distanceFilter = kCLDistanceFilterNone;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters;
    [self.locationManager startUpdatingLocation];
    
    [self.locationManager requestAlwaysAuthorization];
}

-(void)viewDidAppear:(BOOL)animated{
//    [self checkCurrentUser];
}

//Check for currentUser, push to LoginViewController if nil
- (void)checkCurrentUser{
    if (!self.currentUser) {
        LoginViewController *loginVC = [self.storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
        [self presentViewController:loginVC animated:YES completion:nil];
    } else {
        [self setupServer];
    }
}

- (void)setupServer{
    
}


- (IBAction)findButtonPressed:(id)sender {
    //only temporary, not for final version
    NSString *tempString = @"regenceblueshieldofwashinton-regencewapreferredprovidernetwork";
    
    NSString *lat = [NSString stringWithFormat:@"%f", self.locationManager.location.coordinate.latitude];
    NSString *lon = [NSString stringWithFormat:@"%f", self.locationManager.location.coordinate.longitude];
    
    NSLog(@"Lat: %@, Lon: %@", lat, lon);
    
    [RestInsuredAPI practiceSearchWithLat:lat lon:lon providerID:tempString andCompletion:^(NSArray<Practice *> *allPractices) {
        self.practices = allPractices;
    }];
    
}

@end
