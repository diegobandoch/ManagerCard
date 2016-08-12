//
//  MCUserModel.m
//  ManagerCard
//
//  Created by Diego Bandoch dos Santos on 8/5/16.
//  Copyright © 2016 CIT. All rights reserved.
//

#import "MCUserModel.h"

@implementation MCUserModel

- (instancetype)initWithLoginResponse:(NSDictionary *)response {
    if (self = [super init]) {
        [self userFromLoginResponse:response];
    }
    return self;
}

#pragma mark - Parses

- (void)userFromLoginResponse:(NSDictionary *)response {
    self.user = response[@"user"];
    self.cards = response[@"cards"];
}

@end
