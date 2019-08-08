//
//  QPTabBar.m
//  WowFun
//
//  Created by JackieQu on 2019/8/7.
//  Copyright © 2019 WowFun. All rights reserved.
//

#import "QPTabBar.h"
#import "QPDockItem.h"

@interface QPTabBar ()

@property (nonatomic, strong) NSArray * dataList;

@property (nonatomic, strong) QPDockItem * lastItem;

@end

@implementation QPTabBar

- (NSArray *)dataList {
    
    if (!_dataList) {
        _dataList = @[@"hot", @"video", @"forum", @"profile"];
    }
    return _dataList;
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        NSArray * titles = @[@"首页", @"视频", @"论坛", @"我的"];
        
        for (NSInteger i = 0; i < self.dataList.count; i ++) {
            
            QPDockItem * item = [QPDockItem buttonWithType:UIButtonTypeCustom];
            
//            item.backgroundColor = [UIColor colorWithRed:arc4random_uniform(200) / 255.0f green:arc4random_uniform(200) / 255.0f blue:arc4random_uniform(200) / 255.0f alpha:1];
            item.backgroundColor = [UIColor whiteColor];
            
            item.adjustsImageWhenHighlighted = NO;
            
            [item setImage:[UIImage imageNamed:self.dataList[i]] forState:UIControlStateNormal];
            
            [item setImage:[UIImage imageNamed:[self.dataList[i] stringByAppendingString:@""]] forState:UIControlStateHighlighted];
            
            [item setTitle:titles[i] forState:UIControlStateNormal];
            [item setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
            
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

- (void)clickItem:(QPDockItem *)button {
 
    !self.block ? : self.block(self, button.tag);
    
    if ([self.delegate respondsToSelector:@selector(tabBar:clickItem:)]) {
        [self.delegate tabBar:self clickItem:button.tag];
    }
    
    self.lastItem.selected = NO;
    button.selected = YES;
    self.lastItem = button;
    
    [UIView animateWithDuration:0.2 animations:^{
        
        button.imageView.transform = CGAffineTransformMakeScale(0.8, 0.8);
        
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:0.2 animations:^{
            
            button.imageView.transform = CGAffineTransformIdentity;
            button.titleLabel.transform = CGAffineTransformIdentity;
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
