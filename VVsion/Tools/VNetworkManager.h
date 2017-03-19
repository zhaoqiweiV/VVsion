//
//  VNetworkManager.h
//  VVsion
//
//  Created by 赵祺伟 on 17/2/27.
//  Copyright © 2017年 KM赵. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VNetworkManager : NSObject

+(instancetype)shareManager;

+(void)post:(NSString*)URLString parameters:(NSDictionary *)parameters success:(void(^)(id respontObject))success failue:(void(^)(NSError * error))failue;



@end
