//
//  QPJokeCell.h
//  WowFun
//
//  Created by JackieQu on 2019/8/9.
//  Copyright © 2019 WowFun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QPJoke.h"
#import "QPJokeFrame.h"

NS_ASSUME_NONNULL_BEGIN

@interface QPJokeCell : UITableViewCell

@property (nonatomic, strong) QPJoke * joke;

@property (nonatomic, strong) QPJokeFrame * jokeFrame;

@end

NS_ASSUME_NONNULL_END
