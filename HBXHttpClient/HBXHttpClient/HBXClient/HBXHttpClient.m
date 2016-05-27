//
//  HBXHttpClient.m
//  HBXHttpClient
//
//  Created by 黄保贤 on 16/5/26.
//  Copyright © 2016年 黄保贤. All rights reserved.
//

#import "HBXHttpClient.h"

static HBXHttpClient *_httpClient = nil;

@interface HBXHttpClient ()

@property (nullable, nonatomic, strong) NSOperationQueue *opeationQueue;

@end


@implementation HBXHttpClient

+ (HBXHttpClient *)instance {
    @synchronized (self) {
        if (!_httpClient) {
            _httpClient = [[self alloc] initWithBaseURL:[NSURL URLWithString:BASE_URL]];
        }
    }
     return _httpClient;
}
- (instancetype)initWithBaseURL:(NSURL *)url {
    if (self = [super initWithBaseURL:url]) {
        self.opeationQueue = [[NSOperationQueue alloc] init];
        [self.opeationQueue setMaxConcurrentOperationCount:NSOperationQueueDefaultMaxConcurrentOperationCount];
    }
    return self;
}
+ (void)destory {
    _httpClient = nil;
}




- (NSMutableURLRequest *)requestWithMethod:(NSString *)method
                                      path:(NSString *)path
                                parameters:(NSDictionary *)parameters {

    
    return [self requestWithMethod:method path:path parameters:parameters timeout:15.f];

}
- (NSMutableURLRequest *)requestWithMethod:(NSString *)method
                                      path:(NSString *)path
                                parameters:(NSDictionary *)parameters
                                   timeout:(NSTimeInterval)timeout
{
    
    if (parameters) {
        if ([method isEqualToString:@"GET"] || [method isEqualToString:@"HEAD"] ||
            [method isEqualToString:@"POST"] || [method isEqualToString:@"DELETE"]) {
            NSMutableDictionary *mutableParameters = [parameters mutableCopy];
            parameters = [NSDictionary dictionaryWithDictionary:mutableParameters];
        }
    }
    NSURL *url = [NSURL URLWithString:path relativeToURL:self.baseURL];
    NSMutableURLRequest *request = [self.requestSerializer requestWithMethod:method URLString:[url absoluteString] parameters:parameters error:nil];
    return request;
}


@end
