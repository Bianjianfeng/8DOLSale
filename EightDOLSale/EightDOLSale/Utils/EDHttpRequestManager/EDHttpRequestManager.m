//
//  EDHttpRequestManager.m
//  EightDOLSale
//
//  Created by bianjianfeng on 17/3/24.
//  Copyright © 2017年 Jeff_Bian. All rights reserved.
//

#import "EDHttpRequestManager.h"

static CGFloat const RequestTimeoutInterval = 25.f;

@interface EDHttpRequestManager ()

@property (nonatomic, strong)AFHTTPSessionManager *sessionManager;
@end

@implementation EDHttpRequestManager


- (instancetype)init{
    self = [super init];
    if (self) {
        _sessionManager = [AFHTTPSessionManager manager];
        _sessionManager.responseSerializer = [[AFHTTPResponseSerializer alloc]init];
        
        //#warning HTTPS SSL INVALIDCER
        _sessionManager.securityPolicy  = [self setHttpsRequestSecurityPolicy];
    }
    return self;
}


+ (EDHttpRequestManager *)manager
{
    static EDHttpRequestManager *sharedHttpRequestManagerInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sharedHttpRequestManagerInstance = [[self alloc] init];
    });
    return sharedHttpRequestManagerInstance;
}

/**
 *  请求https安全策略
 *
 *  @since 2.5.1
 */
- (AFSecurityPolicy *)setHttpsRequestSecurityPolicy
{
    //    NSString *cerPath = [[NSBundle mainBundle] pathForResource:@"8dol.cer" ofType:nil];
    //    NSData  *certData = [NSData dataWithContentsOfFile:cerPath];
    //    AFSecurityPolicy *securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate];
    //    securityPolicy.pinnedCertificates = @[certData];
    AFSecurityPolicy *securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    securityPolicy.allowInvalidCertificates = YES;
    securityPolicy.validatesDomainName = NO;
    return securityPolicy;
}


- (void)GET:(NSString *)URLString
 parameters:(NSDictionary *)parameters
    success:(void (^)(NSURLSessionDataTask *, id))success
    failure:(void (^)(NSURLSessionDataTask *, NSError *))failure
{
    [self requestMethod:@"GET" url:URLString parameters:parameters success:success failure:failure];
}

- (void)GET:(NSString *)URLString
 parameters:(NSDictionary *)parameters
    cookies:(NSArray *)cookies
    success:(void (^)(NSURLSessionDataTask * task, id responseObject))success
    failure:(void (^)(NSURLSessionDataTask * task, NSError * error))failure
{
    [self requestMethod:@"GET" url:URLString parameters:parameters cookies:(NSArray *)cookies location:YES withOutUserInfo:NO  success:success failure:failure];
}

- (void)POST:(NSString *)URLString
  parameters:(NSDictionary *)parameters
     success:(void (^)(NSURLSessionDataTask *, id))success
     failure:(void (^)(NSURLSessionDataTask *, NSError *))failure
{
    [self requestMethod:@"POST" url:URLString parameters:parameters success:success failure:failure];
}

- (void)PUT:(NSString *)URLString
 parameters:(NSDictionary *)parameters
    success:(void (^)(NSURLSessionDataTask *, id))success
    failure:(void (^)(NSURLSessionDataTask *, NSError *))failure
{
    [self requestMethod:@"PUT" url:URLString parameters:parameters success:success failure:failure];
}

- (void)GET:(NSString *)URLString
 parameters:(NSDictionary *)parameters
withOutUserInfo:(BOOL)withOutUserInfo
    success:(void (^)(NSURLSessionDataTask * task, id responseObject))success
    failure:(void (^)(NSURLSessionDataTask * task, NSError * error))failure
{
    [self requestMethod:@"GET" url:URLString parameters:parameters cookies:nil location:YES withOutUserInfo:withOutUserInfo success:success failure:failure];
}

- (void)GET:(NSString *)URLString
 parameters:(NSDictionary *)parameters
   location:(BOOL)needLocation
    success:(void (^)(NSURLSessionDataTask * task, id responseObject))success
    failure:(void (^)(NSURLSessionDataTask * task, NSError * error))failure
{
    [self requestMethod:@"GET" url:URLString parameters:parameters cookies:nil location:needLocation withOutUserInfo:NO success:success failure:failure];
}

- (void)requestMethod:(NSString *)method
                  url:(NSString *)urlStr
           parameters:(NSDictionary *)parameters
              success:(void (^)(NSURLSessionDataTask *, id))success
              failure:(void (^)(NSURLSessionDataTask *, NSError *))failure
{
    [self requestMethod:method url:urlStr parameters:parameters cookies:nil location:YES withOutUserInfo:NO success:success failure:failure];
}

- (void)requestMethod:(NSString *)method
                  url:(NSString *)urlStr
           parameters:(NSDictionary *)parameters
      withOutUserInfo:(BOOL)withOutUserInfo
              success:(void (^)(NSURLSessionDataTask *, id))success
              failure:(void (^)(NSURLSessionDataTask *, NSError *))failure
{
    [self requestMethod:method url:urlStr parameters:parameters cookies:nil location:YES withOutUserInfo:withOutUserInfo success:success failure:failure];
}

