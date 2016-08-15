//
//  ICHTTPSessionProvider.m
//  ManagerCard
//
//  Created by Rodrigo Cunha Santana on 03/08/16.
//  Copyright © 2016 Rodrigo Cunha Santana. All rights reserved.
//
#import "MCProvider.h"

static NSString * const baseURL = @"http://cardmanagerserver.herokuapp.com";

@implementation MCProvider

+ (instancetype)instanceHTTP {
    
    static MCProvider * _sharedInstance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSURL *url = [NSURL URLWithString:baseURL];
        _sharedInstance = [[MCProvider alloc] initWithBaseURL:url];
    });
    return _sharedInstance;
} 

@end
