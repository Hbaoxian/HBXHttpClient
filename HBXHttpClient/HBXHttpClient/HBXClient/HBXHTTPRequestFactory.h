//
//  HBXHTTPRequestFactory.h
//  HBXHttpClient
//
//  Created by 黄保贤 on 16/5/27.
//  Copyright © 2016年 黄保贤. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HBXAPIRequestOperation.h"


@interface HBXHTTPRequestFactory : NSObject

+ (HBXAPIRequestOperation *)operationWithMethod:(NSString *)method api:(NSString *)api arguments:(NSDictionary *)args token:(NSString *)token;

@end
