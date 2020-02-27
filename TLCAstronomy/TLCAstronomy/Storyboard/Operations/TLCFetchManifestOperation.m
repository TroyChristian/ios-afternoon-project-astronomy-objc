//
//  TLCFetchManifestOperation.m
//  TLCAstronomy
//
//  Created by Troy Christian on 2/25/20.
//  Copyright © 2020 Troy Christian. All rights reserved.
//

#import "TLCFetchManifestOperation.h"

typedef NS_ENUM(NSUInteger, TLCFetchOperationState) {
    TLCFetchOperationReady,
    TLCFetchOperationIsExecuting,
    TLCFetchOperationIsFinished
};

NSString *manifestRawValue(TLCFetchOperationState state) {
    switch (state) {
        case TLCFetchOperationReady:
            return @"isReady";
        case TLCFetchOperationIsExecuting:
            return @"isExecuting";
        case TLCFetchOperationIsFinished:
            return @"isFinished";
    }
}

@interface TLCFetchManifestOperation () {
    TLCFetchOperationState _state;
}

@property (atomic) TLCFetchOperationState state;
@property (atomic, nonnull) NSLock *lock;


@end

@implementation TLCFetchManifestOperation

- (instancetype) initWithManifestFetcher:(TLCManifestFetcher *)manifestFetcher {
    self = [super init];
    if (self) {
        _manifestFetcher = manifestFetcher;
        _state = TLCFetchOperationReady;
    }
    return self;
}

- (TLCFetchOperationState)state {
    [self.lock lock];
    TLCFetchOperationState result = _state;
    [self.lock unlock];
    return result;
}

- (void)setState:(TLCFetchOperationState)state {
    [self.lock lock];
    TLCFetchOperationState oldState = _state;
    [self willChangeValueForKey:manifestRawValue(oldState)];
    [self willChangeValueForKey:manifestRawValue(state)];
    _state = state;
    [self didChangeValueForKey:manifestRawValue(oldState)];
    [self didChangeValueForKey:manifestRawValue(state)];
    [self.lock unlock];
}

- (BOOL) isAsynchronous {
    return YES;
}

- (BOOL) isReady {
    return (self.state == TLCFetchOperationReady);
}

- (BOOL) isExecuting {
    return (self.state == TLCFetchOperationIsExecuting);
}

- (BOOL) isFinished {
    return (self.state == TLCFetchOperationIsFinished);
}

- (void)start {
    self.state = TLCFetchOperationIsExecuting;
    [self.manifestFetcher fetchManifestForRover:@"curiosity" completion:^(TLCMarsMissionManifest * _Nullable manifest, NSError * _Nullable error) {
        if (error) {
            self.state = TLCFetchOperationIsFinished;
            return;
        }
        
        self.manifest = manifest;
        self.state = TLCFetchOperationIsFinished;
    }];
}

@end
