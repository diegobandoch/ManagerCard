//
//  MCMainViewController.h
//  ManagerCard
//
//  Created by Diego Bandoch dos Santos on 8/15/16.
//  Copyright © 2016 CIT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MCMainManager.h"
#import "LeftViewController.h"

@interface MCMainViewController : UIViewController

@property (strong, nonatomic) MCMainViewController *mainView;
@property (strong, nonatomic) MCMainManager *mainManager;


@property (strong, nonatomic) LeftViewController *leftViewController;

@end
