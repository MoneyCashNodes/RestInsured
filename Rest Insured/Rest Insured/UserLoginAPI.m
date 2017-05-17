//
//  UserLoginAPI.m
//  Rest Insured
//
//  Created by David Porter on 5/17/17.
//  Copyright © 2017 Brandon Little. All rights reserved.
//

#import "UserLoginAPI.h"

@implementation UserLoginAPI

+(void)userLoginWithEmail:(NSString *)email
                 password:(NSString *)password {
    
    NSString *urlString = [NSString stringWithFormat:@"https://rest-insured-staging.herokuapp.com/signin?email=%@&password=%@", email, password];
    
    NSURL *databaseURL = [NSURL URLWithString:urlString];
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration ephemeralSessionConfiguration]];
    
    [[session dataTaskWithURL:databaseURL
            completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                
                NSString *rootObject = [NSJSONSerialization JSONObjectWithData:data
                                                                      options:NSJSONReadingMutableContainers
                                                                        error:nil];
            }] resume];
    
}

@end
