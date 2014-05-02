//
//  ChatCurrentSession.m
//  GLGroupChatPicView
//
//  Created by Gautam Lodhiya on 30/04/14.
//  Copyright (c) 2014 Gautam Lodhiya. All rights reserved.
//

#import "SessionModel.h"
#import "MembersModel.h"

@implementation SessionModel

- (void)initializeDataWithInfo:(NSDictionary *)info;
{
    self.name = info[@"name"];
    
    NSArray *members = info[@"members"];
    NSMutableArray *membersModel = [@[] mutableCopy];
    for (NSDictionary *memberInfo in members) {
        MembersModel *model = [[MembersModel alloc] init];
        [model initializeDataWithInfo:memberInfo];
        [membersModel addObject:model];
    }
    self.members = membersModel;
}

@end
