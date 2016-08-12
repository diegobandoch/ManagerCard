//
//  MCLoginView.m
//  ManagerCard
//
//  Created by Diego Bandoch dos Santos on 8/3/16.
//  Copyright © 2016 CIT. All rights reserved.
//

#import "MCLoginView.h"

@implementation MCLoginView

-(void) awakeFromNib{
    
    _loading.hidden = NO;
    
    [_loading stopAnimating];
    UIColor *color = [UIColor whiteColor];
    _email.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"EMAIL" attributes:@{NSForegroundColorAttributeName: color}];
    
    _senha.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"SENHA" attributes:@{NSForegroundColorAttributeName: color}];
}

-(BOOL) isValidSizeField:(NSInteger *)size forTextField:(UITextField *)textField{
    if (size != nil && textField != nil){
        return size > textField.text.length;
    }
    
    return NO;
}

-(BOOL) isValidFields{
    
    if ( [self isEmailEmpty]|| [self isPasswordEmpty]){
        return NO;
    }
    
    return [self isEmailFieldValid] && [self isPasswordValid];
}

-(BOOL) isPasswordEmpty{
    return (_senha.text.length <= 0 || _senha.text == nil || [_senha.text isEqual:@""]);
}

-(BOOL) isEmailEmpty{
    return _email.text.length <= 0 || _email.text == nil || [_email.text isEqual:@""];
}

-(BOOL) isEmailFieldValid {
    if ( _email.text.length > 100){
        return NO;
    }
    
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:_email.text];
}

-(BOOL) isPasswordValid {
    NSString *passwordRegex = @"^[0-9]{1,6}$";
    NSPredicate *passwordTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", passwordRegex];
    return [passwordTest evaluateWithObject:_senha.text];
}

@end
