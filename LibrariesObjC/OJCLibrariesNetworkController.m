//
//  OJCLibrariesNetworkController.m
//  LibrariesObjC
//
//  Created by Jeff Norton on 11/29/16.
//  Copyright © 2016 JeffCryst. All rights reserved.
//

#import "OJCLibrariesNetworkController.h"

@implementation OJCLibrariesNetworkController

// ==================================================
# pragma mark - Methods
// ==================================================

+ (NSURL *)baseURL
{
    
    return [NSURL URLWithString:@"https://libraries.io/"];
}

- (void)fetchResultsForSearchTerm:(NSString *)searchTerm completion:(void(^)(NSData *jsonData, NSError *error))completion
{
    
    
}

- (NSURL *)searchURLForSearchTerm:(NSString *)searchTerm
{
    
    NSURLComponents *urlComponents = [NSURLComponents componentsWithURL:[[self class] baseURL] resolvingAgainstBaseURL:YES];
    urlComponents.path = @"api/search";
    
    NSURLQueryItem *search = [NSURLQueryItem queryItemWithName:@"q" value:searchTerm];
    NSURLQueryItem *apiKey = [NSURLQueryItem queryItemWithName:@"api_key" value:[[self class] apiKey]];
    
    urlComponents.queryItems = @[search, apiKey];
    
    return urlComponents.URL;
}

+ (OJCLibrariesNetworkController *)shared
{
    
    static OJCLibrariesNetworkController *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [OJCLibrariesNetworkController new];
    });
    
    return shared;
}

@end
