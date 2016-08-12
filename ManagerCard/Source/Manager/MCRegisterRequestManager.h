//
//  MCRegisterRequestManager.h
//  ManagerCard
//
//  Created by Diego Bandoch dos Santos on 8/12/16.
//  Copyright © 2016 CIT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MCEthernetBussines.h"

@interface MCRegisterRequestManager : NSObject

@property (strong, nonatomic) MCEthernetBussines *ethernetBussines;
@property (strong, nonatomic) NSOperationQueue *mainQueue;

-(BOOL)isEthernetConnected;

@end
