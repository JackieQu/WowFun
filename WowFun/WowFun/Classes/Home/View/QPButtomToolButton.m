//
//  QPButtomToolButton.m
//  WowFun
//
//  Created by JackieQu on 2019/8/13.
//  Copyright © 2019 WowFun. All rights reserved.
//

#import "QPButtomToolButton.h"

static CGFloat kImageScale = 0.618;

@implementation QPButtomToolButton

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
        self.titleLabel.font = [UIFont systemFontOfSize:15];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.tintColor = [UIColor blackColor];
    }
    return self;
}

- (void)setTitle:(NSString *)title forState:(UIControlState)state {
    
    [super setTitle:title forState:state];
    
    self.haveTitle = YES;
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    
    CGFloat x = 0;
    CGFloat y = contentRect.size.height * (1 - kImageScale) / 2;
    CGFloat width = !self.haveTitle ? contentRect.size.width : contentRect.size.width * (1 - kImageScale);
    CGFloat height = contentRect.size.height * kImageScale;
    
    return CGRectMake(x, y, width, height);
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    
    CGFloat x = contentRect.size.width * (1 - kImageScale);
    CGFloat y = contentRect.size.height / 2 - 15 / 2;
    CGFloat width = contentRect.size.width * kImageScale;
    CGFloat height = contentRect.size.height * (1 - kImageScale);
    
    return CGRectMake(x, y, width, height);
}
@end
