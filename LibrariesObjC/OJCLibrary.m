//
//  OJCLibrary.m
//  LibrariesObjC
//
//  Created by Jeff Norton on 11/29/16.
//  Copyright © 2016 JeffCryst. All rights reserved.
//

#import "OJCLibrary.h"

@implementation OJCLibrary

// ==================================================
# pragma mark - Initializers
// ==================================================

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    
    self = [self init];
    if (self) {
        
        NSString *homepageURLString = dictionary[@"homepage"];
        if (homepageURLString) {
            _homepageURL = [NSURL URLWithString:homepageURLString];
        }
        
        _language = dictionary[@"language"];
        _name = dictionary[@"name"];
        _numberOfStars = [dictionary[@"stars"] unsignedIntegerValue];
        _summary = dictionary[@"summary"];
    }
    
    return self;
}

@end
