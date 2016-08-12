//
//  MCLoginManager.h
//  ManagerCard
//
//  Created by Diego Bandoch dos Santos on 8/4/16.
//  Copyright © 2016 CIT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MCLoginBussines.h"
#import "MCEthernetBussines.h"

@interface MCLoginManager : NSObject


@property (strong, nonatomic) MCLoginBussines *loginBussines;
@property (strong, nonatomic) MCEthernetBussines *ethernetBussines;
@property (strong, nonatomic) NSOperationQueue *mainQueue;

- (void)login:(NSString *)email withPassword:(NSString *)senha
withCompletionBlock:(void(^)(MCUserModel *user, NSError *error))completion;

-(BOOL)isEthernetConnected;
@end
