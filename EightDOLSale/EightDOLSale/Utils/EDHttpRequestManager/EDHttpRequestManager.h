//
//  EDHttpRequestManager.h
//  EightDOLSale
//
//  Created by bianjianfeng on 17/3/24.
//  Copyright © 2017年 Jeff_Bian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface EDHttpRequestManager : NSObject

+ (EDHttpRequestManager *)manager;


- (void)GET:(NSString *)URLString
 parameters:(NSDictionary *)parameters
    success:(void (^)(NSURLSessionDataTask * task, id responseObject))success
    failure:(void (^)(NSURLSessionDataTask * task, NSError * error))failure;

- (void)POST:(NSString *)URLString
  parameters:(NSDictionary *)parameters
     success:(void (^)(NSURLSessionDataTask * task, id responseObject))success
     failure:(void (^)(NSURLSessionDataTask * task, NSError * error))failure;

- (void)PUT:(NSString *)URLString
 parameters:(NSDictionary *)parameters
    success:(void (^)(NSURLSessionDataTask * task, id responseObject))success
    failure:(void (^)(NSURLSessionDataTask * task, NSError *error))failure;

- (void)GET:(NSString *)URLString
 parameters:(NSDictionary *)parameters
    cookies:(NSArray *)cookies
    success:(void (^)(NSURLSessionDataTask * task, id responseObject))success
    failure:(void (^)(NSURLSessionDataTask * task, NSError * error))failure;


- (void)GET:(NSString *)URLString
 parameters:(NSDictionary *)parameters
withOutUserInfo:(BOOL)withOutUserInfo
    success:(void (^)(NSURLSessionDataTask * task, id responseObject))success
    failure:(void (^)(NSURLSessionDataTask * task, NSError * error))failure;

- (void)GET:(NSString *)URLString
 parameters:(NSDictionary *)parameters
   location:(BOOL)needLocation
    success:(void (^)(NSURLSessionDataTask * task, id responseObject))success
    failure:(void (^)(NSURLSessionDataTask * task, NSError * error))failure;



@end
