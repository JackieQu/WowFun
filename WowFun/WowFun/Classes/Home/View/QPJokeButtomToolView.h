//
//  QPJokeButtomToolView.h
//  WowFun
//
//  Created by JackieQu on 2019/8/14.
//  Copyright © 2019 WowFun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QPJokeFrame.h"
#import "QPJoke.h"
#import "QPButtomToolButton.h"

NS_ASSUME_NONNULL_BEGIN

@interface QPJokeButtomToolView : UIView

@property (nonatomic, strong) QPJokeFrame * jokeFrame;

@property (nonatomic, strong) QPButtomToolButton * praiseBtn;
@property (nonatomic, strong) QPButtomToolButton * dispraiseBtn;
@property (nonatomic, strong) QPButtomToolButton * collectBtn;
@property (nonatomic, strong) QPButtomToolButton * shareBtn;
@property (nonatomic, strong) QPButtomToolButton * commentBtn;

@end

NS_ASSUME_NONNULL_END
