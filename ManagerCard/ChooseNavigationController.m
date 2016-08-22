//
//  ChooseNavigationController.m
//  ManagerCard
//
//  Created by Diego Bandoch dos Santos on 8/16/16.
//  Copyright © 2016 CIT. All rights reserved.
//

#import "ChooseNavigationController.h"

@implementation ChooseNavigationController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationBar.translucent = YES;
    self.navigationBar.barTintColor = [UIColor colorWithRed:0.f green:0.5 blue:1.f alpha:1.f];
    self.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor]};
    self.navigationBar.tintColor = [UIColor colorWithWhite:1.f alpha:0.5];
}

- (BOOL)shouldAutorotate
{
    return YES;
}

- (BOOL)prefersStatusBarHidden
{
    return (UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation) && UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone);
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (UIStatusBarAnimation)preferredStatusBarUpdateAnimation
{
    return UIStatusBarAnimationNone;
}

@end
