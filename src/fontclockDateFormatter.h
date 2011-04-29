//
//  fontclockAppDelegate.h
//  fontclock
//
//  Created by rickb on 5/16/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

@interface fontclockDateFormatter : NSDateFormatter
{
	BOOL displayAsWords;
	BOOL allCaps;
}

@property BOOL displayAsWords;
@property BOOL allCaps;

@end

