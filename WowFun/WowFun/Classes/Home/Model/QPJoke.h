//
//  QPJoke.h
//  WowFun
//
//  Created by JackieQu on 2019/8/9.
//  Copyright © 2019 WowFun. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface QPJoke : NSObject

@property (nonatomic, copy) NSString * nickname;
@property (nonatomic, copy) NSString * avatar;
@property (nonatomic, copy) NSString * sex;

@property (nonatomic, assign) NSInteger pk;
@property (nonatomic, copy) NSString * title;
@property (nonatomic, copy) NSString * content;
@property (nonatomic, copy) NSString * images;
@property (nonatomic, copy) NSString * videos;
@property (nonatomic, copy) NSString * category;

@property (nonatomic, assign) NSInteger countOfLike;
@property (nonatomic, assign) NSInteger countOfDislike;
@property (nonatomic, assign) NSInteger countOfComment;
@property (nonatomic, assign) NSInteger countOfClick;

@end

NS_ASSUME_NONNULL_END
