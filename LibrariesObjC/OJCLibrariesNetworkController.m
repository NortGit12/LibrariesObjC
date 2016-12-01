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

+ (NSString *)apiKey
{
    
    static NSString *apiKey = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        NSURL *apiKeysURL = [[NSBundle mainBundle] URLForResource:@"Info" withExtension:@"plist"];
        if (!apiKeysURL) {
            NSLog(@"Error! APIKeys file not found!");
            return;
        }
        
        NSDictionary *apiKeys = [[NSDictionary alloc] initWithContentsOfURL:apiKeysURL];
        apiKey = apiKeys[@"LibrariesAPIKey"];
    });
    
    return apiKey;
}

- (NSURL *)apiURLForSearchTerm:(NSString *)searchTerm
{
    
    NSURLComponents *urlComponents = [NSURLComponents componentsWithURL:[[self class] baseURL] resolvingAgainstBaseURL:YES];
    urlComponents.path = @"api/search";
    
    NSURLQueryItem *search = [NSURLQueryItem queryItemWithName:@"q" value:searchTerm];
    NSURLQueryItem *apiKey = [NSURLQueryItem queryItemWithName:@"api_key" value:[[self class] apiKey]];
    
    urlComponents.queryItems = @[search, apiKey];
    
    return urlComponents.URL;
}

+ (NSURL *)baseURL
{
    
    return [NSURL URLWithString:@"https://libraries.io/"];
}

- (void)fetchResultsForSearchTerm:(NSString *)searchTerm
                       completion:(void(^)(NSData *jsonData, NSError *error))completion
{
    
    NSURL *searchURL = [self apiURLForSearchTerm:searchTerm];
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithURL:searchURL completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        completion(data, error);
    }];
    
    [task resume];
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
