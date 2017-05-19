//
//  RegisterUserViewController.m
//  Rest Insured
//
//  Created by Brandon Little on 5/15/17.
//  Copyright © 2017 Brandon Little. All rights reserved.
//

#import "RegisterUserViewController.h"
#import "UserSignupAPI.h"

@import SearchTextField;

@interface RegisterUserViewController ()
@property (weak, nonatomic) IBOutlet UITextField *registerFullName;
@property (weak, nonatomic) IBOutlet UITextField *registerEmailAddress;
@property (weak, nonatomic) IBOutlet UITextField *registerPassword;
@property (strong, nonatomic) User *registeredUser;
@property (weak, nonatomic) IBOutlet SearchTextField *insuranceProvider;

@property (strong, nonatomic) NSArray *providers;

@end

@implementation RegisterUserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:NO];
    
    self.registerFullName.delegate = self;
    self.registerEmailAddress.delegate = self;
    self.registerPassword.delegate = self;
    self.insuranceProvider.delegate = self;

}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}

-(void)viewDidAppear:(BOOL)animated{
    
}

- (IBAction)registerButtonPressed:(UIButton *)sender {

    [UserSignupAPI userSignUpWithFullName:self.registerFullName.text email:self.registerEmailAddress.text password:self.registerPassword.text providerID:self.insuranceProvider.text andCompletion:^(User *currentUser) {
        self.registeredUser = currentUser;
    }];
    
    [self dismissViewControllerAnimated:YES completion:nil];
    [self.presentingViewController.presentingViewController dismissViewControllerAnimated:nil completion:nil];
}


@end
