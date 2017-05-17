//
//  Practice.h
//  Rest Insured
//
//  Created by Brandon Little on 5/16/17.
//  Copyright © 2017 Brandon Little. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Doctor.h"

@interface Practice : NSObject

@property (strong, nonatomic) NSString *practiceName;
@property (strong, nonatomic) NSString *street;
@property (strong, nonatomic) NSString *state;
@property (strong, nonatomic) NSString *zip;
@property (strong, nonatomic) NSString *phone;
@property (strong, nonatomic) NSNumber *latitude;
@property (strong, nonatomic) NSNumber *longitude;
@property (strong, nonatomic) NSMutableArray<Doctor *> *doctors;

- (instancetype)initWithName:(NSString *)name
              street:(NSString *)street
               state:(NSString *)state
             zipCode:(NSString *)zip
               phone:(NSString *)phone
            latitude:(NSNumber *)latitude
           longitude:(NSNumber *)longitude;

@end
