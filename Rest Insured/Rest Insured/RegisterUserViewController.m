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
    
    
    [self dismissViewControllerAnimated:YES completion:nil];
    [self.presentingViewController.presentingViewController dismissViewControllerAnimated:nil completion:nil];
}


@end
