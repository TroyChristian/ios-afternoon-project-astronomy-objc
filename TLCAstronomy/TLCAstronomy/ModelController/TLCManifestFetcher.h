//
//  TLCManifestFetcher.h
//  TLCAstronomy
//
//  Created by Lambda_School_Loaner_219 on 2/27/20.
//  Copyright © 2020 Lambda_School_Loaner_219. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MarsMissionManifest.h"
NS_ASSUME_NONNULL_BEGIN

typedef void(^TLCManifestFetcherCompletion)(MarsMissionManifest *_Nullable manifest, NSError *_Nullable error);
NS_SWIFT_NAME(ManifestFetcher)


@interface TLCManifestFetcher : NSObject

-(void)fetchManifestForRover:(NSString * _Nullable)rover
                  completion:TLCManifestFetcherCompletion_Nullable)completion;

@end

NS_ASSUME_NONNULL_END
