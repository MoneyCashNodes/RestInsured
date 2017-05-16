//
//  ProfileViewController.m
//  Rest Insured
//
//  Created by Luay Younus on 5/16/17.
//  Copyright © 2017 Brandon Little. All rights reserved.
//

#import "ProfileViewController.h"
#import "LoginViewController.h"

@interface ProfileViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *profileImage;
@property (weak, nonatomic) IBOutlet UILabel *userFullName;
@property (weak, nonatomic) IBOutlet UILabel *userLocation;
@property (weak, nonatomic) IBOutlet UILabel *userInsurance;
@property (weak, nonatomic) IBOutlet UILabel *userEmailAddress;

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)dismissController:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)logoutUser:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    LoginViewController *loginVC = [self.storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
    [self presentViewController:loginVC animated:YES completion:nil];
}

@end
