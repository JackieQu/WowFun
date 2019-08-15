//
//  QPJokeDetailViewController.h
//  WowFun
//
//  Created by JackieQu on 2019/8/15.
//  Copyright © 2019 WowFun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QPBaseViewController.h"
#import "QPJokeFrame.h"
#import "QPJokeCell.h"
#import "QPJoke.h"

NS_ASSUME_NONNULL_BEGIN

@interface QPJokeDetailViewController : QPBaseViewController

@property (nonatomic, strong) QPJokeFrame * jokeFrame;

@property (nonatomic, strong) QPJokeCell * jokeCell;

@end

NS_ASSUME_NONNULL_END
