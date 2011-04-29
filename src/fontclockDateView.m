//
//  fontclockAppDelegate.m
//  fontclock
//
//  Created by rickb on 5/16/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "fontclockDateView.h"

@implementation fontclockDateView

@synthesize formatter, label;

 -(void)animationDidStop:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context
 {
	UILabel* tmp = nextLabel;
	nextLabel = label;
	label = tmp;
 }

-(void)updateClock:(NSTimer*)timer
{
	NSString* text = [formatter stringFromDate:[NSDate date]];
	if([text compare:label.text] == NSOrderedSame) return;

	nextLabel.text = text;
	nextLabel.font = label.font;
	nextLabel.textColor = label.textColor;
	nextLabel.center = CGPointMake(nextLabel.center.x,nextLabel.frame.size.width*-3/2);

	[UIView beginAnimations:@"slide" context:NULL];
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDidStopSelector:@selector(animationDidStop:finished:context:)];
	label.center = CGPointMake(label.center.x, label.frame.size.height*3/2);
	nextLabel.center = CGPointMake(nextLabel.center.x, nextLabel.frame.size.height/2);
	[UIView commitAnimations]; 
}

-(void)awakeFromNib
{
	self.backgroundColor = [UIColor clearColor];

	label = [[UILabel alloc] initWithFrame:self.bounds];
	[self addSubview:label];
	label.backgroundColor = [UIColor clearColor];
	
	nextLabel = [[UILabel alloc] initWithFrame:self.bounds];
	[self addSubview:nextLabel];
	nextLabel.backgroundColor = [UIColor clearColor];	
	nextLabel.center = CGPointMake(nextLabel.center.x,nextLabel.frame.size.width*-3/2);

	updateClock = [NSTimer scheduledTimerWithTimeInterval:.5 target:self selector:@selector(updateClock:) userInfo:nil repeats:YES]; 
}

-(void)dealloc
{
	[updateClock invalidate];
	[formatter release];
	[nextLabel release];
	[label release];
	[super dealloc];
}
@end
