//
//  MembersModel.m
//  GLGroupChatPicView
//
//  Created by Gautam Lodhiya on 01/05/14.
//  Copyright (c) 2014 Gautam Lodhiya. All rights reserved.
//

#import "MembersModel.h"

@implementation MembersModel

- (void)initializeDataWithInfo:(NSDictionary *)info;
{
    self.name = info[@"name"];
    self.imageURL = info[@"image_url"];
}

@end
