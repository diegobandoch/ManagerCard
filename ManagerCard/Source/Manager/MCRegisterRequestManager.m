//
//  MCRegisterRequestManager.m
//  ManagerCard
//
//  Created by Diego Bandoch dos Santos on 8/12/16.
//  Copyright © 2016 CIT. All rights reserved.
//

#import "MCRegisterRequestManager.h"
#import "MCRegisterBussines.h"

@implementation MCRegisterRequestManager

-(BOOL) isEthernetConnected{
    return [self.ethernetBussines isEthernetConnected];
}

- (void)registerUser:(MCRegisterModel *)registerModel
withCompletionBlock:(void(^)(MCRegisterModel *user, NSError *error))completion {
    
    [self.mainQueue addOperationWithBlock:^{
        [self.registerBussines registerUser:registerModel success:^(NSString *result) {
            completion(result, nil);
        } failure:^(NSError *error) {
            completion(nil, error);
        }];
    }];
}

- (NSOperationQueue *)mainQueue {
    if (!_mainQueue) {
        _mainQueue = [NSOperationQueue new];
    }
    return _mainQueue;
}

-(MCRegisterBussines *)registerBussines{
    if (_registerBussines == nil){
        _registerBussines = [[MCRegisterBussines alloc] init];
    }
    return _registerBussines;
}

@end
