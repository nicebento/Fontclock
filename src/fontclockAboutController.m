//
//  fontclockViewController.m
//  fontclock
//
//  Created by rickb on 5/16/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "fontclockAboutController.h"

@implementation fontclockAboutController

-(IBAction)back:(id)sender
{
	[(id)self.parentViewController dismissModalViewControllerAnimated:YES];	
}

@end
