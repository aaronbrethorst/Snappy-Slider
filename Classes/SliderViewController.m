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
	
	NSArray *detents = [NSArray arrayWithObjects:[NSNumber numberWithInt:0], [NSNumber numberWithInt:20],
						[NSNumber numberWithInt:40], [NSNumber numberWithInt:60],
						[NSNumber numberWithInt:80], [NSNumber numberWithInt:100], nil];
	
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
