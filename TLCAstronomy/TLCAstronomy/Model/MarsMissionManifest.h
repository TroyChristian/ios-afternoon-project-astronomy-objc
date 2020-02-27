//
//  MarsMissionManifest.h
//  TLCAstronomy
//
//  Created by Lambda_School_Loaner_219 on 2/26/20.
//  Copyright © 2020 Lambda_School_Loaner_219. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
NS_SWIFT_NAME(MarsMissionManifest)
@interface MarsMissionManifest : NSObject

@property (nonatomic, readonly, nonnull) NSArray *sols;

-(instancetype _Nonnull) initWithDictionary:(NSDictionary * _Nonnull)dictionary;

@end

NS_ASSUME_NONNULL_END
