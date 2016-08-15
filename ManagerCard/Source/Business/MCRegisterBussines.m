//
//  MCRegisterBussines.m
//  ManagerCard
//
//  Created by Diego Bandoch dos Santos on 8/15/16.
//  Copyright © 2016 CIT. All rights reserved.
//

#import "MCRegisterBussines.h"
#import "MCProvider+Register.h"

@implementation MCRegisterBussines

- (void)registerUser: registerModel
             success:(void(^)(NSString *result))success
             failure:(void(^)(NSError *error))failure {
    
    MCProvider *sessionManager = [MCProvider instanceHTTP];
    [sessionManager registerUser:registerModel success:^(NSURLSessionDataTask *task, id responseObject) {
        NSDictionary *resp = responseObject;
        if ([resp isKindOfClass:[NSDictionary class]]) {
            if (![[resp objectForKey:@"result"] isEqualToString:@"error"]) {
                success([resp objectForKey:@"result"]);
            } else {
                NSString *messageError = resp[@"message"];
                NSError *errorLogin = [NSError errorWithDomain:@"br.com.ciandt.managercard" code:1 userInfo:[NSDictionary dictionaryWithObject:messageError forKey:NSLocalizedDescriptionKey]];
                failure(errorLogin);
            }
        }
        
    } failure:^(NSError *error) {
        failure(error);
    }];
    
}


-(MCProvider *) registerProvider{
    if (_registerProvider == nil){
        _registerProvider = [[MCProvider alloc] init];
    }
    return _registerProvider;
}

@end
