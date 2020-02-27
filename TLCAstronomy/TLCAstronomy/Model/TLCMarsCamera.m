//
//  TLCMarsCamera.m
//  TLCAstronomy
//
//  Created by Lambda_School_Loaner_219 on 2/26/20.
//  Copyright © 2020 Lambda_School_Loaner_219. All rights reserved.
//

#import "TLCMarsCamera.h"

@implementation TLCMarsCamera

-(instancetype) initWithName: (NSString *)name fullName:(NSString *) fullName {
    self = [super init];
    if(self) {
        _name = [name copy];
        _fullName = [fullName copy];
    }
    return self;
}

-(instancetype) initWithDictionary:(NSDictionary *)dictionary  {
    NSString *name = dictionary[@"name"];
    NSString *fullName = dictionary[@"full_name"];
    self = [self initWithName:name fullName:fullName];
    return self;
}

@end
