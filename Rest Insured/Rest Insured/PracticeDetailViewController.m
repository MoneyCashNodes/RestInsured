//
//  PracticeDetailViewController.m
//  Rest Insured
//
//  Created by David Porter on 5/15/17.
//  Copyright © 2017 Brandon Little. All rights reserved.
//

#import "PracticeDetailViewController.h"
#import "DoctorDetailViewController.h"

@interface PracticeDetailViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *practiceNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *practiceLocationLabel;
@property (weak, nonatomic) IBOutlet UILabel *practicePhoneLabel;
@property (weak, nonatomic) IBOutlet UITableView *doctorsTableView;

@end

@implementation PracticeDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.doctorsTableView.delegate = self;
    self.doctorsTableView.dataSource = self;
    
    NSLog(@"Yay: %@", self.currentPractice.practiceName);
    
}


-(void)locationControllerUpdatedLocation:(CLLocation *)location{
    
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
//    DoctorDetailViewController *doctorVC = [segue destinationViewController];
//    doctorVC.doctorName = @"doctor Name";
//    doctorVC.doctorSpecialty = @"Whatever";
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    //using stand-in integer until further work is done
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //incomplete code
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self performSegueWithIdentifier:@"DoctorDetailViewController" sender:self];
}

- (IBAction)showMapPressed:(UIButton *)sender {
    [self performSegueWithIdentifier:@"MapViewController" sender:self];
}


@end
