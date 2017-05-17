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

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)viewDidAppear:(BOOL)animated{
    [self checkCurrentUser];
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
    
    [RestInsuredAPI practiceSearchWithLat:@"47.637" lon:@"-122.335" providerID:tempString andCompletion:^(NSArray<Practice *> *allPractices) {
        self.practices = allPractices;
    }];
    
}

@end
