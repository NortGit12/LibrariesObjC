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
        if (!homepageURLString || ![homepageURLString isKindOfClass:[NSString class]]) {
            
            homepageURLString = @"none";
            _homepageURL = [NSURL URLWithString:@"none"];
            
        } else {
            
            _homepageURL = [NSURL URLWithString:homepageURLString];
        }
//        _homepageURL = [NSURL URLWithString:homepageURLString];
        
        NSString *languageString = dictionary[@"language"];
        if(!languageString || ![languageString isKindOfClass:[NSString class]]) {
            
            languageString = @"unknown";
        }
//        _language = dictionary[@"language"];
        _language = languageString;
        
        
        _name = dictionary[@"name"];
        
        NSString *numberOfStarsString = dictionary[@"stars"];
        if (!numberOfStarsString || ![numberOfStarsString isKindOfClass:[NSString class]]) {
            
            numberOfStarsString = @"0";
        }
        NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
        numberFormatter.numberStyle = NSNumberFormatterDecimalStyle;
        NSNumber *numberOfStarsNumber = [numberFormatter numberFromString:numberOfStarsString];
        NSUInteger numberOfStars = (NSUInteger)numberOfStarsNumber;
        _numberOfStars = &numberOfStars;
        
        _summary = dictionary[@"summary"];
    }
    
    return self;
}

@end
