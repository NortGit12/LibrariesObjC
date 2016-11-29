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

- (instancetype)initWithName:(NSString *)name homepageURL:(NSString *)homepageURL language:(NSString *)language numberOfStars:(NSNumber *)numberOfStars andSummary:(NSString *)summary
{
    
    self = [super init];
    if (self) {
        
        _name = name;
        _homepageURL = homepageURL;
        _language = language;
        _numberOfStars = numberOfStars;
        _summary = summary;
    }
    
    return self;
}

@end
