//
//  fontclockViewController.h
//  fontclock
//
//  Created by rickb on 5/16/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class fontclockDateView;

@interface fontclockViewController : UIViewController 
{
	IBOutlet fontclockDateView* date;
	IBOutlet fontclockDateView* day;
	IBOutlet UILabel* hourHeader;
	IBOutlet fontclockDateView* hour;
	IBOutlet UILabel* minuteHeader;
	IBOutlet fontclockDateView* minute;
	IBOutlet UILabel* secondHeader;
	IBOutlet fontclockDateView* second;
	IBOutlet fontclockDateView* AMorPMheader;
	IBOutlet fontclockDateView* AMorPM;
	IBOutlet UIView* div1;
	IBOutlet UIView* div2;
	IBOutlet UIView* div3;
	IBOutlet UIView* div4;
	IBOutlet UIView* div5;
	IBOutlet UIView* AMPMparent;
	IBOutlet UIView* container;
}

-(IBAction)showPrefs:(id)sender;

@end

