//
//  OJCLibrary.h
//  LibrariesObjC
//
//  Created by Jeff Norton on 11/29/16.
//  Copyright © 2016 JeffCryst. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OJCLibrary : NSObject

// ==================================================
# pragma mark - _Properties
// ==================================================

@property (nonatomic, readonly) NSString *homepageURL;
@property (nonatomic, readonly) NSString *language;
@property (nonatomic, readonly) NSString *name;
@property (nonatomic, readonly) NSUInteger *numberOfStars;
@property (nonatomic, readonly) NSString *summary;

// ==================================================
# pragma mark - Initializers
// ==================================================

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

- (instancetype)initWithName:(NSString *)name homepageURL:(NSString *)homepageURL language:(NSString *)language numberOfStars:(NSNumber *)numberOfStars andSummary:(NSString *)summary;

@end
