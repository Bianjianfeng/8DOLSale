//
//  EDEmptyObjectCheck.m
//  EightDOLSale
//
//  Created by bianjianfeng on 17/3/24.
//  Copyright © 2017年 Jeff_Bian. All rights reserved.
//

#import "EDEmptyObjectCheck.h"

/**
 *  检查对象是否为nil,NULL,@"",@[],@{}
 *
 *  @param object 对象
 *
 *  @return 空 YES
 *
 *  @since 1.0
 */
BOOL EDEmptyObjectCheck(id object)
{
    if ([object isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if (!object) {
        return YES;
    }
    if ([object isKindOfClass:[NSString class]]) {
        if (((NSString *)object).length == 0){
            return YES;
        }
    }
    if ([object isKindOfClass:[NSArray class]]) {
        if (((NSArray *)object).count == 0){
            return YES;
        }
    }
    if ([object isKindOfClass:[NSDictionary class]]) {
        if (((NSDictionary *)object).allKeys.count == 0){
            return YES;
        }
    }
    
    return NO;
}
