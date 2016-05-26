//
//  HBXHttpOperation.h
//  HBXHttpClient
//
//  Created by 黄保贤 on 16/5/26.
//  Copyright © 2016年 黄保贤. All rights reserved.
//

#import "HBXBaseAsynchionousOperation.h"
#import "AFHTTPSessionManager.h"

@interface HBXHttpOperation : HBXBaseAsynchionousOperation

@property (nonatomic, strong,readonly,nullable) NSURLSessionTask  *task;

- (nullable instancetype)initWithRequest:(nullable NSURLRequest *)request
                        manager:(nullable AFHTTPSessionManager *)manager
                        Success:(nullable void(^)( NSURLSessionDataTask * _Nonnull task, id _Nonnull value))success
                        failure:(nullable void(^)(NSURLSessionDataTask *  _Nonnull task,NSError *_Nonnull error))failure;



@end
