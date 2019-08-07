//
//  NSString+TimeFormat.m
//  WowFun
//
//  Created by JackieQu on 2019/8/7.
//  Copyright © 2019 WowFun. All rights reserved.
//

#import "NSString+TimeFormat.h"

const NSInteger kOneMinute = 60;
const NSInteger kOneHour   = 3600;      // kOneMinute * 60
const NSInteger kOneDay    = 86400;     // kOneHour   * 24
const NSInteger kOneMonth  = 2592000;   // kOneDay    * 30

@implementation NSString (TimeFormat)

- (NSString *)timeIntervalStringFromTime {
    
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    
    formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    
    NSDate * date = [formatter dateFromString:self];
    
    return [self timeIntervalStringFromDate:date];
}

- (NSString *)timeIntervalStringFromDate:(NSDate *)date {
    
    NSTimeInterval timeInterval = -[date timeIntervalSinceNow];
    
    if (timeInterval <= 0) {
        
        return @"未知时间";
        
    } else if (timeInterval <= kOneMinute) {
        
        return @"刚刚";
        
    } else if (timeInterval <= kOneHour) {
        
        return [NSString stringWithFormat:@"%li分钟前", (NSInteger)timeInterval / kOneMinute];
        
    } else if (timeInterval <= kOneDay) {
        
        return [NSString stringWithFormat:@"%li小时前", (NSInteger)timeInterval / kOneHour];
        
    } else if (timeInterval <= kOneMonth) {
      
        return [NSString stringWithFormat:@"%li天前", (NSInteger)timeInterval / kOneDay];
        
    } else {
        
        NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
        
        formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
        
        return [formatter stringFromDate:date];
    }
}

- (NSString *)dateTimeStringFromResponseTime {
    
    // responseTime 2019-08-06T09:16:43.109004
    NSArray * components = [self componentsSeparatedByString:@"T"];
    NSArray * components2 = [components[1] componentsSeparatedByString:@"."];
    NSString * dateTimeStr = [NSString stringWithFormat:@"%@ %@", components[0], components2[0]];
    
    return dateTimeStr;
}

@end
