//
//  fontclockAppDelegate.h
//  fontclock
//
//  Created by rickb on 5/16/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

@interface fontclockDateView : UIView
{
	NSDateFormatter* formatter;
	UILabel* label;
	UILabel* nextLabel;
	NSTimer* updateClock;
}

@property (retain) NSDateFormatter* formatter;
@property (readonly) UILabel* label;

@end

