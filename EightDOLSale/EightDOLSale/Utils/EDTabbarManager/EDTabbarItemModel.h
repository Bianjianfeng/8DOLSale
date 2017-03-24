//
//  EDTabbarItemModel.h
//  EightDOLSale
//
//  Created by bianjianfeng on 17/3/24.
//  Copyright © 2017年 Jeff_Bian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface EDTabbarItemModel : NSObject

/**  title */
@property (nonatomic, strong) NSString *itemTitle;

/**  image  */
@property (nonatomic, strong) UIImage *defaultImage;

/**  selected image  */
@property (nonatomic, strong) UIImage *selectedImage;

/**  image url */
@property (nonatomic, strong) NSString *defaultImageUrl;

/**  image url */
@property (nonatomic, strong) NSString *selectedImageUrl;


/**  图标是否是网络图片  */
@property (nonatomic, assign) BOOL imageFromNetwork;

@end
