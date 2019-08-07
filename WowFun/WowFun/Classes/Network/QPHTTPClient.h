//
//  QPHTTPClient.h
//  WowFun
//
//  Created by JackieQu on 2019/8/7.
//  Copyright © 2019 WowFun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, HTTPRequestType) {
    HTTPRequestGet,
    HTTPRequestPost,
    HTTPRequestPut,
    HTTPRequestPatch,
    HTTPRequestDelete,
};

typedef void(^PrepareBlock)(void);
typedef void(^SuccessBlock)(NSURLSessionDataTask * task, id responseObject);
typedef void(^FailureBlock)(NSURLSessionDataTask * task, NSError * error);

@interface QPHTTPClient : NSObject

@property (nonatomic, strong) AFHTTPSessionManager * manager;

@property (nonatomic, assign) BOOL isConnected;

+ (QPHTTPClient *)sharedClient;

/**
 网络请求

 @param path    地址
 @param method  方式
 @param params  参数
 @param prepare 预处理
 @param success 成功处理
 @param failure 失败处理
 */
- (void)requestWithPath:(NSString *)path
                 method:(NSInteger)method
                 params:(NSDictionary * __nullable)params
                prepare:(PrepareBlock)prepare
                success:(SuccessBlock)success
                failure:(FailureBlock)failure;

/**
 置空 baseURL，设置 AFHTTPResponseSerializer
 */
- (void)setEmptyBaseURLAndDefaultResponseSerializer;

/**
 默认 baseURL，设置 AFJSONResponseSerializer
 */
- (void)setDefaultBaseURLAndJSONResponseSerializer;

@end

NS_ASSUME_NONNULL_END
