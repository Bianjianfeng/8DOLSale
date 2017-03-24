//
//  EDUserModel.h
//  EightDOLSale
//
//  Created by bianjianfeng on 17/3/24.
//  Copyright © 2017年 Jeff_Bian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EDUserModel : NSObject

/**  用户id  */
@property (nonatomic, strong) NSString *userId;

/**  用户标识code  */
@property (nonatomic, strong) NSString *verifyCode;


+ (EDUserModel *)shareInstance;


@end
