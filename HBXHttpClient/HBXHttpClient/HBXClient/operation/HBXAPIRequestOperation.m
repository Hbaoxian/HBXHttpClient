//
//  HBXAPIRequestOperation.m
//  HBXHttpClient
//
//  Created by 黄保贤 on 16/5/26.
//  Copyright © 2016年 黄保贤. All rights reserved.
//

#import "HBXAPIRequestOperation.h"
#import "HBXHttpOperation.h"
#import "HBXHttpClient.h"
#import "HBXHTTPClientDefine.h"
#import "YYModel.h"

static dispatch_queue_t sResponseObjectMappingQueue;


@interface HBXAPIRequestOperation ()

@property (nullable, nonatomic, strong) HBXHttpOperation *operation;
@property (nonatomic, assign)           BOOL isActive;


@end


@implementation HBXAPIRequestOperation

- (instancetype)initWithRequest:(NSURLRequest *)request {
    if (self = [super init]) {
        _request = request;
    }
    return self;
}

- (void)start {
    self.isActive = YES;
    HBXHttpClient *client = [HBXHttpClient instance];
    __weak typeof(self) weakSelf = self;
    self.operation = [[HBXHttpOperation alloc] initWithRequest:self.request manager:client Success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull value) {
        if (weakSelf.isActive) {
            [weakSelf onRequestSuccessWithJsonResponse:value];
            NSLog(@"success value is %@",value);
        }
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        if (weakSelf.isActive) {
            [weakSelf onRequestFailedWithError:error];
             NSLog(@"failure error is %@",error);
        }
    }];
    [client.operationQueue addOperation:self.operation];
}

- (void)stop {
    self.isActive = NO;
    if (self.operation) {
        [self.operation cancel];
        self.operation = nil;
    }
}

- (void)onRequestSuccessWithJsonResponse:(nullable id)response {
    if ([self isApiErrorResponse:response]) {
        //发生错误
        return;
    }
    if (self.classOfResponse) {
        [self notifiSuccessWithResponse:[self.classOfResponse yy_modelWithDictionary:response]];
    }else {
        [self notifiSuccessWithResponse:response];
    }
    
    
}

- (void)notifiSuccessWithResponse:(id)response {
    if (self.SuccessBlock && self.isActive) {
        self.SuccessBlock(response);
    }
}
- (void)notifiFailureWithError:(NSError *)error {
    if (self.FailureBlock && self.isActive) {
        self.FailureBlock(error);
    }
    
}

- (void)onRequestFailedWithError:(nullable NSError *)error {


}

- (BOOL)isApiErrorResponse:(id)response {
    if ([response isKindOfClass:[NSDictionary class]]) {
        NSString *code = response[BASE_Code];
        if (code.length > 0) {
            return code.integerValue != BASE_Code_ture;
        }
    }
    return NO;
}




@end
