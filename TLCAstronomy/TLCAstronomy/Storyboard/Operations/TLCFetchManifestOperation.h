//
//  TLCFetchManifestOperation.h
//  TLCAstronomy
//
//  Created by Troy Christian on 2/25/20.
//  Copyright © 2020 Troy Christian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TLCManifestFetcher.h"
#import "MarsMissionManifest.h"

NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_NAME(FetchManifestOperation)
@interface TLCFetchManifestOperation : NSOperation

@property (nonatomic, nonnull, readonly) TLCManifestFetcher *manifestFetcher;
@property (nonatomic, nullable) TLCMarsMissionManifest *manifest;

- (instancetype) initWithManifestFetcher:(TLCManifestFetcher *)manifestFetcher;

@end

NS_ASSUME_NONNULL_END
