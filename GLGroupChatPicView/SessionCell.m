//
//  ContactCell.m
//  GLGroupChatPicView
//
//  Created by Gautam Lodhiya on 30/04/14.
//  Copyright (c) 2014 Gautam Lodhiya. All rights reserved.
//

#import "SessionCell.h"
#import "SessionModel.h"
#import "MembersModel.h"

@implementation SessionCell

- (void)prepareForReuse
{
    [self.membersImageView reset];
}

- (void)prepareCellWithData:(SessionModel *)session
{
    self.groupNameLabel.text = session.name;
    [self.membersImageView reset];
    
    for (MembersModel *member in session.members) {
        if (member) {
            if (member.imageURL) {
                [self.membersImageView addImage:[UIImage imageNamed:member.imageURL] withInitials:member.name];
            } else {
                [self.membersImageView addImage:nil withInitials:member.name];
            }
        }
    }
    
    [self.membersImageView updateLayout];
}

@end
