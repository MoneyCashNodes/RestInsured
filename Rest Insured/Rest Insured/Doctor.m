//
//  Doctor.m
//  Rest Insured
//
//  Created by Brandon Little on 5/16/17.
//  Copyright © 2017 Brandon Little. All rights reserved.
//

#import "Doctor.h"

@implementation Doctor

- (void)initWithName:(NSString *)name
        andSpecialty:(NSString *)specialty{
    
    self.doctorName = name;
    self.specialty = specialty;
    
}

@end
