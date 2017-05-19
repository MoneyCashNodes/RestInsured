//
//  PracticeDetailViewController.h
//  Rest Insured
//
//  Created by David Porter on 5/15/17.
//  Copyright © 2017 Brandon Little. All rights reserved.
//

#import <UIKit/UIKit.h>
@import MapKit;

#import "Practice.h"

@interface PracticeDetailViewController : UIViewController

@property (strong, nonatomic) Practice *currentPractice;

@property (strong, nonatomic) CLLocationManager *locationManager;
@property (strong, nonatomic) CLLocation *location;
-(void)locationControllerUpdatedLocation:(CLLocation *)location;


@end
