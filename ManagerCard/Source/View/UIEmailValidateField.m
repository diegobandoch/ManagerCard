//
//  UIEmailValidateField.m
//  ManagerCard
//
//  Created by Diego Bandoch dos Santos on 8/12/16.
//  Copyright © 2016 CIT. All rights reserved.
//

#import "UIEmailValidateField.h"

@implementation UIEmailValidateField

-(BOOL) isValidEmailField{
    
    if ( [self text].length > 100){
        return NO;
    }
    
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:[self text]];
}

@end
