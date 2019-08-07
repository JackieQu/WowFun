//
//  QPBaseTabBarController.m
//  WowFun
//
//  Created by JackieQu on 2019/8/7.
//  Copyright © 2019 WowFun. All rights reserved.
//

#import "QPBaseTabBarController.h"
#import "QPHomeViewController.h"
#import "QPVideoViewController.h"
#import "QPForumViewController.h"
#import "QPProfileViewController.h"
#import "QPBaseNavigationController.h"
#import "QPTabBar.h"

@interface QPBaseTabBarController () <QPTabBarDelegate>

@property (nonatomic, strong) QPTabBar * qpTabBar;

@end

@implementation QPBaseTabBarController

- (QPTabBar *)qpTabBar {
    
    if (!_qpTabBar) {
     
        _qpTabBar = [[QPTabBar alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 83)];
        _qpTabBar.delegate = self;
    }
    return _qpTabBar;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSMutableArray * vcNames = [NSMutableArray arrayWithArray:@[@"QPHomeViewController",
                                                                @"QPVideoViewController",
                                                                @"QPForumViewController",
                                                                @"QPProfileViewController"]];
    
    NSArray * vcTitles = @[@"首页", @"视频", @"论坛", @"我的"];
    
    for (NSInteger i = 0; i < vcNames.count; i ++) {
     
        NSString * vcName = vcNames[i];
        
        UIViewController * vc = [[NSClassFromString(vcName) alloc] init];
        
        NSString * vcTitle = vcTitles[i];
        
        vc.title = vcTitle;
        
        QPBaseNavigationController * navVC = [[QPBaseNavigationController alloc] initWithRootViewController:vc];
        
        [vcNames replaceObjectAtIndex:i withObject:navVC];
    }
    
    self.viewControllers = vcNames;
    
    [self.tabBar addSubview:self.qpTabBar];
    
    [[UITabBar appearance] setShadowImage:[UIImage new]];
    [[UITabBar appearance] setBackgroundImage:[UIImage new]];
}

- (void)tabBar:(QPTabBar *)tabBar clickItem:(QPItemType)idx {
 
    self.selectedIndex = idx - QPItemHome;
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
