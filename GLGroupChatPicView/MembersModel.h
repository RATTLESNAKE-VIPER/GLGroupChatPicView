//
//  MembersModel.h
//  GLGroupChatPicView
//
//  Created by Gautam Lodhiya on 01/05/14.
//  Copyright (c) 2014 Gautam Lodhiya. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MembersModel : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *imageURL;

- (void)initializeDataWithInfo:(NSDictionary *)info;
@end
