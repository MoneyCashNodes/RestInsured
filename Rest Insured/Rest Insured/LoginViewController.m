//
//  LoginViewController.m
//  Rest Insured
//
//  Created by Brandon Little on 5/15/17.
//  Copyright © 2017 Brandon Little. All rights reserved.
//

#import "LoginViewController.h"
#import "UserLoginAPI.h"

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *loginEmailAddress;
@property (weak, nonatomic) IBOutlet UITextField *loginPassword;


@end

@implementation LoginViewController

- (void)viewDidLoad {   
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES];
}
-(void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:YES];

}


- (IBAction)loginButtonPressed:(UIButton *)sender {
    [UserLoginAPI userLoginWithEmail:self.loginEmailAddress.text password:self.loginPassword.text];
    [[NSUserDefaults standardUserDefaults] setBool: YES forKey: @"kUserLoggedIn"];
}


@end
