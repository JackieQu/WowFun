//
//  QPButtomToolButton.h
//  WowFun
//
//  Created by JackieQu on 2019/8/13.
//  Copyright © 2019 WowFun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QPJoke.h"

NS_ASSUME_NONNULL_BEGIN

typedef void(^ClickBlock)(QPJoke * joke);

@interface QPButtomToolButton : UIButton

@property (nonatomic, assign) BOOL haveTitle;

@property (nonatomic, copy) ClickBlock clickBlock;

@end

NS_ASSUME_NONNULL_END
