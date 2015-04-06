//
//  AdditionTableViewCell.m
//  testAdditionTableVC
//
//  Created by 李冲 on 15/4/3.
//  Copyright (c) 2015年 Li Chong. All rights reserved.
//

#import "AdditionTableViewCell.h"

@interface AdditionTableViewCell()

@property (nonatomic) UILabel *mainLabel;
@property (nonatomic) UIView *addtionView;

@property (nonatomic) NSMutableArray *constraints;
@end

@implementation AdditionTableViewCell

- (void)awakeFromNib {
    // Initialization code
    self.mainLabel = [[UILabel alloc] init];
    self.mainLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:self.mainLabel];
    
    self.addtionView = [[UIView alloc] init];
    [self.addtionView setBackgroundColor:[UIColor colorWithRed:0x66/255. green:0xcc/255. blue:0xff/255. alpha:0.7]];
    self.addtionView.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:self.addtionView];
    
    self.hideButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 5, 100, 20)];
    [self.hideButton setTitle:@"隐藏" forState:UIControlStateNormal];
    [self.hideButton setBackgroundColor:[UIColor blackColor]];
    [self.hideButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.addtionView addSubview:self.hideButton];
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.layer.masksToBounds = YES;
    [self chooseConstraint];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setCellModel:(AddtionViewModel *)cellModel
{
    _cellModel = cellModel;
    self.mainLabel.text = _cellModel.text;
    if (!_cellModel.isShowAddition) {
        self.accessoryType = UITableViewCellAccessoryDetailButton;
    } else {
        self.accessoryType = UITableViewCellAccessoryNone;
    }
}


- (void)chooseConstraint
{
    if (self.constraints) {
        [self removeConstraints:self.constraints];
        self.constraints = nil;
    }
    self.constraints = [NSMutableArray array];
    NSDictionary *viewsDict = NSDictionaryOfVariableBindings(_mainLabel, _addtionView);
    
    [self.constraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-3-[_mainLabel(20)]" options:0 metrics:nil views:viewsDict]];
    [self.constraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-5-[_mainLabel]-5-|" options:0 metrics:nil views:viewsDict]];
    [self.constraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_mainLabel]-10-[_addtionView]" options:0 metrics:nil views:viewsDict]];
    [self.constraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[_addtionView]-0-|" options:0 metrics:nil views:viewsDict]];
    self.additionHeight = [NSLayoutConstraint constraintWithItem:self.addtionView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:0 constant:0];

    [self addConstraints:self.constraints];
    [self addConstraint:self.additionHeight];
}

@end
