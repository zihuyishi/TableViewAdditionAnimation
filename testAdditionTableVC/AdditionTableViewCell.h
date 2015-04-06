//
//  AdditionTableViewCell.h
//  testAdditionTableVC
//
//  Created by 李冲 on 15/4/3.
//  Copyright (c) 2015年 Li Chong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddtionViewModel.h"

@interface AdditionTableViewCell : UITableViewCell

@property (nonatomic) AddtionViewModel *cellModel;
@property (nonatomic) UIButton *hideButton;
@property (nonatomic) NSLayoutConstraint *additionHeight;

@end
