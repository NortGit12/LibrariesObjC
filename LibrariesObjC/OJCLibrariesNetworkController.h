//
//  OJCLibrariesNetworkController.h
//  LibrariesObjC
//
//  Created by Jeff Norton on 11/29/16.
//  Copyright © 2016 JeffCryst. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OJCLibrariesNetworkController : NSObject

// ==================================================
# pragma mark - Methods
// ==================================================

+ (OJCLibrariesNetworkController *)shared;

- (void)fetchResultsForSearchTerm:(NSString *)searchTerm completion:(void(^)(NSData *jsonData, NSError *error))completion;

@end
