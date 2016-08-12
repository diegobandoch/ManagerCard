//
//  loginSegue.m
//  ManagerCard
//
//  Created by Diego Bandoch dos Santos on 8/4/16.
//  Copyright © 2016 CIT. All rights reserved.
//

#import "MCloginSegue.h"

@implementation MCLoginSegue


-(void) perform{
    UINavigationController *navigationController = (UINavigationController *)self.destinationViewController;
    [self.sourceViewController presentViewController:navigationController animated:YES completion:nil];
}

@end
