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

@property (nonatomic, copy) NSString *homepageURL;
@property (nonatomic, copy) NSString *language;
@property (nonatomic, copy) NSString *name;
@property (nonatomic) NSNumber *numberOfStars;
@property (nonatomic, copy) NSString *summary;

// ==================================================
# pragma mark - Initializers
// ==================================================

- (instancetype)initWithName:(NSString *)name homepageURL:(NSString *)homepageURL language:(NSString *)language numberOfStars:(NSNumber *)numberOfStars andSummary:(NSString *)summary;

@end
