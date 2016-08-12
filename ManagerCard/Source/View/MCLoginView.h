//
//  MCLoginView.h
//  ManagerCard
//
//  Created by Diego Bandoch dos Santos on 8/3/16.
//  Copyright © 2016 CIT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MCLoginView : UIControl

@property (weak, nonatomic) IBOutlet UIButton *requestFormButton;
@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UITextField *senha;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loading;


-(BOOL) isValidSizeField:(NSInteger *)size forTextField:(UITextField *)textField;
-(BOOL) isValidFields;
-(BOOL) isEmailFieldValid ;
-(BOOL) isPasswordValid ;
@end
