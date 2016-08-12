//
//  MCUserModel.h
//  ManagerCard
//
//  Created by Diego Bandoch dos Santos on 8/5/16.
//  Copyright © 2016 CIT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MCUserModel : NSObject

- (instancetype)initWithLoginResponse:(id)serviceResponse;

@property (strong, nonatomic) NSDictionary *user;
@property (strong, nonatomic) NSDictionary *cards;


@end
