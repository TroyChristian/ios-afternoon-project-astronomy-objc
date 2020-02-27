//
//  TLCFetchPhotoOperation.m
//  TLCAstronomy
//
//  Created by Troy Christian on 2/25/20.
//  Copyright © 2020 Troy Christian. All rights reserved.
//

#import "TLCFetchPhotoOperation.h"
#import "NSURL+NSURL_TLCUsingHTTPS.h"

typedef NS_ENUM(NSUInteger, TLCFetchPhotoOperationState) {
    TLCFetchPhotoOperationReady,
    TLCFetchPhotoOperationIsExecuting,
    TLCFetchPhotoOperationIsFinished
};

NSString *photoRawValue(TLCFetchPhotoOperationState state) {
    switch (state) {
        case TLCFetchPhotoOperationReady:
            return @"isReady";
        case TLCFetchPhotoOperationIsExecuting:
            return @"isExecuting";
        case TLCFetchPhotoOperationIsFinished:
            return @"isFinished";
    }
}

@interface TLCFetchPhotoOperation () {
    TLCFetchPhotoOperationState _state;
}

@property (atomic) TLCFetchPhotoOperationState state;
@property (atomic, nonnull) NSLock *lock;
@property (nonatomic, nullable) NSURLSessionDataTask *dataTask;

@end

@implementation TLCFetchPhotoOperation

- (instancetype)initWithSol:(TLCMarsSol *)sol {
    self = [super init];
    if (self) {
        _sol = sol;
        _state = TLCFetchPhotoOperationReady;
    }
    return self;
}

- (TLCFetchPhotoOperationState)state {
    [self.lock lock];
    TLCFetchPhotoOperationState result = _state;
    [self.lock unlock];
    return result;
}

- (void)setState:(TLCFetchPhotoOperationState)state {
    [self.lock lock];
    TLCFetchPhotoOperationState oldState = _state;
    [self willChangeValueForKey:photoRawValue(oldState)];
    [self willChangeValueForKey:photoRawValue(state)];
    _state = state;
    [self didChangeValueForKey:photoRawValue(oldState)];
    [self didChangeValueForKey:photoRawValue(state)];
    [self.lock unlock];
}

- (BOOL) isAsynchronous {
    return YES;
}

- (BOOL) isReady {
    return (self.state == TLCFetchPhotoOperationReady);
}

- (BOOL) isExecuting {
    return (self.state == TLCFetchPhotoOperationIsExecuting);
}

- (BOOL) isFinished {
    return (self.state == TLCFetchPhotoOperationIsFinished);
}

- (void)start {
    self.state = TLCFetchPhotoOperationIsExecuting;
    NSURL *url = [[NSURL URLWithString:self.sol.imageURL] urlUsingHTTPS];
    self.dataTask = [NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (self.isCancelled) {
            self.state = TLCFetchPhotoOperationIsFinished;
            return;
        }
        
        if (error) {
            self.state = TLCFetchPhotoOperationIsFinished;
            return;
        }
        
        self.image = [UIImage imageWithData:data];
        self.state = TLCFetchPhotoOperationIsFinished;
    }];
    [self.dataTask resume];
}

- (void)cancel {
    [self.dataTask cancel];
    [super cancel];
}

@end
