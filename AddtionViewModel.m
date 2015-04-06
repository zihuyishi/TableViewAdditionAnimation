//
//  AddtionViewModel.m
//  testAdditionTableVC
//
//  Created by 李冲 on 15/4/3.
//  Copyright (c) 2015年 Li Chong. All rights reserved.
//

#import "AddtionViewModel.h"

@implementation AddtionViewModel

- (instancetype)initWithIndexPath:(NSIndexPath *)indexPath
{
    self = [super init];
    if (self) {
        _text = [NSString stringWithFormat:@"at %ld row", (long)indexPath.row];
        _isShowAddition = NO;
    }
    return self;
}

@end
