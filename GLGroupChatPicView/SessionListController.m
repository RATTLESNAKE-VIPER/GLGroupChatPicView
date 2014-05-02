//
//  ChatListController.m
//  GLGroupChatPicView
//
//  Created by Gautam Lodhiya on 30/04/14.
//  Copyright (c) 2014 Gautam Lodhiya. All rights reserved.
//

#import "SessionListController.h"
#import "SessionModel.h"
#import "SessionCell.h"
#import "MembersModel.h"

@interface SessionListController ()
@property (nonatomic, strong) NSMutableArray *currentSessions;
@property (nonatomic, retain) NSTimer *myTimer;
@end

@implementation SessionListController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.currentSessions = [@[] mutableCopy];
    
    
    NSString *filePath = [[NSBundle mainBundle]pathForResource:@"data" ofType:@"json"];
    NSData *data = [[NSData alloc]initWithContentsOfFile:filePath];
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    NSMutableArray *dataSource = dict[@"session"];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        for(NSDictionary * dataInfo in dataSource) {
            SessionModel *session = [[SessionModel alloc] init];
            [session initializeDataWithInfo:dataInfo];
            [self.currentSessions addObject:session];
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
    });
    
    
    self.myTimer = [NSTimer scheduledTimerWithTimeInterval:5
                                               target:self
                                             selector:@selector(addRandomMember)
                                             userInfo:nil
                                              repeats:YES];
}

- (void)dealloc
{
    if ([self.myTimer isValid]) {
        [self.myTimer invalidate];
    }
}


#pragma mark - Helpers

- (void)addRandomMember
{
    SessionModel *session = [self.currentSessions lastObject];
    NSMutableArray *membersModel = [@[] mutableCopy];
    
    //// change members
    int randomCount = arc4random() % 5;
    for (int i = 0; i < randomCount; i++) {
        MembersModel *model = [[MembersModel alloc] init];
        model.name = [self generateRandomString:3];
        [membersModel addObject:model];
    }
    session.members = membersModel;
    
    
    //// update layout
    SessionCell *cell = (SessionCell *)[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:self.currentSessions.count - 1 inSection:0]];
    [cell prepareCellWithData:session];
}

- (NSString*)generateRandomString:(int)num {
    NSMutableString* string = [NSMutableString stringWithCapacity:num];
    for (int i = 0; i < num; i++) {
        [string appendFormat:@"%C", (unichar)('a' + arc4random_uniform(25))];
    }
    return string;
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return self.currentSessions.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SessionCell *cell = (SessionCell *)[tableView dequeueReusableCellWithIdentifier:@"cell_identifier" forIndexPath:indexPath];
    SessionModel *session = self.currentSessions[indexPath.row];
    [cell prepareCellWithData:session];
    return cell;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
