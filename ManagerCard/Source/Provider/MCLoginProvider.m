//
//  ICHTTPSessionProvider.m
//  ManagerCard
//
//  Created by Rodrigo Cunha Santana on 03/08/16.
//  Copyright © 2016 Rodrigo Cunha Santana. All rights reserved.
//
#import "MCLoginProvider.h"

static NSString * const baseURL = @"http://cardmanagerserver.herokuapp.com";

@implementation MCLoginProvider

+ (instancetype)instanceHTTP {
    
    static MCLoginProvider * _sharedInstance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSURL *url = [NSURL URLWithString:baseURL];
        _sharedInstance = [[MCLoginProvider alloc] initWithBaseURL:url];
    });
    return _sharedInstance;
} 

@end
