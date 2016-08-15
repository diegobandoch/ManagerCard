//
//  MCProvider+Register.m
//  ManagerCard
//
//  Created by Diego Bandoch dos Santos on 8/15/16.
//  Copyright © 2016 CIT. All rights reserved.
//

#import "MCProvider+Register.h"
#import "MCUserModel.h"

@implementation MCProvider (Register)

- (void)registerUser:(MCRegisterModel *)user
      success:(ICRequestOperationBlockSuccess)success
      failure:(ICRequestOperationBlockFailure)failure {
    
    NSString *loginEndpoint = @"/signup";
    
    NSDictionary *parameters = @{@"name": user.name, @"email": user.email, @"phone_number": user.phoneNumber, @"card_number": user.cardNumber};
    self.requestSerializer = [AFJSONRequestSerializer serializer];
    self.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [self POST:loginEndpoint
    parameters:parameters
      progress:nil
       success:^(NSURLSessionDataTask *task, id responseObject) {
           success(task,responseObject);
       }
       failure:^(NSURLSessionDataTask *task, NSError *error) {
           failure(error);
       }];
}

@end
