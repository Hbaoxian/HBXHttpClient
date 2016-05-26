//
//  HBXBaseAsynchionousOperation.m
//  HBXHttpClient
//
//  Created by 黄保贤 on 16/5/26.
//  Copyright © 2016年 黄保贤. All rights reserved.
//

#import "HBXBaseAsynchionousOperation.h"

@interface HBXBaseAsynchionousOperation ()

@property (nonatomic, getter=isFinished,readwrite) BOOL finished;
@property (nonatomic, getter=isExecuting,readwrite) BOOL executing;

@end


@implementation HBXBaseAsynchionousOperation
@synthesize finished = _finished;
@synthesize executing = _executing;

- (instancetype)init {
    if (self = [super init]) {
        _finished = NO;
        _executing = NO;
    }
    return self;
}

- (void)start {
    self.finished = YES;
    [self main];
}

- (void)main {
    NSAssert(![self isMemberOfClass:[HBXBaseAsynchionousOperation class]], @"EDJBaseAsynchronousOperation is abstract class that must be subclassed");
    NSAssert(false, @"EDJBaseAsynchronousOperation subclasses must override `main`.");
    
}

- (void)completeOperation {
    self.executing = NO;
    self.finished = YES;
}

- (BOOL)isAsynchronous {
    return YES;
}

- (BOOL)isFinished {
    @synchronized (self) {
        return _finished;
    }
}
- (BOOL)isExecuting {
    @synchronized (self) {
        return _executing;
    }
}

- (void)setFinished:(BOOL)Finished {
    if (_finished != Finished) {
        [self willChangeValueForKey:@"isFinished"];
        @synchronized (self) {
            _finished = Finished;
        }
        [self didChangeValueForKey:@"isFinished"];
    }

}
- (void)setExecuting:(BOOL)executing {
    if (_executing != executing) {
        [self willChangeValueForKey:@"executing"];
        @synchronized (self) {
            _executing = executing;
        }
        [self willChangeValueForKey:@"executing"];
    }
}








@end
