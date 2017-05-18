//
//  UserLoginAPI.h
//  Rest Insured
//
//  Created by David Porter on 5/17/17.
//  Copyright © 2017 Brandon Little. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

typedef void(^userLoginCompletion)(User *currentUser);

@interface UserLoginAPI : NSObject

+(void)userLoginWithEmail:(NSString *) email
                 password:(NSString *) password;


@end
