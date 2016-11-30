//
//  OJCLibraryDetailViewController.h
//  LibrariesObjC
//
//  Created by Jeff Norton on 11/30/16.
//  Copyright © 2016 JeffCryst. All rights reserved.
//

#import <UIKit/UIKit.h>

@class OJCLibrary;

@interface OJCLibraryDetailViewController : UIViewController

// ==================================================
# pragma mark - _Properties
// ==================================================

@property (nonatomic, strong) OJCLibrary *library;

@end
