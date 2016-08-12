//
//  ICHTTPSessionProvider.h
//  ManagerCard
//
//  Created by Rodrigo Cunha Santana on 03/08/16.
//  Copyright © 2016 Rodrigo Cunha Santana. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

typedef void (^ICRequestOperationBlockSuccess) (NSURLSessionDataTask *task, id responseObject);
typedef void (^ICRequestOperationBlockFailure) (NSError *error);

@interface MCLoginProvider : AFHTTPSessionManager

+ (instancetype)instanceHTTP;

@end
