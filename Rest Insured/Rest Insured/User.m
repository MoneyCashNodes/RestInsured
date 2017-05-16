//
//  User.m
//  Rest Insured
//
//  Created by David Porter on 5/16/17.
//  Copyright © 2017 Brandon Little. All rights reserved.
//

#import "User.h"


@interface User ()

@property(strong, nonatomic)NSString *fullName;
@property(strong, nonatomic)NSString *email;
@property(strong, nonatomic)NSString *providerName;
@property(strong, nonatomic)NSString *providerID;


@end

@implementation User

-(instancetype)initWithName:(NSString *) fullName email:(NSString *) email providerName:(NSString *) providerName providerID:(NSString *) providerID {
    
    self.fullName = fullName;
    self.email = email;
    self.providerName = providerName;
    self.providerID = providerID;
    
    return self;
    
}

@end
