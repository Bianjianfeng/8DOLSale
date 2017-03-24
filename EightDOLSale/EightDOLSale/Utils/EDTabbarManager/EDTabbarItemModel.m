//
//  EDTabbarItemModel.m
//  EightDOLSale
//
//  Created by bianjianfeng on 17/3/24.
//  Copyright © 2017年 Jeff_Bian. All rights reserved.
//

#import "EDTabbarItemModel.h"
#import "EDEmptyObjectCheck.h"
@implementation EDTabbarItemModel


- (BOOL)imageFromNetwork
{
    return (!EDEmptyObjectCheck(self.defaultImageUrl) && !EDEmptyObjectCheck(self.selectedImageUrl));
}

@end
