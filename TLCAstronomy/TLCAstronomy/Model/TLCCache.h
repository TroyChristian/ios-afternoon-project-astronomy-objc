//
//  TLCCache.h
//  TLCAstronomy
//
//  Created by Lambda_School_Loaner_219 on 2/26/20.
//  Copyright © 2020 Lambda_School_Loaner_219. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_NAME(Cache)
@interface TLCCache : NSObject
@property (nonnull, nonatomic) NSMutableDictionary *cache;

-(void)cacheItem:(id)value forKey:(NSNumber *) key;
-(id _Nullable)itemForKey:(NSNumber *)key;
-(id _Nullable)removeItemForKey:(NSNumber *) key;
-(void)clear;

@end

NS_ASSUME_NONNULL_END
