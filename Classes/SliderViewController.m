//
//  SliderViewController.m
//  snappyslider
//
//  Created by Aaron Brethorst on 12/15/12.
//
//

#import "SliderViewController.h"
#import "SnappySlider.h"

@implementation SliderViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	self.codeSlider = [[SnappySlider alloc] initWithFrame:CGRectMake(20, 61, 280, 23)];
	
	NSArray *detents = @[@0, @20, @40, @60, @80, @100];
	
	self.codeSlider.detents = detents;
	self.xibSlider.detents = detents;
	
	[self.codeSlider addTarget:self action:@selector(val:) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:self.codeSlider];
}


- (void)val:(id)sender
{
	self.codeLabel.text = [NSString stringWithFormat:@"Created in code: %.0f", self.codeSlider.value];
}

- (IBAction)xibValueChanged:(id)sender
{
	self.xibLabel.text = [NSString stringWithFormat:@"Created in XIB: %.0f", self.xibSlider.value];
}

@end
