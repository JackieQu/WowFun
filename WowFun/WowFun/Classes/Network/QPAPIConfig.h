//
//  QPAPIConfig.h
//  WowFun
//
//  Created by JackieQu on 2019/8/7.
//  Copyright © 2019 WowFun. All rights reserved.
//

#ifndef QPAPIConfig_h
#define QPAPIConfig_h

#define FULL_PATH(path, pk) [NSString stringWithFormat:@"%@%d/", path, pk]

// 本地测试
#define SERVER_HOST                     @"http://127.0.0.1:8000/"
// 暂未部署
//#define SERVER_HOST                     @"https://www.wowfun.com/"

// 留言板
#define API_MSG_LIST                    @"message/msg/"
#define API_MSG_CREAT                   @"message/msg/create/"

// 信息表
#define API_INFO_LIST                   @"information/info/"
#define API_INFO_CREATE                 @"information/info/create/"

// 片段  
#define API_SNIPPET_LIST                @"snippet/snippets6/"
#define API_SNIPPET_DETAIL(pk)          FULL_PATH(@"snippet/snippets6/", pk)

#endif /* QPAPIConfig_h */
