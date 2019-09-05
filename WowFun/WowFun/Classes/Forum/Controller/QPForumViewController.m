//
//  QPForumViewController.m
//  WowFun
//
//  Created by JackieQu on 2019/8/7.
//  Copyright © 2019 WowFun. All rights reserved.
//

#import "QPForumViewController.h"

@interface QPForumViewController ()

@end

@implementation QPForumViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    #pragma mark - 融云测试
    [self initAndConnectRCIM];
    [self setConversationTypes];
//    [self testChat];
}

- (void)initAndConnectRCIM {
 
    NSString * rongyunKey = @"kj7swf8ok3r72";
    [[RCIM sharedRCIM] initWithAppKey:rongyunKey];
    
    NSString * rongyunToken = @"G469R5WsdFi3MGbueWlG5bqYbC+5ZOrCDPzY6NACGXLm4+sdC1tjf7ft4JJ2Hyr7WcHTI1TAYfG+avOg/nTeNnmgJIJHGkSI";
    [[RCIM sharedRCIM] connectWithToken:rongyunToken success:^(NSString *userId) {
        QPLog(@"登录成功，当前用户 ID：%@", userId);
    } error:^(RCConnectErrorCode status) {
        QPLog(@"登录失败，错误吗为：%ld", (long)status);
    } tokenIncorrect:^{
        QPLog(@"token 错误");
    }];
}

- (void)testChat {
    
    RCConversationViewController *chat = [[RCConversationViewController alloc] initWithConversationType:ConversationType_PRIVATE targetId:@"targetIdYouWillChatIn"];
    //设置聊天会话界面要显示的标题
    chat.title = @"想显示的会话标题";
    //显示聊天会话界面
    [self.navigationController pushViewController:chat animated:YES];
}

- (void)setConversationTypes {
 
    //设置需要显示哪些类型的会话
    [self setDisplayConversationTypes:@[@(ConversationType_PRIVATE),
                                        @(ConversationType_DISCUSSION),
                                        @(ConversationType_CHATROOM),
                                        @(ConversationType_GROUP),
                                        @(ConversationType_APPSERVICE),
                                        @(ConversationType_SYSTEM)]];
    
    //设置需要将哪些类型的会话在会话列表中聚合显示
    [self setCollectionConversationType:@[@(ConversationType_DISCUSSION),
                                          @(ConversationType_GROUP)]];
}

//重写RCConversationListViewController的onSelectedTableRow事件
- (void)onSelectedTableRow:(RCConversationModelType)conversationModelType
         conversationModel:(RCConversationModel *)model
               atIndexPath:(NSIndexPath *)indexPath {
    RCConversationViewController *conversationVC = [[RCConversationViewController alloc]init];
    conversationVC.conversationType = model.conversationType;
    conversationVC.targetId = model.targetId;
    conversationVC.title = @"想显示的会话标题";
    [self.navigationController pushViewController:conversationVC animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
