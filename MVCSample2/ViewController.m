//
//  ViewController.m
//  MVCSample
//
//  Created by tarui takashi on 2015/11/28.
//  Copyright © 2015年 takashi tarui. All rights reserved.
//

#import "ViewController.h"
#import "View.h"
#import "Model.h"

@interface ViewController ()
@property (nonatomic,strong) View *view;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view = [[View alloc]init];
    [self setView:self.view];
    
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    // KVO監視を始める
    [[Model sharedInstance] addObserver:self forKeyPath:@"ary" options:NSKeyValueObservingOptionNew context:nil];
    [[Model sharedInstance] rankingData];
}

- (void)viewWillDisappear:(BOOL)animated {
    
    [super viewWillDisappear:animated];
    
    // KVO監視を解除する
    [[Model sharedInstance] removeObserver:self forKeyPath:@"ary"];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"ary"]) {
        [self.view.tableView reloadData];
    }
    
}

@end
