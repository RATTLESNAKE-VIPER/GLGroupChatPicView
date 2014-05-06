//
//  MultiImageView.h
//  GLGroupChatPicView
//
//  Created by Gautam Lodhiya on 30/04/14.
//  Copyright (c) 2014 Gautam Lodhiya. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GLGroupChatPicView : UIView
@property (nonatomic, assign) NSUInteger totalEntries;

- (void)addImage:(UIImage *)image withInitials:(NSString *)initials;
- (void)updateLayout;
- (void)reset;
@end
