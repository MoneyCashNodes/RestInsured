//
//  AppDelegate.h
//  Rest Insured
//
//  Created by Brandon Little on 5/15/17.
//  Copyright © 2017 Brandon Little. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

