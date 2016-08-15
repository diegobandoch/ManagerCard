//
//  User.h
//  ManagerCard
//
//  Created by Diego Bandoch dos Santos on 8/15/16.
//  Copyright © 2016 CIT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MCRegisterModel : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *email;
@property (strong, nonatomic) NSString *phoneNumber;
@property (strong, nonatomic) NSString *cardNumber;

@end
