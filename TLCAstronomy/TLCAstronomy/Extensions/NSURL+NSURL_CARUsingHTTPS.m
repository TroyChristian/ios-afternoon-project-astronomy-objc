//
//  NSURL+NSURL_TLCUsingHTTPS.m
//  TLCAstronomy
//
//  Created by Troy Christian on 2/25/20.
//  Copyright © 2020 Troy Christian. All rights reserved.
//

#import "NSURL+NSURL_TLCUsingHTTPS.h"

@implementation NSURL (TLCUsingHTTPS)

- (NSURL *)urlUsingHTTPS {
    NSURLComponents *components = [NSURLComponents componentsWithURL:self resolvingAgainstBaseURL:YES];
    [components setScheme:@"https"];
    return components.URL;
}

@end
