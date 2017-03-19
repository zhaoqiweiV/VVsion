//
//  VNetworkManager.m
//  VVsion
//
//  Created by 赵祺伟 on 17/2/27.
//  Copyright © 2017年 KM赵. All rights reserved.
//

#import "VNetworkManager.h"
#import "AFNetworking.h"
@implementation VNetworkManager

+(instancetype)shareManager{
    
    static VNetworkManager * manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!manager) {
            manager= [[VNetworkManager alloc]init];
        }
    });
    return manager;
}

+(void)post:(NSString *)URLString parameters:(NSDictionary *)parameters success:(void (^)(id))success failue:(void (^)(NSError *))failue{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];//设置解析器
    [manager POST:URLString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failue) {
            failue(error);
        }
    }];
    
}

@end
