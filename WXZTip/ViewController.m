//
//  ViewController.m
//  WXZTip
//
//  Created by wxz on 2017/8/31.
//  Copyright © 2017年 wxz. All rights reserved.
//

#import "ViewController.h"
#import "WXZTipView.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, copy) NSArray *dataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataArray = @[@"我在上方默认",@"我在上方3秒",@"我在中间默认",@"我在中间3秒",@"我在下方默认",@"我在下方3秒"];
    [self.view addSubview:self.tableView];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.textLabel.text = self.dataArray[indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSString *tip = self.dataArray[indexPath.row];
    
    switch (indexPath.row) {
        case 0:
            [WXZTipView showTopWithText:tip];
            break;
        case 1:
            [WXZTipView showTopWithText:tip duration:3];
            break;
        case 2:
            [WXZTipView showCenterWithText:tip];
            break;
        case 3:
            [WXZTipView showCenterWithText:tip duration:3];
            break;
        case 4:
            [WXZTipView showBottomWithText:tip];
            break;
        case 5:
            [WXZTipView showBottomWithText:tip duration:3];
            break;
            
        default:
            break;
    }
}
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [[UIView alloc]init];
        
    }
    return _tableView;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
