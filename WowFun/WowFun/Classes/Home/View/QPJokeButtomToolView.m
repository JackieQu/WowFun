//
//  QPJokeButtomToolView.m
//  WowFun
//
//  Created by JackieQu on 2019/8/14.
//  Copyright © 2019 WowFun. All rights reserved.
//

#import "QPJokeButtomToolView.h"
#import "UIImage+RotateImage.h"

@interface QPJokeButtomToolView ()

@end

@implementation QPJokeButtomToolView

// @[@"praise", @"praise", @"like", @"share", @"comment"];
- (QPButtomToolButton *)praiseBtn {
 
    if (!_praiseBtn) {
        
        _praiseBtn = [QPButtomToolButton buttonWithType:UIButtonTypeCustom];
        [_praiseBtn setImage:[UIImage imageNamed:@"praise"] forState:UIControlStateNormal];
        [_praiseBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_praiseBtn addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _praiseBtn;
}

- (QPButtomToolButton *)dispraiseBtn {
    
    if (!_dispraiseBtn) {
        
        _dispraiseBtn = [QPButtomToolButton buttonWithType:UIButtonTypeCustom];
        UIImage * dispraiseImage = [[UIImage imageNamed:@"praise"] rotateImageWithRadian:M_PI];
//        UIImage * dispraiseImage = [UIImage imageNamed:@"praise"];
//        dispraiseImage = [UIImage imageWithCGImage:dispraiseImage.CGImage scale:1 orientation:UIImageOrientationDownMirrored];
        [_dispraiseBtn setImage:dispraiseImage forState:UIControlStateNormal];
        [_dispraiseBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_dispraiseBtn addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _dispraiseBtn;
}

- (QPButtomToolButton *)collectBtn {
 
    if (!_collectBtn) {
        
        _collectBtn = [QPButtomToolButton buttonWithType:UIButtonTypeCustom];
        [_collectBtn setImage:[UIImage imageNamed:@"like"] forState:UIControlStateNormal];
        [_collectBtn addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _collectBtn;
}

- (QPButtomToolButton *)shareBtn {
    
    if (!_shareBtn) {
        
        _shareBtn = [QPButtomToolButton buttonWithType:UIButtonTypeCustom];
        [_shareBtn setImage:[UIImage imageNamed:@"share"] forState:UIControlStateNormal];
        [_shareBtn addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _shareBtn;
}

- (QPButtomToolButton *)commentBtn {
    
    if (!_commentBtn) {
        
        _commentBtn = [QPButtomToolButton buttonWithType:UIButtonTypeCustom];
        [_commentBtn setImage:[UIImage imageNamed:@"comment"] forState:UIControlStateNormal];
        [_commentBtn addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _commentBtn;
}


- (instancetype)init {
    
    self = [super init];
    if (self) {
        
        [self addSubview:self.praiseBtn];
        [self addSubview:self.dispraiseBtn];
        [self addSubview:self.collectBtn];
        [self addSubview:self.shareBtn];
        [self addSubview:self.commentBtn];
    }
    return self;
}

- (void)setJokeFrame:(QPJokeFrame *)jokeFrame {
 
    _jokeFrame = jokeFrame;

    NSString * praiseBtnTitle = [self.class getTitleWithCount:jokeFrame.joke.countOfLike]; // [self getTitleWithCount:jokeFrame.joke.countOfLike];
    [_praiseBtn setTitle:praiseBtnTitle forState:UIControlStateNormal];
    _praiseBtn.frame = [jokeFrame.buttomToolBtnFrames[0] CGRectValue];
    
    NSString * dipraiseBtnTitle = [self.class getTitleWithCount:jokeFrame.joke.countOfDislike]; // [self getTitleWithCount:jokeFrame.joke.countOfDislike];;
    [_dispraiseBtn setTitle:dipraiseBtnTitle forState:UIControlStateNormal];
    _dispraiseBtn.frame = [jokeFrame.buttomToolBtnFrames[1] CGRectValue];
    
    _collectBtn.frame = [jokeFrame.buttomToolBtnFrames[2] CGRectValue];
    
    _shareBtn.frame = [jokeFrame.buttomToolBtnFrames[3] CGRectValue];
    
    _commentBtn.frame = [jokeFrame.buttomToolBtnFrames[4] CGRectValue];
}

+ (NSString *)getTitleWithCount:(NSInteger)count {
 
    NSString * title = [NSString stringWithFormat:@"%ld", count];
    NSInteger pivotW = 10000;
    NSInteger pivotK = 1000;
    if (count >= pivotW) {
        title = [NSString stringWithFormat:@"%.1fw", floor(count * 10.0 / pivotW) / 10];
    } else if (count >= pivotK) {
        title = [NSString stringWithFormat:@"%.1fk", floor(count * 10.0 / pivotK) / 10];
    }
    return title;
}

- (void)clickAction:(QPButtomToolButton *)btn {
    
    !btn.clickBlock ? : btn.clickBlock(_jokeFrame.joke);
    
//    if (btn.haveTitle) {
//        NSInteger titleNum = [btn.titleLabel.text integerValue];
//        [btn setTitle:[NSString stringWithFormat:@"%ld",titleNum + 1] forState:UIControlStateNormal];
//    }
    
    [UIView animateWithDuration:0.2 animations:^{
        btn.imageView.transform = CGAffineTransformMakeScale(0.8, 0.8);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.2 animations:^{
            btn.imageView.transform = CGAffineTransformIdentity;
        }];
    }];
    
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
