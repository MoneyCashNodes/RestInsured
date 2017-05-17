//
//  User.m
//  Rest Insured
//
//  Created by David Porter on 5/16/17.
//  Copyright © 2017 Brandon Little. All rights reserved.
//

#import "User.h"

@implementation User

-(instancetype)initWithName:(NSString *) fullName email:(NSString *) email providerName:(NSString *) providerName providerID:(NSString *) providerID userID:(NSString *) userID {
    
    self.fullName = fullName;
    self.email = email;
    self.providerName = providerName;
    self.providerID = providerID;
    self.userID = userID;
    
    return self;
    
}

@end
