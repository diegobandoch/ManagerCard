//
//  LeftViewController.m
//  ManagerCard
//
//  Created by Diego Bandoch dos Santos on 8/15/16.
//  Copyright © 2016 CIT. All rights reserved.
//

#import "LeftViewController.h"
#import "LeftViewCell.h"

@interface LeftViewController ()

@property (strong, nonatomic) NSArray *titlesArray;

@end


@implementation LeftViewController


- (id)init{
    self = [super initWithStyle:UITableViewStylePlain];
    if (self)
    {
        _titlesArray = @[@"Open Right View",
                         @"",
                         @"Profile",
                         @"News",
                         @"Articles",
                         @"Video",
                         @"Music"];
        
        [self.tableView registerClass:[LeftViewCell class] forCellReuseIdentifier:@"cell"];
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.tableView.contentInset = UIEdgeInsetsMake(44.f, 0.f, 44.f, 0.f);
        self.tableView.showsVerticalScrollIndicator = NO;
    }
    return self;
}

@end
