//
//  LocationSearchViewController.m
//  Rest Insured
//
//  Created by Brandon Little on 5/15/17.
//  Copyright © 2017 Brandon Little. All rights reserved.
//

#import "LocationSearchViewController.h"
#import "PracticeDetailViewController.h"
#import "Practice.h"

@interface LocationSearchViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *resultsTableView;

@property (strong, nonatomic) Practice *selection;


@end

@implementation LocationSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.resultsTableView.delegate = self;
    self.resultsTableView.dataSource = self;
    [self.navigationController setNavigationBarHidden:NO];
    NSLog(@"Search View: %@", self.allPractices);
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    [self.navigationController setNavigationBarHidden:NO];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.allPractices.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //incomplete code
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    Practice *practice = self.allPractices[indexPath.row];
    
    cell.textLabel.text = practice.practiceName;
    return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    PracticeDetailViewController *destinationVC = [segue destinationViewController];
    
    destinationVC.currentPractice = self.selection;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.selection = self.allPractices[indexPath.row];
    
    [self performSegueWithIdentifier:@"PracticeDetail" sender:self];
}

@end
