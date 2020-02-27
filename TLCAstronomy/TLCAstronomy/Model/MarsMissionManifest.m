//
//  MarsMissionManifest.m
//  TLCAstronomy
//
//  Created by Lambda_School_Loaner_219 on 2/26/20.
//  Copyright © 2020 Lambda_School_Loaner_219. All rights reserved.
//

#import "MarsMissionManifest.h"

@interface MarsMissionManifest ()
@property (nonatomic,nonnull) NSMutableArray *internalSols;

@end

@implementation MarsMissionManifest

-(instancetype) init {
    self = [super init];
    if (self) {
        _internalSols = [[NSMutableArray alloc] init];
    }
    return self;
}

-(instancetype) initWithDictionary:(NSDictionary *)dictionary {
    NSDictionary *manifest = dictionary[@"photo_manifest"];
    NSArray *photos = manifest[@"photos"];
    NSMutableArray *sols = [[NSMutableArray alloc] init];
    for (NSDictionary *solDictionary in photos) {
        NSNumber *sol = solDictionary[@"sol"];
        [sols addObject: sol];
    }
    
    self.internalSols = sols;
    return self;
}

-(NSArray *)sols {
    return [_internalSols copy];
}



@end
