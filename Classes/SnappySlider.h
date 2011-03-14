//
//  SnappySlider.h
//  snappyslider
//
//  Created by Aaron Brethorst on 3/13/11.
//  Copyright 2011 Structlab LLC. All rights reserved.
//

#import <UIKit/UISlider.h>

@interface SnappySlider : UISlider
{
	NSArray *detents;
	int* rawDetents;
}
@property(nonatomic,retain) NSArray *detents;
@end
