//
//  AppDelegate.h
//  ManagerCard
//
//  Created by Diego Bandoch dos Santos on 7/27/16.
//  Copyright © 2016 CIT. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kMainViewController                            (MainViewController *)[UIApplication sharedApplication].delegate.window.rootViewController
#define kNavigationController (NavigationController *)[(MainViewController *)[UIApplication sharedApplication].delegate.window.rootViewController rootViewController]

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;


@end

