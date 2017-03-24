//
//  EDTabbarManager.h
//  EightDOLSale
//
//  Created by bianjianfeng on 17/3/24.
//  Copyright © 2017年 Jeff_Bian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EDTabbarManager : NSObject

@property (nonatomic, readonly)NSArray *tabbarViewControllers;


@property (nonatomic, readonly)NSArray *tabbarItems;


+ (instancetype)shareInstance;

@end
