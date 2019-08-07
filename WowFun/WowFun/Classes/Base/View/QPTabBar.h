//
//  QPTabBar.h
//  WowFun
//
//  Created by JackieQu on 2019/8/7.
//  Copyright © 2019 WowFun. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, QPItemType) {
    QPItemHome = 1000,
    QPItemVideo,
    QPItemShow,
    QPItemProfile
};

@class QPTabBar;

typedef void(^TabBarBlock)(QPTabBar * tabBar, QPItemType idx);

@protocol QPTabBarDelegate <NSObject>

- (void)tabBar:(QPTabBar *)tabBar clickItem:(QPItemType)idx;

@end

@interface QPTabBar : UIView

@property (nonatomic, copy) TabBarBlock block;

@property (nonatomic, weak) id<QPTabBarDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
