//
//  UserSignupAPI.m
//  Rest Insured
//
//  Created by David Porter on 5/17/17.
//  Copyright © 2017 Brandon Little. All rights reserved.
//

#import "UserSignupAPI.h"

@implementation UserSignupAPI

+(void)userSignUpWithFullName:(NSString *)fullName
                        email:(NSString *)email
                     password:(NSString *)password
                   providerID:(NSString *)providerID
                andCompletion:(userSignUpCompletion)completion {
    
    NSString *urlString = [NSString stringWithFormat:@"https://rest-insured-staging.herokuapp.com/signup?fullname=%@&password=%@&insurance=%@&email%@", fullName, password, providerID, email];
    
    NSURL *databaseURL = [NSURL URLWithString:urlString];
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration ephemeralSessionConfiguration]];
    
    [[session dataTaskWithURL:databaseURL
            completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                
                NSArray *rootObject = [NSJSONSerialization JSONObjectWithData:data
                                                                      options:NSJSONReadingMutableContainers
                                                                        error:nil];
                
                NSLog(@"rootObject %@", rootObject);
            }] resume];
}

@end
