//
//  TLCMarsSol.h
//  TLCAstronomy
//
//  Created by Lambda_School_Loaner_219 on 2/26/20.
//  Copyright © 2020 Lambda_School_Loaner_219. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TLCMarsCamera.h"

NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_NAME(MarsSol)


@interface TLCMarsSol : NSObject
@property (nonatomic, readonly) NSNumber *idNumber;
@property (nonatomic, readonly) NSNumber *sol;
@property (nonatomic, readonly, copy) NSString *imageURL;
@property (nonatomic, readonly) TLCMarsCamera *camera;
@property (nonatomic, readonly) NSDate *earthDate;

-(instancetype) initWithIdNumber:(NSNumber *)idNumber
                             sol:(NSNumber *)sol
                        imageURL:(NSString *)imageURL
                          camera:(TLCMarsCamera *) camera
                       earthDate:(NSDate *)earthDate;

-(instancetype) initWithDictionary:(NSDictionary *)dictionary;

+(NSDateFormatter *) dateFormatter;

@end

NS_ASSUME_NONNULL_END
