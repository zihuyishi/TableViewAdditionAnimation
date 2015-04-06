//
//  AddtionViewModel.h
//  testAdditionTableVC
//
//  Created by 李冲 on 15/4/3.
//  Copyright (c) 2015年 Li Chong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddtionViewModel : NSObject

@property (nonatomic, readonly) NSString *text;
@property (nonatomic) BOOL isShowAddition;

- (instancetype)initWithIndexPath:(NSIndexPath *)indexPath;

@end
