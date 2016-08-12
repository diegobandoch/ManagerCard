//
//  MCRegisterRequestManager.m
//  ManagerCard
//
//  Created by Diego Bandoch dos Santos on 8/12/16.
//  Copyright © 2016 CIT. All rights reserved.
//

#import "MCRegisterRequestManager.h"

@implementation MCRegisterRequestManager

-(BOOL) isEthernetConnected{
    return [self.ethernetBussines isEthernetConnected];
}

@end
