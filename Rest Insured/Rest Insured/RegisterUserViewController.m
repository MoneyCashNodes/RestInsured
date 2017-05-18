//
//  RegisterUserViewController.m
//  Rest Insured
//
//  Created by Brandon Little on 5/15/17.
//  Copyright © 2017 Brandon Little. All rights reserved.
//

#import "RegisterUserViewController.h"

@import SearchTextField;

@interface RegisterUserViewController ()
@property (weak, nonatomic) IBOutlet UITextField *registerFullName;
@property (weak, nonatomic) IBOutlet UITextField *registerEmailAddress;
@property (weak, nonatomic) IBOutlet UITextField *registerPassword;
@property (weak, nonatomic) IBOutlet SearchTextField *insuranceProvider;


@end

@implementation RegisterUserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:NO];
}

-(void)viewDidAppear:(BOOL)animated{
    
}

- (IBAction)registerButtonPressed:(UIButton *)sender {
    //Full Name
    [[NSUserDefaults standardUserDefaults] setValue:self.registerFullName.text forKey:@"fullName"];
    
    //Email Address
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailValidation = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    
    if ([emailValidation evaluateWithObject:self.registerEmailAddress]){
        [[NSUserDefaults standardUserDefaults] setValue:self.registerEmailAddress.text forKey:@"emailAddress"];
    } else {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Incorrect Email" message:@"Please enter a valid Email Address" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *okButton = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:okButton];
        [self presentViewController:alert animated:YES completion:nil];
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
    [self.presentingViewController.presentingViewController dismissViewControllerAnimated:nil completion:nil];
}


@end
