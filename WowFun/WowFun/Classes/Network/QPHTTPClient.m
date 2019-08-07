//
//  QPHTTPClient.m
//  WowFun
//
//  Created by JackieQu on 2019/8/7.
//  Copyright © 2019 WowFun. All rights reserved.
//

#import "QPHTTPClient.h"
#import "QPAPIConfig.h"

static NSString * kBaseURL = SERVER_HOST;

@interface QPHTTPClient ()

//@property (nonatomic, strong) AFHTTPSessionManager * manager;

@end

@implementation QPHTTPClient

+ (QPHTTPClient *)sharedClient {
    
    static QPHTTPClient * client = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        client = [[self alloc] init];
    });
    return client;
}

- (instancetype)init {
    
    self = [super init];
    if (self) {
        
        NSURLSessionConfiguration * config = [NSURLSessionConfiguration defaultSessionConfiguration];
        
        self.manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:kBaseURL] sessionConfiguration:config];
        
        self.manager.requestSerializer = [AFHTTPRequestSerializer serializer];
        
        self.manager.requestSerializer.timeoutInterval = 20;
        
        [self.manager.requestSerializer setValue:@"application/x-www-form-urlencoded; charset=utf-8;" forHTTPHeaderField:@"Content-Type"];
        
        self.manager.responseSerializer = [AFJSONResponseSerializer serializer];
        
        self.manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"test/javascript", @"text/html", @"text/plain", @"image/gif", @"image/jpg", @"image/png", nil];
        
        self.manager.securityPolicy = [AFSecurityPolicy defaultPolicy];
        
        [self openNetworkMonitor];
    }
    return self;
}

- (void)openNetworkMonitor {
    
    self.isConnected = YES;
    
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        
        switch (status) {
                
            case AFNetworkReachabilityStatusUnknown:
                self.isConnected = NO;
                break;
                
            case AFNetworkReachabilityStatusNotReachable:
                self.isConnected = NO;
                break;
                
            case AFNetworkReachabilityStatusReachableViaWiFi:
                self.isConnected = YES;
                break;
                
            case AFNetworkReachabilityStatusReachableViaWWAN:
                self.isConnected = YES;
                break;
                
            default:
                break;
        }
    }];
    
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
}

- (void)requestWithPath:(NSString *)path
                 method:(NSInteger)method
                 params:(NSDictionary * __nullable)params
                prepare:(PrepareBlock)prepare
                success:(SuccessBlock)success
                failure:(FailureBlock)failure {
    
    if (self.isConnected) {
        
        if (prepare) {
            prepare();
        }
        
        NSString * baseURL = [[self.manager valueForKey:@"baseURL"] absoluteString];
        NSString * url = [baseURL stringByAppendingString:path];
        
        switch (method) {
                
            case HTTPRequestGet:
                [self.manager GET:url parameters:params progress:nil success:success failure:failure];
                break;
                
            case HTTPRequestPost:
                [self.manager POST:url parameters:params progress:nil success:success failure:failure];
                break;
                
            case HTTPRequestPut:
                [self.manager PUT:url parameters:params success:success failure:failure];
                break;
                
            case HTTPRequestPatch:
                [self.manager PATCH:url parameters:params success:success failure:failure];
                break;
                
            case HTTPRequestDelete:
                [self.manager DELETE:url parameters:params success:success failure:failure];
                break;
                
            default:
                break;
        }
    } else {
        
        [self showAlert];
    }
}

- (void)showAlert {
    
    UIAlertController * alertVC = [UIAlertController alertControllerWithTitle:@"提示" message:@"网络连接异常，请检查网络连接" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction * alertAction = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:nil];
    
    [alertVC addAction:alertAction];
    
    [[[[UIApplication sharedApplication] keyWindow] rootViewController] presentViewController:alertVC animated:YES completion:nil];
}

- (void)setEmptyBaseURLAndDefaultResponseSerializer {
    
    [[[QPHTTPClient sharedClient] manager] setValue:[NSURL URLWithString:@""] forKey:@"baseURL"];
    [[QPHTTPClient sharedClient] manager].responseSerializer = [AFHTTPResponseSerializer serializer];
}

- (void)setDefaultBaseURLAndJSONResponseSerializer {
    
    [[[QPHTTPClient sharedClient] manager] setValue:[NSURL URLWithString:SERVER_HOST] forKey:@"baseURL"];
    [[QPHTTPClient sharedClient] manager].responseSerializer = [AFJSONResponseSerializer serializer];
}

@end
