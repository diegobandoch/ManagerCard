//
//  ViewController.h
//  ManagerCard
//
//  Created by Diego Bandoch dos Santos on 7/27/16.
//  Copyright © 2016 CIT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MCLoginView.h"
#import "MCLoginManager.h"

@interface ViewController : UIViewController <UITextFieldDelegate>

@property (strong, nonatomic) MCLoginView *loginView;
@property (strong,nonatomic) MCLoginManager *loginManager;


- (IBAction)submitButtonLogin:(id)sender;
- (void)loginResponse:(MCUserModel *)user error:(NSError *)error;
@end

