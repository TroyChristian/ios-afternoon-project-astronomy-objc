//
//  TLCSolFetcher.m
//  TLCAstronomy
//
//  Created by Lambda_School_Loaner_219 on 2/27/20.
//  Copyright © 2020 Lambda_School_Loaner_219. All rights reserved.
//

#import "TLCSolFetcher.h"
#import "TLCMarsSol.h"
#import "LSIErrors.h"
#import "LSILog.h"

@implementation TLCSolFetcher

static NSString *const baseURLString = @"https://api.nasa.gov/mars-photos/api/v1/rovers";
static NSString *const apiKey = @"vX6pJmz33vRDR9X8rYA6hZiM3nSoThxCSdltKqbQ";
- (void)fetchPhotosForRover:(NSString *)rover
withSol:(NSNumber *)sol
completion:(TLCSolFetcherCompletion)completion {
NSURL *baseURL = [[[NSURL URLWithString:baseURLString] URLByAppendingPathComponent:rover] URLByAppendingPathComponent:@"photos"];
NSURLComponents *urlComponents = [NSURLComponents componentsWithURL:baseURL resolvingAgainstBaseURL:YES];
urlComponents.queryItems = @[
[NSURLQueryItem queryItemWithName:@"sol" value: [NSString stringWithFormat:@"%d", sol.intValue]],
[NSURLQueryItem queryItemWithName:@"api_key" value:apiKey]
];
NSURL *url = urlComponents.URL;
[[NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
if (error) {
dispatch_async(dispatch_get_main_queue(), ^{
completion(nil, error);
});
return;
}
if (!data) {
NSError *dataError = errorWithMessage(@"Data should not be nil from API request.", LSIDataNilError);
dispatch_async(dispatch_get_main_queue(), ^{
completion(nil, dataError);
});
return;
}
NSError *jsonError = nil;
NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
if (jsonError) {
dispatch_async(dispatch_get_main_queue(), ^{
completion(nil, jsonError);
});
return;
}
NSArray *photosArray = json[@"photos"];
NSMutableArray *photos = [[NSMutableArray alloc] init];
for (NSDictionary *dictionary in photosArray) {
TLCMarsSol *sol = [[TLCMarsSol alloc] initWithDictionary:dictionary];
[photos addObject:sol];
}
if (!photos) {
NSError *parsingError = errorWithMessage(@"Unable to parse JSON objects", LSIJSONDecodeError);
dispatch_async(dispatch_get_main_queue(), ^{
completion(nil, parsingError);
});
return;
}
dispatch_async(dispatch_get_main_queue(), ^{
completion(photos, nil);
});
}] resume];
}
@end


