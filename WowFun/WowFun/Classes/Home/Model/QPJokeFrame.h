//
//  QPJokeFrame.h
//  WowFun
//
//  Created by JackieQu on 2019/8/9.
//  Copyright © 2019 WowFun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "QPJoke.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCALE SCREEN_WIDTH / 375.0f

static const CGFloat kFontSize = 16;
static const CGFloat kMargin = 10;
static const CGFloat kAvatarW = 40;

NS_ASSUME_NONNULL_BEGIN

@interface QPJokeFrame : NSObject

@property (nonatomic, strong) QPJoke * joke;

@property (nonatomic, assign) CGRect avatarFrame;
@property (nonatomic, assign) CGRect nicknameFrame;
@property (nonatomic, assign) CGRect titleFrame;
@property (nonatomic, assign) CGRect contentFrame;

@property (nonatomic, assign) CGFloat cellHeight;

@end

NS_ASSUME_NONNULL_END
