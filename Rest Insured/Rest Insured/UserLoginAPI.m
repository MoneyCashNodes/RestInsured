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
    
    NSURL *url = [NSURL URLWithString:@"https://rest-insured-staging.herokuapp.com/api/signin"];
    
    NSError *error;
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request setHTTPMethod:@"GET"];
    
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    NSDictionary *signinUser = @{@"email": email, @"password": password};
    
    NSData *getData = [NSJSONSerialization dataWithJSONObject:signinUser options:0 error:&error];
    
    [request setHTTPBody:getData];
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration ephemeralSessionConfiguration]];
    
    [[session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSString *rootObject = [[NSString alloc] initWithData:data encoding:kCFStringEncodingUTF8];
        
        NSLog(@"RESPONSE: %@", response);
        if (error) {
            NSLog(@"%@", error.localizedDescription);
        }
        NSLog(@"%@", rootObject);
    }] resume];
    
}

@end
