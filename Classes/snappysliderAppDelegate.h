//
//  snappysliderAppDelegate.h
//  snappyslider
//
//  Created by Aaron Brethorst on 3/13/11.
//  Copyright 2011 Structlab LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SnappySlider.h"

@interface snappysliderAppDelegate : NSObject <UIApplicationDelegate>
{
    UIWindow *window;
	SnappySlider *slider;
	SnappySlider *xibSlider;
	
	UILabel *codeLabel;
	UILabel *xibLabel;
}
@property(nonatomic,retain) IBOutlet SnappySlider *xibSlider;
@property(nonatomic,retain) IBOutlet UILabel *codeLabel;
@property(nonatomic,retain) IBOutlet UILabel *xibLabel;
@property (nonatomic, retain) IBOutlet UIWindow *window;
- (IBAction)xibValueChanged:(id)sender;
@end

