//
//  QPVideoCell.m
//  WowFun
//
//  Created by JackieQu on 2019/8/19.
//  Copyright © 2019 WowFun. All rights reserved.
//

#import "QPVideoCell.h"

@interface QPVideoCell ()

@property (nonatomic, strong) UIImageView * coverImageView;

@property (nonatomic, strong) UIView * bottomView;

@property (nonatomic, strong) UIImageView * avatarImageView;

@property (nonatomic, strong) UILabel * nameLabel;

@end

@implementation QPVideoCell

- (UIImageView *)coverImageView {
    
    if (!_coverImageView) {
        
        _coverImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.contentView.bounds.size.width, self.contentView.bounds.size.height - 40)];
        _coverImageView.image = [UIImage imageNamed:@""];
        _coverImageView.backgroundColor = [UIColor lightGrayColor];
    }
    return _coverImageView;
}

- (UIView *)bottomView {
    
    if (!_bottomView) {
        
        _bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, self.contentView.bounds.size.height - 40, self.contentView.bounds.size.width, 40)];
        _bottomView.backgroundColor = [UIColor yellowColor];
        
        [_bottomView addSubview:self.avatarImageView];
        [_bottomView addSubview:self.nameLabel];
    }
    return _bottomView;
}

- (UIImageView *)avatarImageView {
    
    if (!_avatarImageView) {
        
        _avatarImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
        _avatarImageView.image = [UIImage imageNamed:@""];
        _avatarImageView.backgroundColor = [UIColor blueColor];
    }
    return _avatarImageView;
}

- (UILabel *)nameLabel {
    
    if (!_nameLabel) {
        
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 10, 100, 20)];
        _nameLabel.text = @"test";
        _nameLabel.backgroundColor = [UIColor greenColor];
    }
    return _nameLabel;
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        [self.contentView addSubview:self.coverImageView];
        [self.contentView addSubview:self.bottomView];
    }
    return self;
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
}

@end
