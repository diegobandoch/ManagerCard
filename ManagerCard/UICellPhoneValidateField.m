//
//  UICelPhoneValidateField.m
//  ManagerCard
//
//  Created by Diego Bandoch dos Santos on 8/12/16.
//  Copyright © 2016 CIT. All rights reserved.
//

#import "UICellPhoneValidateField.h"

@implementation UICellPhoneValidateField


-(BOOL) isValidCellPhoneField{
    return ([self text].length >= 11);
}

@end
