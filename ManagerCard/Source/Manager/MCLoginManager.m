//
//  MCLoginManager.m
//  ManagerCard
//
//  Created by Diego Bandoch dos Santos on 8/4/16.
//  Copyright © 2016 CIT. All rights reserved.
//

#import "MCLoginManager.h"


@implementation MCLoginManager

- (void)login:(NSString *)email withPassword:(NSString *)senha
withCompletionBlock:(void(^)(MCUserModel *user, NSError *error))completion {
    
    [self.mainQueue addOperationWithBlock:^{
        [self.loginBussines login:email withPassword:senha success:^(MCUserModel *user) {
            completion(user, nil);
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

-(MCLoginBussines *)loginBussines{
    if (_loginBussines == nil){
        _loginBussines = [[MCLoginBussines alloc] init];
    }
    return _loginBussines;
}

-(BOOL)isEthernetConnected{
    return [self.ethernetBussines isEthernetConnected];
}

@end
