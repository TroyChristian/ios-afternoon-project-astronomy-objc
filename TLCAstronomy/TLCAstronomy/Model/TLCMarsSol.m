//
//  TLCMarsSol.m
//  TLCAstronomy
//
//  Created by Lambda_School_Loaner_219 on 2/26/20.
//  Copyright © 2020 Lambda_School_Loaner_219. All rights reserved.
//

#import "TLCMarsSol.h"
static NSDateFormatter *_dateFormatter;

@interface TLCMarsSol()

+(NSDateFormatter *)dateFormatter;

@end

@implementation TLCMarsSol
// https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&api_key=vX6pJmz33vRDR9X8rYA6hZiM3nSoThxCSdltKqbQ

-(instancetype) initWithIdNumber:(NSNumber *)idNumber sol:(NSNumber *)sol imageURL:(NSString *)imageURL camera:(TLCMarsCamera *)camera earthDate:(NSDate *)earthDate {
    self = [super init];
    if (self) {
        _idNumber = idNumber;
        _sol = sol;
        _imageURL = [imageURL copy];
        _camera = camera;
        _earthDate = earthDate;
        
        
        
    }
    
    return self;
}

-(instancetype) initWithDictionary:(NSDictionary *)dictionary {
    NSNumber *idNumber = dictionary[@"id"];
    NSNumber *sol = dictionary[@"sol"];
    NSString *imageURL = dictionary[@"img_src"];
    NSString *earthDateString = dictionary[@"earth_date"];
    NSDate *earthDate = [[TLCMarsSol dateFormatter] dateFromString:earthDateString];
    NSDictionary *cameraDictionary = dictionary[@"camera"];
    TLCMarsCamera *camera = [[TLCMarsCamera alloc] initWithDictionary:cameraDictionary];
    self = [self initWithIdNumber:idNumber sol:sol imageURL:imageURL camera:camera earthDate:earthDate];
    return self;
}
    
    //come back to check out this bug
    
    +(NSDateFormatter *) dateFormatter {
        if (_dateFormatter) {
            return _dateFormatter;
        } else {
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            [formatter setDateFormat:@"yyyy-MM-DD"];
            return formatter;
        }
    }

@end
