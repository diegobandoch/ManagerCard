//
//  MCRegisterBussines.h
//  ManagerCard
//
//  Created by Diego Bandoch dos Santos on 8/15/16.
//  Copyright © 2016 CIT. All rights reserved.
//

#import "MCProvider.h"
#import "MCRegisterModel.h"

@interface MCRegisterBussines : MCProvider

@property (strong, nonatomic) MCProvider *registerProvider;

- (void)registerUser: (MCRegisterModel *)registerModel success:(void(^)(NSString *result))success
      failure:(void(^)(NSError *error))failure;

@end
