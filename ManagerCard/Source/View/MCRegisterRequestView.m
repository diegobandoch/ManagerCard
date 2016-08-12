//
//  MCRegisterRequest.m
//  ManagerCard
//
//  Created by Diego Bandoch dos Santos on 8/3/16.
//  Copyright © 2016 CIT. All rights reserved.
//

#import "MCRegisterRequestView.h"
#import "UIEmailValidateField.h"
#import "UICardValidateField.h"
#import "UICellPhoneValidateField.h"


@implementation MCRegisterRequestView

-(void) awakeFromNib{
    self.requestRegisterButton.enabled = NO;
    
    [self.nomeRegister addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingDidEnd];
    [self.emailRegister addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingDidEnd];
    [self.celularRegister addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingDidEnd];
    [self.cartaoRegister addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingDidEnd];
}

- (void)statusRegisterRequestButton {
    if ([self isFilledFields]){
        self.requestRegisterButton.enabled = YES;
    }else{
        self.requestRegisterButton.enabled = NO;
    }
}

-(void)textFieldDidChange :(UITextField *) textField{
    [self statusRegisterRequestButton];
}

-(BOOL)isFilledFields{
    return [self isFilledField: self.nomeRegister] && [self isFilledField: self.emailRegister] && [self isFilledField: self.celularRegister] && [self isFilledField: self.cartaoRegister] && [self.checkboxRegister isSelected];
}

-(BOOL) isFilledField:(UITextField *) field{
    return ![field.text isEqualToString:@""];
}

- (IBAction)tapCheckboxTerms:(id)sender {
 
    if ([self.checkboxRegister isSelected]) {
        UIImage *btnImage = [UIImage imageNamed:@"emptyCheckBox.png"];
        [self.checkboxRegister setImage:btnImage forState:UIControlStateNormal];
        [sender setSelected:NO];
    } else {
        UIImage *btnImage = [UIImage imageNamed:@"selectedCheckBox.png"];
        [self.checkboxRegister setImage:btnImage forState:UIControlStateSelected];
        [sender setSelected:YES];
    }
    
    [self statusRegisterRequestButton];
}


-(BOOL) isValidFields{
    
    return [self.emailRegister isValidEmailField] && [self.nomeRegister isValidNomeField] && [self.cartaoRegister isValidCardField] && [self.celularRegister isValidCellPhoneField];

}
@end
