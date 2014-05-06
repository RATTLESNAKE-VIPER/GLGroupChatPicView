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
    self.membersImageView.totalEntries = session.members.count;
    
//    for (MembersModel *member in session.members) {
//        if (member) {
//            if (member.imageURL) {
//                [self.membersImageView addImage:[UIImage imageNamed:member.imageURL] withInitials:member.name];
//            } else {
//                [self.membersImageView addImage:nil withInitials:member.name];
//            }
//        }
//    }
    
    __block NSUInteger max = 4;    // optimised :-)
    [session.members enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(MembersModel *member, NSUInteger idx, BOOL *stop) {
        max--;
        
        if (member.imageURL) {
            [self.membersImageView addImage:[UIImage imageNamed:member.imageURL] withInitials:member.name];
        } else {
            [self.membersImageView addImage:nil withInitials:member.name];
        }
        
        if (max == 0) {
            *stop = YES;
        }
    }];
    
    [self.membersImageView updateLayout];
}

@end
