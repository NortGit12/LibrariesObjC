//
//  OJCLibraryDetailViewController.m
//  LibrariesObjC
//
//  Created by Jeff Norton on 11/30/16.
//  Copyright © 2016 JeffCryst. All rights reserved.
//

#import "OJCLibraryDetailViewController.h"
#import "OJCLibrary.h"

@interface OJCLibraryDetailViewController ()

// Outlets
@property (nonatomic, weak) IBOutlet UILabel *languageLabel;
@property (nonatomic, weak) IBOutlet UILabel *numberOfStarsLabel;
@property (nonatomic, weak) IBOutlet UILabel *homepageLabel;
@property (nonatomic, weak) IBOutlet UILabel *summaryLabel;

@end

@implementation OJCLibraryDetailViewController

// ==================================================
# pragma mark - General
// ==================================================

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self updateViews];
}

// ==================================================
# pragma mark - Methods 
// ==================================================

- (void)setLibrary:(OJCLibrary *)library
{
    if (library != _library) {
        
        _library = library;
        [self updateViews];
    }
}

- (void)updateViews
{
    
    if (!self.isViewLoaded) { return; }
    
    [self.navigationItem setTitle:self.library.name];
    
    NSDictionary *linkAttributes = @{NSLinkAttributeName : self.library.homepageURL};
    NSAttributedString *linkString = [[NSAttributedString alloc] initWithString:[self.library.homepageURL absoluteString] attributes:linkAttributes];
    self.homepageLabel.attributedText = linkString;
    
    self.languageLabel.text = self.library.language;
    
    NSString *numberOfStarsString = [NSString stringWithFormat:@"%tu", self.library.numberOfStars];
    self.numberOfStarsLabel.text = [NSString stringWithFormat:@"%@ Stars", numberOfStarsString];
    
    self.summaryLabel.text = self.library.summary;
}

@end


















