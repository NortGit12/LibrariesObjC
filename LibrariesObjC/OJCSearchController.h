//
//  OJCSearchController.h
//  LibrariesObjC
//
//  Created by Jeff Norton on 11/29/16.
//  Copyright © 2016 JeffCryst. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OJCSearchController : NSObject

// ==================================================
# pragma mark - _Properties 
// ==================================================

@property (nonatomic, strong, readonly) NSArray *searchResults;

// ==================================================
# pragma mark - Methods
// ==================================================

- (void)clearSearchResults;
- (void)searchForLibrariesMatching:(NSString *)searchString;

@end
