//
//  HBXHttpClient.h
//  HBXHttpClient
//
//  Created by 黄保贤 on 16/5/26.
//  Copyright © 2016年 黄保贤. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPSessionManager.h"
#import "HBXHTTPClientDefine.h"

@interface HBXHttpClient : AFHTTPSessionManager

+ (HBXHttpClient *)instance;

+ (void)destory;

@end
