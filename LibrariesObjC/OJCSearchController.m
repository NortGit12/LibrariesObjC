//
//  OJCSearchController.m
//  LibrariesObjC
//
//  Created by Jeff Norton on 11/29/16.
//  Copyright © 2016 JeffCryst. All rights reserved.
//

#import "OJCSearchController.h"
#import "OJCLibrariesNetworkController.h"
#import "OJCLibrary.h"

NSString * const OJCSearchControllerResultsDidUpdateNotification = @"OJCSearchControllerResultsDidUpdateNotification";

@interface OJCSearchController ()

@property (nonatomic, strong, readwrite) NSArray *searchResults;

@end

@implementation OJCSearchController


// ==================================================
# pragma mark - Methods
// ==================================================

- (void)clearSearchResults
{
    
    self.searchResults = nil;
}

- (void)searchForLibrariesMatching:(NSString *)searchString
{
    
    OJCLibrariesNetworkController *networkController = [OJCLibrariesNetworkController shared];
    [networkController fetchResultsForSearchTerm:searchString completion:^(NSData *jsonData, NSError *error) {
        
        if (error) {
            NSLog(@"Error getting search results: %@", error);
        }
        
        NSError *localError = nil;
        NSArray *results = [self librariesByParsingJSONData:jsonData error:&localError];
        if (!results) {
            NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
            NSLog(@"Error parsing JSON for search %@: %@", jsonString, error);
        }
        
        self.searchResults = results;
    }];
}

// ==================================================
# pragma mark - Private
// ==================================================

# pragma mark Parsing

- (NSArray *) librariesByParsingJSONData:(NSData *)data error:(NSError **)error
{
    
    error = error ?: &(NSError *__autoreleasing){ nil };
    
    NSArray *dictionaries = [NSJSONSerialization JSONObjectWithData:data options:0 error:error];
    if (!dictionaries) { return nil; }
    
    NSMutableArray *libraries = [NSMutableArray array];
    for (NSDictionary *dictionary in dictionaries) {
        
        OJCLibrary *library = [[OJCLibrary alloc] initWithDictionary:dictionary];
        if (library) {
            
            [libraries addObject:library];
        }
    }
    
    return libraries;
}

# pragma mark - Properties

- (void)setSearchResults:(NSArray *)searchResults
{
    
    if (searchResults != _searchResults) {
        
        _searchResults = searchResults;
        
        dispatch_async(dispatch_get_main_queue(), ^{
            NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
            [nc postNotificationName:OJCSearchControllerResultsDidUpdateNotification object:self];
        });
    }
}

@end

















