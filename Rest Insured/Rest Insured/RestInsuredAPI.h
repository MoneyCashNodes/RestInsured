//
//  RestInsuredAPI.h
//  Rest Insured
//
//  Created by Brandon Little on 5/16/17.
//  Copyright © 2017 Brandon Little. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Practice.h"

typedef void(^PracticeSearchCompletion)(NSArray<Practice *> *allPractices);

@interface RestInsuredAPI : NSObject

+ (void)practiceSearchWithLat:(NSString *)lat
                          lon:(NSString *)lon
                   providerID:(NSString *)provider
                andCompletion:(PracticeSearchCompletion)completion;

@end
