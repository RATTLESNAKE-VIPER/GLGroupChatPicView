//
//  ContactCell.h
//  GLGroupChatPicView
//
//  Created by Gautam Lodhiya on 30/04/14.
//  Copyright (c) 2014 Gautam Lodhiya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GLGroupChatPicView.h"
@class SessionModel;

@interface SessionCell : UITableViewCell
@property (weak, nonatomic) IBOutlet GLGroupChatPicView *membersImageView;
@property (weak, nonatomic) IBOutlet UILabel *groupNameLabel;
- (void)prepareCellWithData:(SessionModel *)session;
@end
