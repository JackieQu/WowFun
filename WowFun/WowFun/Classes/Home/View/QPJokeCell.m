//
//  QPJokeCell.m
//  WowFun
//
//  Created by JackieQu on 2019/8/9.
//  Copyright © 2019 WowFun. All rights reserved.
//

#import "QPJokeCell.h"
#import "QPButtomToolButton.h"
#import "QPJokeButtomToolView.h"

@interface QPJokeCell ()

@property (nonatomic, strong) UIImageView * avatarImageView;
@property (nonatomic, strong) UILabel * nicknameLabel;

@property (nonatomic, strong) UILabel * titleLabel;
@property (nonatomic, strong) UILabel * contentLabel;
@property (nonatomic, strong) UIView * imagesView;
@property (nonatomic, strong) UIView * videosView;

@property (nonatomic, strong) UILabel * countOfClickLabel;
@property (nonatomic, strong) UILabel * countOfLikeLabel;
@property (nonatomic, strong) UILabel * countOfDislikeLabel;
@property (nonatomic, strong) UILabel * countOfCommentLabel;

@property (nonatomic, strong) UIButton * likeButton;
@property (nonatomic, strong) UIButton * dislikeButton;
@property (nonatomic, strong) UIButton * commentButton;

@property (nonatomic, strong) QPJokeButtomToolView * buttomToolView;

@end

@implementation QPJokeCell

- (UIImageView *)avatarImageView {
    
    if (!_avatarImageView) {
        
        _avatarImageView = [[UIImageView alloc] init];
        _avatarImageView.backgroundColor = [UIColor lightGrayColor];
        _avatarImageView.layer.cornerRadius = kAvatarW * SCALE / 2;
        _avatarImageView.layer.masksToBounds = YES;
    }
    return _avatarImageView;
}

- (UILabel *)nicknameLabel {
    
    if (!_nicknameLabel) {
        
        _nicknameLabel = [[UILabel alloc] init];
        _nicknameLabel.textColor = [UIColor orangeColor];
    }
    return _nicknameLabel;
}

- (UILabel *)titleLabel {
    
    if (!_titleLabel) {
        
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.font = [UIFont systemFontOfSize:kFontSize * SCALE];
    }
    return _titleLabel;
}

- (UILabel *)contentLabel {
    
    if (!_contentLabel) {
        
        _contentLabel = [[UILabel alloc] init];
        _contentLabel.textColor = [UIColor lightGrayColor];
        _contentLabel.numberOfLines = 0;
        _contentLabel.font = [UIFont systemFontOfSize:kFontSize * SCALE];
    }
    return _contentLabel;
}

- (UIView *)buttomToolView {
    
    if (!_buttomToolView) {
        
        _buttomToolView = [[QPJokeButtomToolView alloc] init];
        
        __weak __typeof(self) weakSelf  = self;
        _buttomToolView.praiseBtn.clickBlock = ^(QPJoke * _Nonnull joke) {
            __strong __typeof(self) strongSelf = weakSelf;
            [strongSelf praiseActionWithJoke:joke btn:strongSelf.buttomToolView.praiseBtn];
        };
        _buttomToolView.dispraiseBtn.clickBlock = ^(QPJoke * _Nonnull joke) {
            __strong __typeof(self) strongSelf = weakSelf;
            [strongSelf dispraiseActionWithJoke:joke btn:strongSelf.buttomToolView.dispraiseBtn];
        };
        _buttomToolView.collectBtn.clickBlock = ^(QPJoke * _Nonnull joke) {
            __strong __typeof(self) strongSelf = weakSelf;
            [strongSelf collectActionWithJoke:joke btn:strongSelf.buttomToolView.dispraiseBtn];
        };
        _buttomToolView.shareBtn.clickBlock = ^(QPJoke * _Nonnull joke) {
            __strong __typeof(self) strongSelf = weakSelf;
            [strongSelf shareActionWithJoke:joke btn:strongSelf.buttomToolView.dispraiseBtn];
        };
        _buttomToolView.commentBtn.clickBlock = ^(QPJoke * _Nonnull joke) {
            __strong __typeof(self) strongSelf = weakSelf;
            [strongSelf commentActionWithJoke:joke btn:strongSelf.buttomToolView.dispraiseBtn];
        };
    }
    return _buttomToolView;
}

- (void)praiseActionWithJoke:(QPJoke *)joke btn:(QPButtomToolButton *)btn {
    
    NSLog(@"赞: %@", joke.title);
    NSInteger titleNum = joke.countOfLike;
    NSString * title = [QPJokeButtomToolView getTitleWithCount:titleNum + 1];
    [btn setTitle:title forState:UIControlStateNormal];
}

- (void)dispraiseActionWithJoke:(QPJoke *)joke btn:(QPButtomToolButton *)btn {
    
    NSLog(@"踩: %@", joke.title);
    NSInteger titleNum = joke.countOfDislike;
    NSString * title = [QPJokeButtomToolView getTitleWithCount:titleNum + 1];
    [btn setTitle:title forState:UIControlStateNormal];
}

- (void)collectActionWithJoke:(QPJoke *)joke btn:(QPButtomToolButton *)btn {
    NSLog(@"收藏: %@", joke.title);
}

- (void)shareActionWithJoke:(QPJoke *)joke btn:(QPButtomToolButton *)btn {
    NSLog(@"分享: %@", joke.title);
}

- (void)commentActionWithJoke:(QPJoke *)joke btn:(QPButtomToolButton *)btn {
    NSLog(@"评论: %@", joke.title);
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self.contentView addSubview:self.avatarImageView];
        [self.contentView addSubview:self.nicknameLabel];
        
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.contentLabel];
        [self.contentView addSubview:self.imagesView];
        [self.contentView addSubview:self.videosView];
        
        [self.contentView addSubview:self.countOfClickLabel];
        [self.contentView addSubview:self.countOfLikeLabel];
        [self.contentView addSubview:self.countOfDislikeLabel];
        [self.contentView addSubview:self.countOfCommentLabel];
        
        [self.contentView addSubview:self.likeButton];
        [self.contentView addSubview:self.dislikeButton];
        [self.contentView addSubview:self.commentButton];
        
        [self.contentView addSubview:self.buttomToolView];
    }
    return self;
}

- (void)setJokeFrame:(QPJokeFrame *)jokeFrame {

    _jokeFrame = jokeFrame;
    
    _avatarImageView.image = [UIImage imageNamed:jokeFrame.joke.avatar];
    _avatarImageView.frame = jokeFrame.avatarFrame;
    
    _nicknameLabel.text = jokeFrame.joke.nickname;
    _nicknameLabel.frame = jokeFrame.nicknameFrame;
    
    _titleLabel.text = jokeFrame.joke.title;
    _titleLabel.frame = jokeFrame.titleFrame;
    
    _contentLabel.text = jokeFrame.joke.content;
    _contentLabel.frame = jokeFrame.contentFrame;

    _buttomToolView.jokeFrame = jokeFrame;
    _buttomToolView.frame = jokeFrame.buttomToolView;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
