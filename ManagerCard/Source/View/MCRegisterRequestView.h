//
//  MCRegisterRequest.h
//  ManagerCard
//
//  Created by Diego Bandoch dos Santos on 8/3/16.
//  Copyright © 2016 CIT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIEmailValidateField.h"
#import "UINomeValidateField.h"
#import "UICardValidateField.h"
#import "UICellPhoneValidateField.h"


@interface MCRegisterRequestView : UIControl

@property (weak, nonatomic) IBOutlet UINomeValidateField *nomeRegister;
@property (weak, nonatomic) IBOutlet UIEmailValidateField *emailRegister;
@property (weak, nonatomic) IBOutlet UICellPhoneValidateField *celularRegister;
@property (weak, nonatomic) IBOutlet UICardValidateField *cartaoRegister;

@property (weak, nonatomic) IBOutlet UIButton *checkboxRegister;

@property (weak, nonatomic) IBOutlet UIButton *requestRegisterButton;

-(BOOL) isValidFields;

@end
