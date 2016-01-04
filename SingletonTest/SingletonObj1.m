//
//  SingletonObj1.m
//  SingletonTest
//
//  Created by lujiangbin on 15/12/31.
//  Copyright (c) 2015年 lujiangbin. All rights reserved.
//

#import "SingletonObj1.h"

static id obj1 = nil;
@implementation SingletonObj1

+(instancetype)getSingletonByDispacthOnce
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        obj1 = [[SingletonObj1 alloc] init];
    });
    return obj1;
}

@end
