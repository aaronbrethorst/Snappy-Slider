//
//  SnappySlider.m
//  snappyslider
//
//  Created by Aaron Brethorst on 3/13/11.
//  Copyright (c) 2011 Aaron Brethorst
// 
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

#import "SnappySlider.h"

typedef void (^SliderValueChangedHandler) (id sender, int value);

@interface SnappySlider ()
- (void)_configureView;
@property(nonatomic,copy) SliderValueChangedHandler valueChangedHandler;
@end

@implementation SnappySlider

- (id)initWithFrame:(CGRect)aFrame
{
	if ((self = [super initWithFrame:aFrame]))
	{
		[self _configureView];
	}
	return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
	if ((self = [super initWithCoder:aDecoder]))
	{
        [self _configureView];
	}
	return self;
}

- (void)_configureView
{
    rawDetents = NULL;
    self.detents = nil;
    [self addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
}

- (void)valueChanged:(id)sender
{
    if (self.valueChangedHandler)
    {
        self.valueChangedHandler(self, (int)self.value);
    }
}

- (void)setDetents:(NSArray *)v
{
	if (_detents == v)
	{
		return;
	}
	
	NSArray *newDetents = [[v sortedArrayUsingSelector:@selector(compare:)] copy];
	
	_detents = newDetents;
	
	if (nil != rawDetents)
	{
		free(rawDetents);
	}
	
	rawDetents = malloc(sizeof(int) * [self.detents count]);
	
	for (int i=0; i < self.detents.count; i++)
	{
		rawDetents[i] = [(self.detents)[i] intValue];
	}
	
	self.minimumValue = [(self.detents)[0] floatValue];
	self.maximumValue = [self.detents.lastObject floatValue];
}

- (void)setValue:(float)value animated:(BOOL)animated
{
	int bestDistance = INT_MAX;
	int bestFit = INT_MAX;
	
	for (int i=0; i < self.detents.count; i++)
	{
		int candidate = rawDetents[i];
		int candidateDistance = abs(candidate - (int)value);
		
		if (candidateDistance < bestDistance)
		{
			bestFit = candidate;
			bestDistance = candidateDistance;
		}
	}
		
	[super setValue:(float)bestFit animated:animated];
}

- (void)valueDidChange:(void (^)(id, int))block
{
    self.valueChangedHandler = block;
}

- (void)dealloc
{
	free(rawDetents);
}

@end
