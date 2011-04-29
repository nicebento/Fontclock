//
//  fontclockAppDelegate.m
//  fontclock
//
//  Created by rickb on 5/16/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "fontclockAppDelegate.h"
#import "fontclockViewController.h"

NSArray* colors;

@implementation fontclockAppDelegate

@synthesize window;
@synthesize rootViewController;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions 
{        
	[[NSUserDefaults standardUserDefaults] registerDefaults: [NSDictionary dictionaryWithObjectsAndKeys:
		[NSNumber numberWithInt:1], @"titlefont"
	,	[NSNumber numberWithInt:0], @"headerfont"
	,	[NSNumber numberWithInt:0], @"titlecolor"
	,	[NSNumber numberWithInt:0], @"linecolor"
	,	[NSNumber numberWithInt:1], @"headercolor"
	,	[NSNumber numberWithInt:11],@"backgroundcolor"
	,	[NSNumber numberWithBool:NO], @"24hour"
	,nil]];

	colors = [[NSArray arrayWithObjects:[UIColor blackColor], [UIColor lightGrayColor], [UIColor redColor],[UIColor greenColor], [UIColor blueColor], [UIColor yellowColor], [UIColor magentaColor], [UIColor purpleColor], [UIColor orangeColor], [UIColor brownColor], [UIColor cyanColor], [UIColor whiteColor],nil] retain];

	[window addSubview:rootViewController.view];
    [window makeKeyAndVisible];

	return YES;
}

- (void)dealloc 
{
    [rootViewController release];
    [window release];
    [super dealloc];
}
@end
