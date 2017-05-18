//
//  LoginViewController.m
//  Rest Insured
//
//  Created by Brandon Little on 5/15/17.
//  Copyright © 2017 Brandon Little. All rights reserved.
//

#import "LoginViewController.h"

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
    NSString *emailAddress = [[NSUserDefaults standardUserDefaults] stringForKey:@"emailAddress"];
    NSString *password = [[NSUserDefaults standardUserDefaults] stringForKey:@"password"];
    
    if (self.loginEmailAddress.text == emailAddress && self.loginPassword.text == password) {
        [[NSUserDefaults standardUserDefaults] setBool: YES forKey: @"kUserLoggedIn"];
        [self dismissViewControllerAnimated:YES completion:nil];
    } else {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Email or Password incorrect" message:@"Please try again" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *okButton = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:okButton];
    }
}


@end
