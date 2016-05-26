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
            _httpClient = [[HBXHttpClient alloc] initWithBaseURL:[NSURL URLWithString:BASE_URL]];
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


@end
