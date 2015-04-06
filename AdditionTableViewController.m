//
//  AdditionTableViewController.m
//  testAdditionTableVC
//
//  Created by 李冲 on 15/4/3.
//  Copyright (c) 2015年 Li Chong. All rights reserved.
//

#import "AdditionTableViewController.h"
#import "AddtionViewModel.h"
#import "AdditionTableViewCell.h"

static const int CellCounts = 10;

@interface AdditionTableViewController ()
{
    NSMutableArray      *_cellModels;
    NSUInteger          _lastShowAdditionIndex;
}


@end

@implementation AdditionTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [self.tableView setRowHeight:30];
    _cellModels = [NSMutableArray arrayWithCapacity:CellCounts];
    for (int i = 0; i < CellCounts; ++i) {
        AddtionViewModel *model = [[AddtionViewModel alloc] initWithIndexPath:[NSIndexPath indexPathForItem:i inSection:0]];
        [_cellModels addObject:model];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return CellCounts;
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    AdditionTableViewCell *cell = (AdditionTableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
    AddtionViewModel *model = [_cellModels objectAtIndex:indexPath.row];
    
    AdditionTableViewCell *lastCell = (AdditionTableViewCell *)[tableView cellForRowAtIndexPath:[NSIndexPath indexPathForItem:_lastShowAdditionIndex inSection:0]];
    AddtionViewModel *lastModel = [_cellModels objectAtIndex:_lastShowAdditionIndex];
    
    lastModel.isShowAddition = NO;
    model.isShowAddition = YES;
    
    [tableView beginUpdates];
    lastCell.additionHeight.constant = 0;
    lastCell.accessoryType = UITableViewCellAccessoryDetailButton;
    cell.additionHeight.constant = 30;
    cell.accessoryType = UITableViewCellAccessoryNone;
    
    [UIView animateWithDuration:0.75 animations:^{
        [tableView endUpdates];
    }];
    _lastShowAdditionIndex = indexPath.row;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AdditionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"additionCell" forIndexPath:indexPath];
    // Configure the cell...
    AddtionViewModel *cellModel = [_cellModels objectAtIndex:indexPath.row];
    cell.cellModel = cellModel;
    cell.hideButton.tag = indexPath.row;
    [cell.hideButton addTarget:self action:@selector(onHideAddition:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AddtionViewModel *cellModel = [_cellModels objectAtIndex:indexPath.row];
    if (cellModel.isShowAddition) {
        return 60;
    } else {
        return 30;
    }

}

- (void)onHideAddition:(UIButton *)sender
{
    AdditionTableViewCell *cell = (AdditionTableViewCell *)[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForItem:sender.tag inSection:0]];
    AddtionViewModel *model = [_cellModels objectAtIndex:sender.tag];
    model.isShowAddition = NO;
    [UIView animateWithDuration:0.75 animations:^{
        cell.additionHeight.constant = 0;
        [self.tableView reloadData];
    }];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
