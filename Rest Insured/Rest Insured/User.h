//
//  User.h
//  Rest Insured
//
//  Created by David Porter on 5/16/17.
//  Copyright © 2017 Brandon Little. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property(strong, nonatomic)NSString *fullName;
@property(strong, nonatomic)NSString *email;
@property(strong, nonatomic)NSString *providerID;
@property(strong, nonatomic)NSString *userID;

@end
