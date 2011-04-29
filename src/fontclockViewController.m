//
//  fontclockViewController.m
//  fontclock
//
//  Created by rickb on 5/16/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "fontclockViewController.h"
#import "fontclockDateView.h"
#import "fontclockDateFormatter.h"
#import "fontclockPrefsController.h"

static NSString* appFonts[] =
{
	@"HelveticaNeue-Bold"
,	@"ArialRoundedMTBold"
,	@"Georgia-Bold"
};

NSArray* colors;

@implementation fontclockViewController

-(void)setFontAndColors
{
	UIFont* titleFont  = [UIFont fontWithName:appFonts[[[NSUserDefaults standardUserDefaults] integerForKey:@"titlefont"]] size:TITLE_FONT_SIZE];
	UIFont* headerFont = [UIFont fontWithName:appFonts[[[NSUserDefaults standardUserDefaults] integerForKey:@"headerfont"]] size:HEADER_FONT_SIZE];

	UIColor* titleColor = [colors objectAtIndex:[[NSUserDefaults standardUserDefaults] integerForKey:@"titlecolor"]];
	UIColor* headerColor= [colors objectAtIndex:[[NSUserDefaults standardUserDefaults] integerForKey:@"headercolor"]];
	UIColor* bgcolor = [colors objectAtIndex:[[NSUserDefaults standardUserDefaults] integerForKey:@"backgroundcolor"]];
	UIColor* divColor = [colors objectAtIndex:[[NSUserDefaults standardUserDefaults] integerForKey:@"linecolor"]];
	
	date.label.font = titleFont;
	date.label.textColor = titleColor;

	AMorPMheader.label.font = titleFont;
	AMorPMheader.label.textColor = titleColor;

	hourHeader.font = titleFont;
	hourHeader.textColor = titleColor;
	
	minuteHeader.font = titleFont;
	minuteHeader.textColor = titleColor;
	
	secondHeader.font = titleFont;
	secondHeader.textColor = titleColor;
	
	day.label.font = headerFont;
	day.label.textColor = headerColor;

	hour.label.font = headerFont;
	hour.label.textColor = headerColor;

	minute.label.font = headerFont;
	minute.label.textColor = headerColor;

	second.label.font = headerFont;
	second.label.textColor = headerColor;

	AMorPM.label.font = headerFont;
	AMorPM.label.textColor = headerColor;
	
	self.view.backgroundColor = bgcolor;

	div1.backgroundColor = divColor;
	div2.backgroundColor = divColor;
	div3.backgroundColor = divColor;
	div4.backgroundColor = divColor;
	div5.backgroundColor = divColor;
	
	fontclockDateFormatter* formatter;

	formatter = [[fontclockDateFormatter new] autorelease];
	formatter.displayAsWords = YES;

	BOOL hour24 = [[NSUserDefaults standardUserDefaults] boolForKey:@"24hour"];
	if(hour24)
	{
		[AMPMparent removeFromSuperview];
		container.bounds = CGRectMake(0,-AMPMparent.bounds.size.height/2,container.bounds.size.width,container.bounds.size.height);
		[formatter setDateFormat:@"H"];
	}else
	{
		if(AMPMparent.superview == nil)
			[container addSubview:AMPMparent];
		container.bounds = CGRectMake(0,0,container.bounds.size.width,container.bounds.size.height);
		[formatter setDateFormat:@"h"];
	}

	hour.formatter = formatter;	
}

-(void)viewDidLoad
{
	fontclockDateFormatter* formatter;
	
	formatter = [[fontclockDateFormatter new] autorelease];
	formatter.allCaps = YES;
	[formatter setDateFormat:@"MMMM #d# y"];
	date.formatter = formatter; 
	date.label.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:HEADER_FONT_SIZE];
	date.label.textColor = [UIColor colorWithWhite:.75 alpha:1];

	formatter = [[fontclockDateFormatter new] autorelease];
	[formatter setDateFormat:@"EEEE"];
	day.formatter = formatter;
	day.label.font = [UIFont fontWithName:@"ArialRoundedMTBold" size:TITLE_FONT_SIZE];

	hour.label.font = [UIFont fontWithName:@"ArialRoundedMTBold" size:TITLE_FONT_SIZE];

	formatter = [[fontclockDateFormatter new] autorelease];
	formatter.displayAsWords = YES;
	[formatter setDateFormat:@"m"];
	minute.formatter = formatter;
	minute.label.font = [UIFont fontWithName:@"ArialRoundedMTBold" size:TITLE_FONT_SIZE];

	formatter = [[fontclockDateFormatter new] autorelease];
	formatter.displayAsWords = YES;
	[formatter setDateFormat:@"s"];
	second.formatter = formatter;
	second.label.font = [UIFont fontWithName:@"ArialRoundedMTBold" size:TITLE_FONT_SIZE];

	formatter = [[fontclockDateFormatter new] autorelease];
	formatter.allCaps = YES;
	formatter.displayAsWords = YES;
	[formatter setDateFormat:@"a"];
	AMorPMheader.formatter = formatter;
	AMorPMheader.label.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:HEADER_FONT_SIZE];
	AMorPMheader.label.textColor = [UIColor colorWithWhite:.75 alpha:1];

	formatter = [[fontclockDateFormatter new] autorelease];
	formatter.allCaps = YES;
	[formatter setDateFormat:@"a"];
	AMorPM.formatter = formatter;
	AMorPM.label.font = [UIFont fontWithName:@"ArialRoundedMTBold" size:TITLE_FONT_SIZE];

	[AMPMparent retain];
}

-(void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	[self setFontAndColors];
}

-(void)showPrefs:(id)sender
{
	fontclockPrefsController *controller = [fontclockPrefsController new];
	controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
	[self presentModalViewController:controller animated:YES];
	[controller release];
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	if([[touches anyObject] tapCount] == 2)
		[self showPrefs:self];
}

- (void)dealloc 
{
	[AMPMparent release];
	[super dealloc];
}

@end
