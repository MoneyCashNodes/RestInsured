//
//  Practice.m
//  Rest Insured
//
//  Created by Brandon Little on 5/16/17.
//  Copyright © 2017 Brandon Little. All rights reserved.
//

#import "Practice.h"

@implementation Practice

- (instancetype)initWithName:(NSString *)name
              street:(NSString *)street
               state:(NSString *)state
             zipCode:(NSString *)zip
               phone:(NSString *)phone
            latitude:(NSNumber *)latitude
           longitude:(NSNumber *)longitude{
    
    self.practiceName = name;
    self.street = name;
    self.state = state;
    self.zip = zip;
    self.phone = phone;
    self.latitude = latitude;
    self.longitude = longitude;
    
    self.doctors = [[NSMutableArray alloc] init];
    
    return self;
    
}

@end
