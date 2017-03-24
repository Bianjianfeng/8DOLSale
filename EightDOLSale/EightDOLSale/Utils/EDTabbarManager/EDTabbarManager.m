//
//  EDTabbarManager.m
//  EightDOLSale
//
//  Created by bianjianfeng on 17/3/24.
//  Copyright © 2017年 Jeff_Bian. All rights reserved.
//

#import "EDTabbarManager.h"
#import "JTNavigationController.h"
#import "EDRootViewController.h"
#import "EDTabbarItemModel.h"

#import "EDHomePageViewController.h"
@interface EDTabbarManager ()

@property (nonatomic, strong)NSArray *tabbarViewControllers;
@property (nonatomic, strong)NSArray *tabbarItems;

@end

@implementation EDTabbarManager

+ (instancetype)shareInstance
{
    static EDTabbarManager *sharedInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setDefaultTabbarViewControllers];
    }
    return self;
}


- (void)setDefaultTabbarViewControllers
{
    [self setTabbarItems];

    EDHomePageViewController *first = [EDHomePageViewController new];
    first.tabBarItem = self.tabbarItems[0];
    JTNavigationController *firstVC = [self createNavigationWithController:first];
    first.title = @"首页";
    
    EDRootViewController *second = [EDRootViewController new];
    second.tabBarItem = self.tabbarItems[1];

    JTNavigationController *secondVC = [self createNavigationWithController:second];
    second.title = @"secondVC";

    EDRootViewController *third = [EDRootViewController new];
    third.tabBarItem = self.tabbarItems[2];

    JTNavigationController *thirdVC = [self createNavigationWithController:third];
    third.title = @"thirdVC";

    self.tabbarViewControllers = @[firstVC,secondVC,thirdVC];
}


- (JTNavigationController *)createNavigationWithController:(EDRootViewController *)controller
{
    JTNavigationController *nav = [[JTNavigationController alloc]initWithRootViewController:controller];
    nav.fullScreenPopGestureEnabled = YES;
    return nav;
}

- (void)setTabbarItems
{
    NSArray *tabbarTitles = @[@"first", @"second", @"third"];
    NSMutableArray *tabbarList = [NSMutableArray array];
    for (int i = 0;i < tabbarTitles.count;i++) {
        NSString *itemTitle = [tabbarTitles objectAtIndex:i];
        UIImage *selectedimage = [UIImage imageNamed:[NSString stringWithFormat:@"%@_selected", itemTitle]];
        UIImage *unselectedimage = [UIImage imageNamed:[NSString stringWithFormat:@"%@_normal",itemTitle]];
        UITabBarItem *item = [[UITabBarItem alloc]initWithTitle:itemTitle image:unselectedimage selectedImage:selectedimage];
//        EDTabbarItemModel *itemModel = [EDTabbarItemModel new];
//        itemModel.itemTitle = itemTitle;
//        itemModel.defaultImage = unselectedimage;
//        itemModel.selectedImage = selectedimage;

        [tabbarList addObject:item];
    }
    self.tabbarItems = [NSArray arrayWithArray:tabbarList];
    
}


#pragma mark -
#pragma mark --------public methods--------

- (NSArray *)tabbarViewControllers
{
    if (!_tabbarViewControllers) {
        _tabbarViewControllers = [NSArray array];
    }
    return _tabbarViewControllers;
}

- (NSArray *)tabbarItems
{
    if (!_tabbarItems) {
        _tabbarItems = [NSArray array];
    }
    return _tabbarItems;
}



@end
