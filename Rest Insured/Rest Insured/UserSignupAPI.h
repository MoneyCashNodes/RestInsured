//
//  UserSignupAPI.h
//  Rest Insured
//
//  Created by David Porter on 5/17/17.
//  Copyright © 2017 Brandon Little. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

typedef void(^userSignUpCompletion)(User *currentUser);

@interface UserSignupAPI : NSObject

+(void)userSignUpWithFullName:(NSString *)fullName
                        email:(NSString *)email
                     password:(NSString *)password
                   providerID:(NSString *)providerID
                andCompletion:(userSignUpCompletion)completion;


@end
