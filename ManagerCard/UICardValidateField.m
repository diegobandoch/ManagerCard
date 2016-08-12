//
//  UICardValidateField.m
//  ManagerCard
//
//  Created by Diego Bandoch dos Santos on 8/12/16.
//  Copyright © 2016 CIT. All rights reserved.
//

#import "UICardValidateField.h"

@implementation UICardValidateField

-(BOOL) isValidCardField{
    
    return !(self.text.length <= 0 || self.text == nil || [self.text isEqual:@""]);
}

@end
