//
//  SingletonObj.m
//  SingletonTest
//
//  Created by lujiangbin on 15/12/31.
//  Copyright (c) 2015年 lujiangbin. All rights reserved.
//

#import "SingletonObj.h"

static id obj = nil;

@implementation SingletonObj

+(instancetype)getSingletonBySynchronized
{
    @synchronized(self) {
        if (!obj) {
            obj = [[SingletonObj alloc] init];
        }
    }
    return obj;
}

@end
