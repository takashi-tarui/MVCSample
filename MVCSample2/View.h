//
//  View.h
//  MVCSample
//
//  Created by tarui takashi on 2015/11/28.
//  Copyright © 2015年 takashi tarui. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface View : UITableView<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic) UITableView* tableView;

@end
