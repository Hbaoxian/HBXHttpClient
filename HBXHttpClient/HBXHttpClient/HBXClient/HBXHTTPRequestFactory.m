//
//  HBXHTTPRequestFactory.m
//  HBXHttpClient
//
//  Created by 黄保贤 on 16/5/27.
//  Copyright © 2016年 黄保贤. All rights reserved.
//

#import "HBXHTTPRequestFactory.h"
#import "HBXHttpClient.h"

@implementation HBXHTTPRequestFactory

+ (HBXAPIRequestOperation *)operationWithMethod:(NSString *)method api:(NSString *)api arguments:(NSDictionary *)args token:(NSString *)token {
    NSMutableDictionary *mutableArgs = [NSMutableDictionary dictionary];
    if (token) {
        [mutableArgs setObject:token forKey:@"token"];
    }
    if (args) {
        [mutableArgs addEntriesFromDictionary:args];
    }
    NSMutableURLRequest *request = [[HBXHttpClient instance] requestWithMethod:method path:api parameters:mutableArgs];
    return [[HBXAPIRequestOperation alloc] initWithRequest:request];
}

@end
