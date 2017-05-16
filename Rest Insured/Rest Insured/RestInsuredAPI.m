//
//  RestInsuredAPI.m
//  Rest Insured
//
//  Created by Brandon Little on 5/16/17.
//  Copyright © 2017 Brandon Little. All rights reserved.
//

#import "RestInsuredAPI.h"

@implementation RestInsuredAPI

+ (void)practiceSearch:(PracticeSearchCompletion)completion{
    
    NSString *urlString = [NSString stringWithFormat:@"http://localhost:3000/Providers"];
    
    NSURL *databaseURL = [NSURL URLWithString:urlString];
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration ephemeralSessionConfiguration]];
    
    [[session dataTaskWithURL:databaseURL
            completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                
                NSDictionary *rootObject = [NSJSONSerialization JSONObjectWithData:data
                                                                           options:NSJSONReadingMutableContainers
                                                                             error:nil];
                NSLog(@"ROOT OBJECT:%@", rootObject);
                
            }] resume];
}

@end
