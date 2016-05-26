//
//  HBXHttpOperation.m
//  HBXHttpClient
//
//  Created by 黄保贤 on 16/5/26.
//  Copyright © 2016年 黄保贤. All rights reserved.
//

#import "HBXHttpOperation.h"

@interface HBXHttpOperation ()

@property (nonatomic, strong,readwrite) NSURLSessionDataTask *task;

@end


@implementation HBXHttpOperation


- (instancetype)initWithRequest:(NSURLRequest *)request manager:(AFHTTPSessionManager *)manager Success:(void (^)(NSURLSessionDataTask * _Nonnull, id _Nonnull))success failure:(void (^)(NSURLSessionDataTask * _Nonnull, NSError * _Nonnull))failure {
    
    HBXHttpOperation *operation = [[HBXHttpOperation alloc] init];
    
    __block NSURLSessionDataTask *dataTask = nil;
    
    __weak typeof(self) weakOperation = operation;
    
    dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        if (error) {
            if (failure) {
                failure(dataTask,error);
            }
        }else {
            if (success) {
                success(dataTask,error);
            }
        }
        [weakOperation completeOperation];
    }];
    
    operation.task = dataTask;
    return  operation;

}

@end
