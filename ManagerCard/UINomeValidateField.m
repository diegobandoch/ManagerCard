//
//  UINomeValidateField.m
//  ManagerCard
//
//  Created by Diego Bandoch dos Santos on 8/12/16.
//  Copyright © 2016 CIT. All rights reserved.
//

#import "UINomeValidateField.h"


@implementation UINomeValidateField

-(BOOL) isValidNomeField{
    
    NSString *nomeRegex = @"^[a-zA-Z]{3,}\\s[a-zA-Z]{3,}(\\s([a-zA-Z]*))*";
    NSPredicate *nomeTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", nomeRegex];
    return [nomeTest evaluateWithObject:[self text]];
}

@end
