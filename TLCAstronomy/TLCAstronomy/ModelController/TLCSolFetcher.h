//
//  TLCSolFetcher.h
//  TLCAstronomy
//
//  Created by Lambda_School_Loaner_219 on 2/27/20.
//  Copyright © 2020 Lambda_School_Loaner_219. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^TLCSolFetcherCompletion) (NSArray * _Nullable sols, NSError *_Nullable error);
NS_ASSUME_NONNULL_BEGIN
NS_SWIFT_NAME(Solfetcher)

@interface TLCSolFetcher : NSObject

-(void)fetchPhotosForRover:(NSString *)rover
withSol:(NSNumber *) sol
                completion:(TLCSolFetcherCompletion)completion;

@end

NS_ASSUME_NONNULL_END
