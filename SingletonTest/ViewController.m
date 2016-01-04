//
//  ViewController.m
//  SingletonTest
//
//  Created by lujiangbin on 15/12/31.
//  Copyright (c) 2015年 lujiangbin. All rights reserved.
//

#import "ViewController.h"
#import "SingletonObj.h"
#import "SingletonObj1.h"

#define TIMES 1000000

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)test:(id)sender
{
    CFAbsoluteTime start =  CFAbsoluteTimeGetCurrent();
    
    for (int i=0; i<TIMES; ++i) {
        [SingletonObj getSingletonBySynchronized];
    }
    CFAbsoluteTime end = CFAbsoluteTimeGetCurrent();
    NSLog(@"time:%fs",end-start);
    
    start =  CFAbsoluteTimeGetCurrent();
    
    for (int i=0; i<TIMES; ++i) {
        [SingletonObj1 getSingletonByDispacthOnce];
    }
    end = CFAbsoluteTimeGetCurrent();
    NSLog(@"time2:%fs",end-start);
    
}

- (IBAction)test2:(id)sender
{
    CFAbsoluteTime start =  CFAbsoluteTimeGetCurrent();
    
    dispatch_queue_t queue = dispatch_queue_create("myqueue", DISPATCH_QUEUE_CONCURRENT);
    dispatch_apply(TIMES, queue, ^(size_t i) {
        [SingletonObj getSingletonBySynchronized];
    });
    CFAbsoluteTime end = CFAbsoluteTimeGetCurrent();
     NSLog(@"time:%fs",end-start);
    
    start =  CFAbsoluteTimeGetCurrent();
    
    dispatch_queue_t queue1 = dispatch_queue_create("myqueue1", DISPATCH_QUEUE_CONCURRENT);
    dispatch_apply(TIMES, queue1, ^(size_t i) {
        [SingletonObj1 getSingletonByDispacthOnce];
    });
     end = CFAbsoluteTimeGetCurrent();
    NSLog(@"time1:%fs",end-start);
    
    
}

@end
