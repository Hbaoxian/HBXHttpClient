//
//  ViewController.m
//  HBXHttpClient
//
//  Created by 黄保贤 on 16/5/26.
//  Copyright © 2016年 黄保贤. All rights reserved.
//

#import "ViewController.h"
#import "HBXHTTPClientDefine.h"
#import "AFURLSessionManager.h"
#import "AFHTTPSessionManager.h"

@interface ViewController ()

@property (nonatomic , strong) HBXAPIRequestOperation *operation;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /*
     http://image.baidu.com/search/detail?ct=503316480&z=&tn=baiduimagedetail&ipn=d&word=%E8%B5%B5%E4%B8%BD%E9%A2%96&step_word=&ie=utf-8&in=&cl=2&lm=-1&st=-1&cs=1282061332,2653073408&os=1296157872,2268625425&pn=1&rn=1&di=0&ln=1000&fr=&fmq=1463574796370_R&fm=&ic=0&s=undefined&se=&sme=&tab=0&width=&height=&face=undefined&is=&istype=2&ist=&jit=&bdtype=-1&gsm=0&objurl=http%3A%2F%2Fwww.junshiqianyanwang.com%2Fuploads%2Fallimg%2F150208%2F14453132W_1.png&rpstart=0&rpnum=0
     */
    self.operation = [HBXHTTPRequestFactory operationWithMethod:@"get" api:@"search/detail?ct=503316480&z=&tn=baiduimagedetail&ipn=d&word=%E8%B5%B5%E4%B8%BD%E9%A2%96&step_word=&ie=utf-8&in=&cl=2&lm=-1&st=-1&cs=1282061332,2653073408&os=1296157872,2268625425&pn=1&rn=1&di=0&ln=1000&fr=&fmq=1463574796370_R&fm=&ic=0&s=undefined&se=&sme=&tab=0&width=&height=&face=undefined&is=&istype=2&ist=&jit=&bdtype=-1&gsm=0&objurl=http%3A%2F%2Fwww.junshiqianyanwang.com%2Fuploads%2Fallimg%2F150208%2F14453132W_1.png&rpstart=0&rpnum=0" arguments:nil token:nil];
    
    self.operation.SuccessBlock = ^(id response){
        NSLog(@"%@",response);
    };
    
    self.operation.FailureBlock = ^(NSError *error){
        NSLog(@"%@",error);
    };
    [self.operation start];
    
//    AFHTTPSessionManager  *manager = [AFHTTPSessionManager  manager];
//    
//    [manager GET:@"http://image.baidu.com/search/detail?ct=503316480&z=&tn=baiduimagedetail&ipn=d&word=%E8%B5%B5%E4%B8%BD%E9%A2%96&step_word=&ie=utf-8&in=&cl=2&lm=-1&st=-1&cs=1282061332,2653073408&os=1296157872,2268625425&pn=1&rn=1&di=0&ln=1000&fr=&fmq=1463574796370_R&fm=&ic=0&s=undefined&se=&sme=&tab=0&width=&height=&face=undefined&is=&istype=2&ist=&jit=&bdtype=-1&gsm=0&objurl=http%3A%2F%2Fwww.junshiqianyanwang.com%2Fuploads%2Fallimg%2F150208%2F14453132W_1.png&rpstart=0&rpnum=0" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        
//    }];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
