//
//  RestInsuredAPI.h
//  Rest Insured
//
//  Created by Brandon Little on 5/16/17.
//  Copyright © 2017 Brandon Little. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Practice.h"

typedef void(^PracticeSearchCompletion)(NSArray<Practice *> *allTodos);

@interface RestInsuredAPI : NSObject

+ (void)practiceSearch:(PracticeSearchCompletion)completion;

@end
