//
//  MCProvider+Register.h
//  ManagerCard
//
//  Created by Diego Bandoch dos Santos on 8/15/16.
//  Copyright © 2016 CIT. All rights reserved.
//

#import "MCProvider.h"
#import "MCRegisterModel.h"

@interface MCProvider (Register)

- (void)registerUser: (MCRegisterModel *) registerModel success:(ICRequestOperationBlockSuccess)success
      failure:(ICRequestOperationBlockFailure)failure;



@end
