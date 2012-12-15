//
//  SliderViewController.h
//  snappyslider
//
//  Created by Aaron Brethorst on 12/15/12.
//
//

#import <UIKit/UIKit.h>

@class SnappySlider;

@interface SliderViewController : UIViewController
@property(nonatomic,strong) SnappySlider *codeSlider;
@property(nonatomic,strong) IBOutlet SnappySlider *xibSlider;
@property(nonatomic,strong) IBOutlet UILabel *codeLabel;
@property(nonatomic,strong) IBOutlet UILabel *xibLabel;

- (IBAction)xibValueChanged:(id)sender;
@end
