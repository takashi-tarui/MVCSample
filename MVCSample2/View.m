//
//  View.m
//  MVCSample
//
//  Created by tarui takashi on 2015/11/28.
//  Copyright © 2015年 takashi tarui. All rights reserved.
//

#import "View.h"
#import "Model.h"

@implementation View

- (id) init {
    if (self = [super init]) {
        self.delegate = self;
        self.dataSource = self;
    }
    return self;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [[Model sharedInstance].ary count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier: @"Cell"];
    }

    // アプリデータの取得
    NSArray *appItem = [[Model sharedInstance].ary objectAtIndex:indexPath.row];
    
    // Noラベルの表示
    UILabel* labelNo =  [[UILabel alloc] initWithFrame:CGRectMake(20, 15, 50, 50)];
    labelNo.text = [NSString stringWithFormat:@"%ld", indexPath.row+1];
    
    // アプリアイコンの表示
    UIImageView* imageIcon = [[UIImageView alloc] initWithFrame:CGRectMake(50, 15, 50, 50)];
    NSString *icon = [appItem valueForKey:@"icon"];
    UIImage *image = [UIImage imageNamed:icon];
    imageIcon.image = image;
    
    // アプリ名の表示
    UILabel* labelName =  [[UILabel alloc] initWithFrame:CGRectMake(150, 15, 200, 50)];
    NSString *name = [appItem valueForKey:@"name"];
    labelName.text = name;
    
    [cell.contentView addSubview:labelNo];
    [cell.contentView addSubview:imageIcon];
    [cell.contentView addSubview:labelName];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
