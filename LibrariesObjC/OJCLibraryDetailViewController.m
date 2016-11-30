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
@property (nonatomic, strong) UILabel *languageLabel;
@property (nonatomic, strong) UILabel *numberOfStarsLabel;
@property (nonatomic, strong) UILabel *homepageLabel;
@property (nonatomic, strong) UILabel *summaryLabel;

@property (nonatomic, strong) OJCLibrary *library; 

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
    if (library != library) {
        
        _library = library;
        [self updateViews];
    }
}

- (void)updateViews
{
    
    self.languageLabel.text = self.library.language;
    
    /*
     self.numberOfStarsLabel.text = [NSString stringWithFormat:@"%@ Stars", @(self.library.numberOfStars)];
     NSDictionary *linkAttributes = @{NSLinkAttributeName : self.library.homepageURL};
     NSAttributedString *linkString = [[NSAttributedString alloc] initWithString:[self.library.homepageURL absoluteString]
     attributes:linkAttributes];
     self.homepageLabel.attributedText = linkString;
     self.summaryLabel.text = self.library.summary;
     */
    
    self.numberOfStarsLabel.text = [NSString stringWithFormat:@"%@ stars", @(self.library.numberOfStars)];
    NSDictionary *linkAttributes = @{NSLinkAttributeName : self.library.homepageURL};
    NSAttributedString *linkString  [[NSAttributedString alloc] initWithString:[self.library.homepageURL absoluteString] attributes:linkAttributes];
    self.homepageLabel.attributedText = linkString;
    self.summaryLabel.text = self.library.summary;
}

@end



















