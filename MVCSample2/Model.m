//
//  Model.m
//  MVCSample
//
//  Created by tarui takashi on 2015/11/28.
//  Copyright © 2015年 takashi tarui. All rights reserved.
//

#import "Model.h"

@implementation Model

static Model *_instance;


+ (void)initialize {
    
    @synchronized(self) {
        if (_instance == nil) {
            _instance = [[Model alloc] initInternal];
        }
    }
}

+ (Model *)sharedInstance {
    
    return _instance;
}

- (id)init{
    
    [self doesNotRecognizeSelector:_cmd];
    return nil;
}

- (id)initInternal {
    
    self = [super init];

    return self;
}

-(NSMutableArray *)appList
{
    NSDictionary* dict1 = @{@"name":@"クラクラ", @"icon":@"kurakura.png"};
    NSDictionary* dict2 = @{@"name":@"Line", @"icon":@"Line.png"};
    NSDictionary* dict3 = @{@"name":@"Google Map", @"icon":@"googleMap.png"};
    NSDictionary* dict4 = @{@"name":@"Twitter", @"icon":@"twitter.png"};
    NSDictionary* dict5 = @{@"name":@"ジョルテ", @"icon":@"jorute.png"};
    NSDictionary* dict6 = @{@"name":@"ミュージック", @"icon":@"music.png"};
    NSDictionary* dict7 = @{@"name":@"ツムツム", @"icon":@"tsumutsumu.png"};
    NSDictionary* dict8 = @{@"name":@"パズドラ", @"icon":@"pazudora.png"};
    NSDictionary* dict9 = @{@"name":@"パワプロ君", @"icon":@"pawapuro.png"};
    NSDictionary* dict10 = @{@"name":@"YouTube", @"icon":@"youtube.png"};
    
    NSMutableArray *appAry = [NSMutableArray array];
    
    [appAry addObject:dict1];
    [appAry addObject:dict2];
    [appAry addObject:dict3];
    [appAry addObject:dict4];
    [appAry addObject:dict5];
    [appAry addObject:dict6];
    [appAry addObject:dict7];
    [appAry addObject:dict8];
    [appAry addObject:dict9];
    [appAry addObject:dict10];
    
    return appAry;
}

-(void)rankingData
{
    [self.ary willChangeValueForKey:@"ary"];
    self.ary = [self appList];
    [self.ary didChangeValueForKey:@"ary"];
}

@end
