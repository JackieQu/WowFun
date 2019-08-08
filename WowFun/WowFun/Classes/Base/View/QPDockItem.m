//
//  QPDockItem.m
//  WowFun
//
//  Created by JackieQu on 2019/8/8.
//  Copyright © 2019 WowFun. All rights reserved.
//

#import "QPDockItem.h"

static CGFloat kImageScale = 0.618;

@implementation QPDockItem

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
        self.titleLabel.font = [UIFont systemFontOfSize:12];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.tintColor = [UIColor blackColor];
    }
    return self;
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect {
 
    CGFloat x = contentRect.size.width * (1 - kImageScale) / 2;
    CGFloat width = contentRect.size.width * kImageScale;
    CGFloat height = contentRect.size.height * kImageScale;
    
    return CGRectMake(x, 0, width, height);
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect {
 
    CGFloat y = contentRect.size.height * kImageScale;
    CGFloat width = contentRect.size.width;
    CGFloat height = contentRect.size.height * (1 - kImageScale);
    
    return CGRectMake(0, y, width, height);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
