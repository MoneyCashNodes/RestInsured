//
//  PracticeDetailViewController.m
//  Rest Insured
//
//  Created by David Porter on 5/15/17.
//  Copyright © 2017 Brandon Little. All rights reserved.
//

#import "PracticeDetailViewController.h"

@interface PracticeDetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *practiceNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *practiceLocationLabel;
@property (weak, nonatomic) IBOutlet UILabel *practicePhoneLabel;
@property (weak, nonatomic) IBOutlet UITableView *doctorsTableView;

@end

@implementation PracticeDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)locationControllerUpdatedLocation:(CLLocation *)location{
    
}

@end
