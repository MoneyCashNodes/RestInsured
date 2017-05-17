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
    NSURL *url = [NSURL URLWithString:@"https://rest-insured-staging.herokuapp.com/api/signup"];
    
    NSError *error;
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
    
    [request setHTTPMethod:@"POST"];
    
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
 
    NSDictionary *createUser = @{@"fullName": fullName, @"email": email, @"password": password, @"insurance": providerID};

    NSData *postData = [NSJSONSerialization dataWithJSONObject:createUser options:0 error:&error];
    [request setHTTPBody:postData];
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration ephemeralSessionConfiguration]];
    
    [[session dataTaskWithRequest:request
            completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                
                NSString *rootObject = [[NSString alloc]initWithData:data encoding:kCFStringEncodingUTF8];
                
                NSLog(@"rootObject %@", rootObject);
            }] resume];
}

@end
