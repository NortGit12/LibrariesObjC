//
//  OJCMainViewController.m
//  LibrariesObjC
//
//  Created by Jeff Norton on 11/30/16.
//  Copyright © 2016 JeffCryst. All rights reserved.
//

#import "OJCMainViewController.h"
#import "OJCSearchController.h"
#import "OJCLibraryDetailViewController.h"
#import "OJCLibrary.h"

@interface OJCMainViewController () <UISearchBarDelegate, UITableViewDataSource, UITableViewDelegate>

// Outlets
@property (nonatomic, weak) IBOutlet UISearchBar *searchBar;
@property (nonatomic, weak) IBOutlet UITableView *tableView;

@property (nonatomic, strong) OJCSearchController *searchController;

@end

@implementation OJCMainViewController

// ==================================================
# pragma mark - 
// ==================================================

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.searchController = [[OJCSearchController alloc] init];
    
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc addObserver:self selector:@selector(searchResultsDidUpdate:) name:OJCSearchControllerResultsDidUpdateNotification object:nil];
}

// ==================================================
# pragma mark - UISearchBarDelegate
// ==================================================

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    
    [searchBar resignFirstResponder];
    
    NSString *searchString = searchBar.text;
    [self.searchController clearSearchResults];
    [self.searchController searchForLibrariesMatching:searchString];
}

// ==================================================
# pragma mark - UITableViewDataSource
// ==================================================

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return self.searchController.searchResults.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"libraryCell" forIndexPath:indexPath];
    
    OJCLibrary *library = self.searchController.searchResults[indexPath.row];
    
    cell.textLabel.text = library.name;
    cell.detailTextLabel.text = library.language;
    
    return cell;
}

// ==================================================
# pragma mark - Navigation
// ==================================================

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    // How are we getting there?
    
    if ([[segue identifier] isEqualToString:@"cellToDetailSegue"]) {
        
        // Where are we going?
        
        OJCLibraryDetailViewController *detailViewController = [segue destinationViewController];
        
        // Have we packed?
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        OJCLibrary *library = self.searchController.searchResults[indexPath.row];
        detailViewController.library = library;
        NSLog(@"Check dVC's library");
    }
}


// ==================================================
# pragma mark - Notifications
// ==================================================

- (void)searchResultsDidUpdate:(NSNotification *)notification
{
    [self.tableView reloadData];
}

@end
