- (void)requestMethod:(NSString *)method
                  url:(NSString *)urlStr
           parameters:(NSDictionary *)parameters
              cookies:(NSArray *)cookies
             location:(BOOL)needLocation
      withOutUserInfo:(BOOL)withOutUserInfo
              success:(void (^)(NSURLSessionDataTask *, id))success
              failure:(void (^)(NSURLSessionDataTask *, NSError *))failure
{
    
    NSMutableDictionary *reqDataDic = [NSMutableDictionary dictionaryWithDictionary:parameters];
    if (!withOutUserInfo) {
        NSString *version = [NSString stringWithFormat:@"IOS_%@",[[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"]];
//        NSString *userId = [GlobalData shareInstance].mUserInfo.mId?:@"";
//        NSString *verifyCode = [GlobalData shareInstance].mUserInfo.mVerify_code?:@"";
        
//        [reqDataDic setObject:userId forKey:@"userId"];
//        [reqDataDic setObject:verifyCode forKey:@"verifyCode"];
//        [reqDataDic setObject:userId forKey:@"user_id"];
//        [reqDataDic setObject:verifyCode forKey:@"verify_code"];
//        [reqDataDic setObject:version forKey:@"app_version"];
//        [reqDataDic setObject:[MyUtil get_Idfa] forKey:@"deviceNo"];
        
        //        NSString *deviceName = [NSString stringWithFormat:@"%@,%@",[MyUtil iphoneType],[MyUtil deviceName]];
//        NSString *deviceName = [NSString stringWithFormat:@"%@",[MyUtil iphoneType]];
//        deviceName = [deviceName stringByReplacingOccurrencesOfString:@" " withString:@""];
//        [reqDataDic setObject:deviceName forKey:@"deviceName"];
        
    }
    
//    if (needLocation) {
//        if ([LocationService shareService].userLocation) {
//            CGFloat longitude = [LocationService shareService].userLocation.location.coordinate.longitude;
//            CGFloat latitude = [LocationService shareService].userLocation.location.coordinate.latitude;
//            NSString *userLongitude = [NSString stringWithFormat:@"%.6f",longitude];
//            NSString *userLatitude = [NSString stringWithFormat:@"%.6f",latitude];
//            [reqDataDic setObject:userLongitude forKey:@"longitude"];
//            [reqDataDic setObject:userLatitude forKey:@"latitude"];
//        }
//    }
    
    
    AFHTTPSessionManager *manger = [EDHttpRequestManager manager].sessionManager;
    manger.requestSerializer = [AFHTTPRequestSerializer serializer];
    
    [manger.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    manger.requestSerializer.timeoutInterval = RequestTimeoutInterval;
    [manger.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    
//    if (!EmptyObjectCheck(cookies)) {
        NSDictionary *fieldDic = [NSHTTPCookie requestHeaderFieldsWithCookies:cookies];
        for (NSString *key in fieldDic.allKeys) {
            [manger.requestSerializer setValue:fieldDic[key] forHTTPHeaderField:key];
        }
//    }
    //打印请求信息
//    [MyUtil printRequestString:urlStr paramters:reqDataDic];
    
    if ([method isEqualToString:@"GET"]) {
        [manger GET:urlStr parameters:reqDataDic progress:nil success:^(NSURLSessionDataTask * task, id responseObject) {
            if (![self checkUserTokenIsLegal:responseObject]) return ;
            success(task,responseObject);
            
        } failure:^(NSURLSessionDataTask * task, NSError * error) {
            failure(task,error);
        }];
    }else if ([method isEqualToString:@"POST"]) {
        [manger POST:urlStr parameters:reqDataDic progress:nil success:^(NSURLSessionDataTask * task, id  responseObject) {
            if (![self checkUserTokenIsLegal:responseObject]) return ;
            success(task,responseObject);
        } failure:^(NSURLSessionDataTask * task, NSError * error) {
            failure(task,error);
        }];
    }else if ([method isEqualToString:@"PUT"]) {
        [manger PUT:urlStr parameters:reqDataDic success:^(NSURLSessionDataTask * task, id  responseObject) {
            if (![self checkUserTokenIsLegal:responseObject]) return ;
            success(task,responseObject);
        } failure:^(NSURLSessionDataTask * task, NSError * error) {
            failure(task,error);
        }];
    }
    
}

/**
 *  检测请求操作是否合法
 *
 *  @param response 返回参数
 *
 *  @return 是否合法
 *
 *  @since 2.5.1
 */
- (BOOL)checkUserTokenIsLegal:(id)response
{
//    NSDictionary *resDic = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingAllowFragments error:nil];
//    
//    NSInteger rescode = [[NetDataCommon stringFromDic:resDic forKey:@"rescode"] integerValue];
//    if (rescode == 9401) {
//        [ProgressHUD dismiss];
//        NSString *errorMsg = [NetDataCommon stringFromDic:resDic forKey:@"msg"];
//        if (EmptyObjectCheck(errorMsg)) {
//            errorMsg = @"您的账号可能存在问题，请重新登录";
//        }
//        /**
//         *  登录信息异常取消当前所有请求
//         *
//         *  @since 2.5.1
//         */
//        AFHTTPSessionManager *manager = [HttpRequestManager manager].sessionManager;
//        [manager.operationQueue cancelAllOperations];
//        
//        [PXAlertView dismissAllAlertView];
//        
//        [MyUtil signOut];
//        
//        [PXAlertView showAlertWithTitle:ALERT_TITLE message:errorMsg cancelTitle:ALERT_OK completion:^(BOOL cancelled) {
//            
//            AppDelegate *appdelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
//            
//            //登录页面不弹出
//            if ([appdelegate.window.rootViewController isKindOfClass:[NewLogInViewController class]]) {
//                return;
//            }
//            [appdelegate initLoginView];
//        }];
//        return NO;
//    }
    return YES;
}


@end
