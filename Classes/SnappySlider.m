//
//  SnappySlider.m
//  snappyslider
//
//  Created by Aaron Brethorst on 3/13/11.
//  Copyright 2011 Structlab LLC. All rights reserved.
//

#import "SnappySlider.h"

@implementation SnappySlider
@synthesize detents;

- (id)initWithFrame:(CGRect)aFrame
{
	if ((self = [super initWithFrame:aFrame]))
	{
		rawDetents = NULL;
		detents = nil;
	}
	return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
	if ((self = [super initWithCoder:aDecoder]))
	{
		rawDetents = NULL;
		detents = nil;
	}
	return self;
}

- (void)setDetents:(NSArray *)v
{
	if (detents == v)
	{
		return;
	}
	
	NSArray *newDetents = [[v sortedArrayUsingSelector:@selector(compare:)] copy];
	
	[detents release];
	detents = newDetents;
	
	if (nil != rawDetents)
	{
		free(rawDetents);
	}
	
	rawDetents = malloc(sizeof(int) * [detents count]);
	
	for (int i=0; i<[detents count]; i++)
	{
		rawDetents[i] = [[detents objectAtIndex:i] intValue];
	}
	
	self.minimumValue = [[detents objectAtIndex:0] floatValue];
	self.maximumValue = [[detents lastObject] floatValue];
}

- (void)setValue:(float)value animated:(BOOL)animated
{
	int bestDistance = INT_MAX;
	int bestFit = INT_MAX;
	
	for (int i=0; i < [detents count]; i++)
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

- (void)dealloc
{
	self.detents = nil;
	free(rawDetents);
	[super dealloc];
}

@end
