//
//  QPTabBar.m
//  WowFun
//
//  Created by JackieQu on 2019/8/7.
//  Copyright © 2019 WowFun. All rights reserved.
//

#import "QPTabBar.h"

@interface QPTabBar ()

@property (nonatomic, strong) NSArray * dataList;

@property (nonatomic, strong) UIButton * lastItem;

@end

@implementation QPTabBar

- (NSArray *)dataList {
    
    if (!_dataList) {
        _dataList = @[@"", @"", @"", @""];
    }
    return _dataList;
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor orangeColor];
        
        for (NSInteger i = 0; i < self.dataList.count; i ++) {
            
            UIButton * item = [UIButton buttonWithType:UIButtonTypeCustom];
            
            item.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255) / 255.0f green:arc4random_uniform(255) / 255.0f blue:arc4random_uniform(255) / 255.0f alpha:arc4random_uniform(10) / 10.0f];
            
            item.adjustsImageWhenHighlighted = NO;
            
            [item setImage:[UIImage imageNamed:self.dataList[i]] forState:UIControlStateNormal];
            
            [item setImage:[UIImage imageNamed:[self.dataList[i] stringByAppendingString:@""]] forState:UIControlStateHighlighted];
            
            [item addTarget:self action:@selector(clickItem:) forControlEvents:UIControlEventTouchUpInside];
            
            item.tag = QPItemHome + i;
            
            if (i == 0) {
                
                item.selected = YES;
                self.lastItem = item;
            }
            
            [self addSubview:item];
        }
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat width = self.bounds.size.width / self.dataList.count;
    
    for (NSInteger i = 0; i < [self subviews].count; i ++) {
        
        UIView * btn = [self subviews][i];
        
        if ([btn isKindOfClass:[UIButton class]]) {
            
            btn.frame = CGRectMake(width * (btn.tag - QPItemHome), 0, width, 49);
        }
    }
}

- (void)clickItem:(UIButton *)button {
 
    !self.block ? : self.block(self, button.tag);
    
    if ([self.delegate respondsToSelector:@selector(tabBar:clickItem:)]) {
        [self.delegate tabBar:self clickItem:button.tag];
    }
    
    self.lastItem.selected = NO;
    button.selected = YES;
    self.lastItem = button;
    
    [UIView animateWithDuration:0.25 animations:^{
        
        button.transform = CGAffineTransformMakeScale(1.25, 1.25);
        
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:0.25 animations:^{
            
            button.transform = CGAffineTransformIdentity;
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
