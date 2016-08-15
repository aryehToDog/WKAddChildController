//
//  WKOneController.m
//  父子控制器
//
//  Created by 阿拉斯加的狗 on 16/8/15.
//  Copyright © 2016年 阿拉斯加的🐶. All rights reserved.
//

#import "WKOneController.h"

@interface WKOneController ()

@end

@implementation WKOneController


NSString *ID = @"cell";
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:ID];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    cell.textLabel.text = [NSString stringWithFormat:@"cell----%d",indexPath.row];
    
    return cell;


}


@end
