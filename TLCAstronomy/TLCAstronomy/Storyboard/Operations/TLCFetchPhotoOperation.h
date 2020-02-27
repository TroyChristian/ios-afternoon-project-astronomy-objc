//
//  TLCFetchPhotoOperation.h
//  TLCAstronomy
//
//  Created by Troy Christian on 2/25/20.
//  Copyright © 2020 Troy Christian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "TLCMarsSol.h"

NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_NAME(FetchPhotoOperation)
@interface TLCFetchPhotoOperation : NSOperation

@property (nonatomic, nonnull, readonly) TLCMarsSol *sol;
@property (nonatomic, nullable) UIImage *image;

- (instancetype)initWithSol:(TLCMarsSol *)sol;

@end

NS_ASSUME_NONNULL_END
