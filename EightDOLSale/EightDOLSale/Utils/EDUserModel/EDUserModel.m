//
//  EDUserModel.m
//  EightDOLSale
//
//  Created by bianjianfeng on 17/3/24.
//  Copyright © 2017年 Jeff_Bian. All rights reserved.
//

#import "EDUserModel.h"

@implementation EDUserModel

+ (EDUserModel *)shareInstance
{
    static EDUserModel *sharedInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}


@end
