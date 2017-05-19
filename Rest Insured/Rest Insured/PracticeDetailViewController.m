//
//  PracticeDetailViewController.m
//  Rest Insured
//
//  Created by David Porter on 5/15/17.
//  Copyright © 2017 Brandon Little. All rights reserved.
//

#import "PracticeDetailViewController.h"
#import "DoctorDetailViewController.h"
#import "MapViewController.h"

@interface PracticeDetailViewController () <UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UILabel *practiceNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *practiceLocationLabel;
@property (weak, nonatomic) IBOutlet UILabel *practicePhoneLabel;
@property (weak, nonatomic) IBOutlet UITableView *doctorsTableView;

@end

@implementation PracticeDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.doctorsTableView.dataSource = self;
    
    self.practiceNameLabel.text = self.currentPractice.practiceName;
    self.practiceLocationLabel.text = [NSString stringWithFormat:@"%@, %@ %@", self.currentPractice.street, self.currentPractice.state, self.currentPractice.zip];
    self.practicePhoneLabel.text = [NSString stringWithFormat:@"Phone: %@", self.currentPractice.phone];
    
}


-(void)locationControllerUpdatedLocation:(CLLocation *)location{
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = self.currentPractice.doctors[0].doctorName;
    cell.detailTextLabel.text = self.currentPractice.doctors[0].specialty;
    return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    MapViewController *destinationVC = [segue destinationViewController];
    destinationVC.lat = self.currentPractice.latitude;
    destinationVC.lon = self.currentPractice.longitude;
    
}

- (IBAction)showMapPressed:(UIButton *)sender {
    [self performSegueWithIdentifier:@"MapViewController" sender:self];
}


@end
