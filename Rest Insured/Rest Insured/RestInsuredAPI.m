//
//  RestInsuredAPI.m
//  Rest Insured
//
//  Created by Brandon Little on 5/16/17.
//  Copyright © 2017 Brandon Little. All rights reserved.
//

#import "RestInsuredAPI.h"

@implementation RestInsuredAPI

+ (void)practiceSearchWithLat:(NSString *)lat
                          lon:(NSString *)lon
                   providerID:(NSString *)provider
                andCompletion:(PracticeSearchCompletion)completion{
    
    NSString *urlString = [NSString stringWithFormat:@"https://rest-insured-staging.herokuapp.com/ext/doctors?lat=%@&lon=%@&range=10&insurance=%@&limit=5", lat, lon, provider];
    
    NSURL *databaseURL = [NSURL URLWithString:urlString];
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration ephemeralSessionConfiguration]];
    
    [[session dataTaskWithURL:databaseURL
            completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                
                NSArray *rootObject = [NSJSONSerialization JSONObjectWithData:data
                                                                      options:NSJSONReadingMutableContainers
                                                                        error:nil];
                
                NSMutableArray *allPractices = [[NSMutableArray alloc] init];
                
                for (NSDictionary *practice in rootObject) {
                    
                    Practice *currentPractice = [[Practice alloc] initWithName:practice[@"name"]
                                                                        street:practice[@"street"]
                                                                         state:practice[@"state"]
                                                                       zipCode:practice[@"zip"]
                                                                         phone:practice[@"phone"]
                                                                      latitude:practice[@"lat"]
                                                                     longitude:practice[@"lon"]];
                    
                    NSDictionary *doctor = practice[@"doctor"];
                    
                    NSString *doctorName = [NSString stringWithFormat:@"%@ %@", doctor[@"doctorfirstname"], doctor[@"doctorlastname"]];
                    Doctor *currentDoctor = [[Doctor alloc] initWithName:doctorName
                                                            andSpecialty:doctor[@"specialty"]];
                    
                    NSLog(@"%@", currentDoctor.doctorName);
                    
                    [currentPractice.doctors addObject:currentDoctor];
                    
                    
                    [allPractices addObject:currentPractice];
                    
                }
                
                NSLog(@"%@", allPractices);
                
            }] resume];
    
}

@end
