//
//  MCLoginProvider.m
//  ManagerCard
//
//  Created by Diego Bandoch dos Santos on 8/4/16.
//  Copyright © 2016 CIT. All rights reserved.
//

#import "MCProvider+Login.h"


@implementation MCProvider (Login)

- (void)login:(NSString *)email
 withPassword:(NSString *)senha
      success:(ICRequestOperationBlockSuccess)success
      failure:(ICRequestOperationBlockFailure)failure {
    
    NSString *loginEndpoint = @"/login";
    
    NSDictionary *parameters = @{@"email": email, @"password": senha};
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
