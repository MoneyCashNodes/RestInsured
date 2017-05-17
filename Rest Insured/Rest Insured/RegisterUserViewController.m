//
//  RegisterUserViewController.m
//  Rest Insured
//
//  Created by Brandon Little on 5/15/17.
//  Copyright © 2017 Brandon Little. All rights reserved.
//

#import "RegisterUserViewController.h"

@interface RegisterUserViewController ()
@property (weak, nonatomic) IBOutlet UITextField *registerFullName;
@property (weak, nonatomic) IBOutlet UITextField *registerEmailAddress;
@property (weak, nonatomic) IBOutlet UITextField *registerPassword;
@property (weak, nonatomic) IBOutlet UITextField *insuranceProvider;

@end

@implementation RegisterUserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:NO];
}

- (IBAction)registerButtonPressed:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    [self.presentingViewController.presentingViewController dismissViewControllerAnimated:nil completion:nil];
}


@end
