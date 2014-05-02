//
//  ChatCurrentSession.h
//  GLGroupChatPicView
//
//  Created by Gautam Lodhiya on 30/04/14.
//  Copyright (c) 2014 Gautam Lodhiya. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SessionModel : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSArray *members;

- (void)initializeDataWithInfo:(NSDictionary *)info;
@end
