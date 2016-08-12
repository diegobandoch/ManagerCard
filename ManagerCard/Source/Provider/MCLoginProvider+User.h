//
//  MCLoginProvider.h
//  ManagerCard
//
//  Created by Diego Bandoch dos Santos on 8/4/16.
//  Copyright © 2016 CIT. All rights reserved.
//

#import "MCLoginProvider.h"

@interface MCLoginProvider (User)

- (void)login:(NSString *)email withPassword:(NSString *)senha success:(ICRequestOperationBlockSuccess)success
      failure:(ICRequestOperationBlockFailure)failure;

@end