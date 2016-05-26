//
//  HBXAPIRequestOperation.h
//  HBXHttpClient
//
//  Created by 黄保贤 on 16/5/26.
//  Copyright © 2016年 黄保贤. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HBXAPIRequestOperation : NSObject

/*
 *  发送请求
 */
@property (nullable, nonatomic, strong) NSURLRequest *request;

/*
 *  返回数据
 */
@property (nullable, nonatomic, strong) id response;
/*
 *  返回数据映射
 */
@property (nullable, nonatomic, strong) Class classOfResponse;

/*
 *  请求成功回调
 */
@property (nullable, nonatomic, copy) void(^SuccessBlock)(id _Nullable response);
/*
 *  请求失败回调
 */
@property (nullable, nonatomic ,copy) void(^FailureBlock)( NSError * _Nullable error);

/*
 *   初始化
 */

- (nullable instancetype)initWithRequest:(nullable NSURLRequest *)request;

/*
 *  加入列队
 */

- (void)start;

/*
 *  结束请求
 */
- (void)stop;






@end
