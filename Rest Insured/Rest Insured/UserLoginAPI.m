//
//  UserLoginAPI.m
//  Rest Insured
//
//  Created by David Porter on 5/17/17.
//  Copyright © 2017 Brandon Little. All rights reserved.
//

#import "UserLoginAPI.h"
#import "AppDelegate.h"

@implementation UserLoginAPI

+(void)userLoginWithEmail:(NSString *)email
                 password:(NSString *)password {
    
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    NSURL *url = [NSURL URLWithString:@"https://rest-insured-staging.herokuapp.com/api/signin"];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request setHTTPMethod:@"GET"];
    
    NSString *authStr = [NSString stringWithFormat:@"%@:%@", email, password];
    NSData *authData = [authStr dataUsingEncoding:kCFStringEncodingUTF8];
    NSString *authValue = [NSString stringWithFormat:@"Basic %@", [authData base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength]];
    
    [request addValue:authValue forHTTPHeaderField:@"Authorization"];
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration ephemeralSessionConfiguration]];
    
    [[session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSString *rootObject = [[NSString alloc] initWithData:data encoding:kCFStringEncodingUTF8];
        
        rootObject = [rootObject substringWithRange:NSMakeRange(1, [rootObject length] - 2)];
        
        NSLog(@"LOGIN RESPONSE: %@", response);
        if (error) {
            NSLog(@"%@", error.localizedDescription);
        }
        NSLog(@"rootObject %@", rootObject);
        
        appDelegate.authToken = rootObject;
    }] resume];
    
}

@end
