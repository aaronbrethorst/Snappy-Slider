//
//  SliderViewController.m
//  snappyslider
//
//  Created by Aaron Brethorst on 12/15/12.
// (c)2011 Aaron Brethorst.
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

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
