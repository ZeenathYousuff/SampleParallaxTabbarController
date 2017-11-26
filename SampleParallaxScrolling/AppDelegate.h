//
//  AppDelegate.h
//  SampleParallaxScrolling
//
//  Created by Zeenath on 26/11/17.
//  Copyright © 2017 Zeenath. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

