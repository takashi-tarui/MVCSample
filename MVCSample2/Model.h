//
//  Model.h
//  MVCSample
//
//  Created by tarui takashi on 2015/11/28.
//  Copyright © 2015年 takashi tarui. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject
@property(nonatomic, strong) NSArray* ary;

+ (Model *)sharedInstance;
- (id) init;
-(void)rankingData;
    
@end
