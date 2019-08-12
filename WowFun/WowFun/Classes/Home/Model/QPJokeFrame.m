//
//  QPJokeFrame.m
//  WowFun
//
//  Created by JackieQu on 2019/8/9.
//  Copyright © 2019 WowFun. All rights reserved.
//

#import "QPJokeFrame.h"

@implementation QPJokeFrame

- (void)setJoke:(QPJoke *)joke {
    
    _joke = joke;

    CGFloat scaleMargin = kMargin * SCALE;
    
    CGFloat avatarW = kAvatarW * SCALE;
    _avatarFrame = CGRectMake(scaleMargin, scaleMargin, avatarW, avatarW);
    
    CGFloat nicknameW = SCREEN_WIDTH - scaleMargin * 3 - CGRectGetWidth(_avatarFrame);
    CGFloat nicknameH = 30;
    CGFloat nicknameX = CGRectGetMaxX(_avatarFrame) + scaleMargin;
    CGFloat nicknameY = CGRectGetMidY(_avatarFrame) - nicknameH / 2;
    _nicknameFrame = CGRectMake(nicknameX, nicknameY, nicknameW, nicknameH);
    
    BOOL noTitle = [joke.title isEqualToString:@""];
    CGFloat titleW = SCREEN_WIDTH - scaleMargin * 2;
    CGFloat titleH = noTitle ? 0 : 30;
    CGFloat titleY = CGRectGetMaxY(_avatarFrame) + scaleMargin;
    _titleFrame = CGRectMake(scaleMargin, titleY, titleW, titleH);
    
    CGFloat contentY = CGRectGetMaxY(noTitle ? _avatarFrame : _titleFrame) + scaleMargin;
    NSDictionary * fontDict = @{NSFontAttributeName:[UIFont systemFontOfSize:kFontSize * SCALE]};
    CGFloat contentW = titleW;
    CGFloat contentH = [joke.content boundingRectWithSize:CGSizeMake(contentW, MAXFLOAT) options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin attributes:fontDict context:nil].size.height;
    _contentFrame = CGRectMake(scaleMargin, contentY, contentW, contentH);
    
    _buttomToolView = CGRectMake(0, CGRectGetMaxY(_contentFrame) + scaleMargin, SCREEN_WIDTH, 40);
    
    _cellHeight = CGRectGetMaxY(_buttomToolView) + scaleMargin;
}

@end
