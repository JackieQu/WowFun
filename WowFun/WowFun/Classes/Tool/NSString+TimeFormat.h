//
//  NSString+TimeFormat.h
//  WowFun
//
//  Created by JackieQu on 2019/8/7.
//  Copyright © 2019 WowFun. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (TimeFormat)

- (NSString *)timeIntervalStringFromTime;

- (NSString *)timeIntervalStringFromDate:(NSDate *)date;

- (NSString *)dateTimeStringFromResponseTime;

@end

NS_ASSUME_NONNULL_END
