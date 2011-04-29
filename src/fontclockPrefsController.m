//
//  fontclockViewController.m
//  fontclock
//
//  Created by rickb on 5/16/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "fontclockPrefsController.h"
#import "fontclockAboutController.h"

#define DIV_HEIGHT 1

extern NSArray* colors;

@implementation fontclockPrefsController

-(void)titleFontChanged:(NSNumber*)index
{
	[[NSUserDefaults standardUserDefaults] setInteger:[index intValue] forKey:@"titlefont"];
}

-(void)titleColorChanged:(NSNumber*)index
{
	[[NSUserDefaults standardUserDefaults] setInteger:[index intValue] forKey:@"titlecolor"];
}

-(void)headerFontChanged:(NSNumber*)index
{
	[[NSUserDefaults standardUserDefaults] setInteger:[index intValue] forKey:@"headerfont"];
}

-(void)headerColorChanged:(NSNumber*)index
{
	[[NSUserDefaults standardUserDefaults] setInteger:[index intValue] forKey:@"headercolor"];
}

-(void)hour24changed:(NSNumber*)index
{
	[[NSUserDefaults standardUserDefaults] setBool:![index boolValue] forKey:@"24hour"];
}

-(void)lineColorChanged:(NSNumber*)index
{
	[[NSUserDefaults standardUserDefaults] setInteger:[index intValue] forKey:@"linecolor"];
}

-(void)backgroundColorChanged:(NSNumber*)index
{
	[[NSUserDefaults standardUserDefaults] setInteger:[index intValue] forKey:@"backgroundcolor"];
}

-(void)back:(id)sender
{
	[(id)self.parentViewController dismissModalViewControllerAnimated:YES];	
}
-(void)about:(id)sender
{
	fontclockAboutController *controller = [[fontclockAboutController alloc] initWithNibName:@"fontclockAboutController" bundle:nil];
	controller.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
	[self presentModalViewController:controller animated:YES];
	[controller release];
}

- (void)loadView
{
	[super loadView];
	
	UIScrollView* scroller = [[[UIScrollView alloc] initWithFrame:self.view.bounds] autorelease];
	[self.view addSubview:scroller];

	float x = 19;
	float y = 0;
	float width = 320-(x*2);
	float height = 32;
	float gap = 10;
		
	{
		int pref = [[NSUserDefaults standardUserDefaults] integerForKey:@"titlefont"];
		
		UILabel* header = [[[UILabel alloc]initWithFrame:CGRectMake(0,0,width,height)] autorelease];
		header.text = @"Title Font";
		header.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:24];
		
		UIButton* b1 = [UIButton buttonWithType:UIButtonTypeCustom];
		b1.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:TITLE_FONT_SIZE];
		[b1 setTitle:@"Helvetica" forState:UIControlStateNormal];
		if(pref == 0) b1.selected = YES;
		
		UIButton* b2 = [UIButton buttonWithType:UIButtonTypeCustom];
		b2.titleLabel.font = [UIFont fontWithName:@"ArialRoundedMTBold" size:TITLE_FONT_SIZE];
		[b2 setTitle:@"Arial" forState:UIControlStateNormal];
		if(pref == 1) b2.selected = YES;

		UIButton* b3 = [UIButton buttonWithType:UIButtonTypeCustom];
		b3.titleLabel.font = [UIFont fontWithName:@"Georgia-Bold" size:TITLE_FONT_SIZE];
		[b3 setTitle:@"Georgia" forState:UIControlStateNormal];
		if(pref == 2) b3.selected = YES;

		fontclockOptionsView* ov = [[[fontclockOptionsView alloc] initWithHeader:header buttons:[NSArray arrayWithObjects:b1,b2,b3,nil]] autorelease];
		ov.frame = CGRectMake(x,y,width,ov.bounds.size.height);
		y += ov.bounds.size.height;
		[ov setTarget:self selector:@selector(titleFontChanged:)];
		[scroller addSubview:ov];
	}
	y += gap;
	{
		int pref = [[NSUserDefaults standardUserDefaults] integerForKey:@"titlecolor"];

		UILabel* header = [[[UILabel alloc]initWithFrame:CGRectMake(0,0,width,height)] autorelease];
		header.text = @"Title Color";
		header.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:24];

		fontclockColorSwatchGroup* sg = [[[fontclockColorSwatchGroup alloc] initWithHeader:header colors:colors] autorelease];
		sg.selectedIndex = pref;
		sg.frame = CGRectMake(x,y,width,sg.bounds.size.height);
		y += sg.bounds.size.height;
		[sg setTarget:self selector:@selector(titleColorChanged:)];

		[scroller addSubview:sg];
	}
	y += gap;
	{
		int pref = [[NSUserDefaults standardUserDefaults] integerForKey:@"headerfont"];

		UILabel* header = [[[UILabel alloc]initWithFrame:CGRectMake(0,0,width,height)] autorelease];
		header.text = @"Header Font";
		header.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:24];
		
		UIButton* b1 = [UIButton buttonWithType:UIButtonTypeCustom];
		b1.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:TITLE_FONT_SIZE];
		[b1 setTitle:@"Helvetica" forState:UIControlStateNormal];
		if(pref == 0) b1.selected = YES;
		
		UIButton* b2 = [UIButton buttonWithType:UIButtonTypeCustom];
		b2.titleLabel.font = [UIFont fontWithName:@"ArialRoundedMTBold" size:TITLE_FONT_SIZE];
		[b2 setTitle:@"Arial" forState:UIControlStateNormal];
		if(pref == 1) b2.selected = YES;

		UIButton* b3 = [UIButton buttonWithType:UIButtonTypeCustom];
		b3.titleLabel.font = [UIFont fontWithName:@"Georgia-Bold" size:TITLE_FONT_SIZE];
		[b3 setTitle:@"Georgia" forState:UIControlStateNormal];
		if(pref == 2) b3.selected = YES;

		fontclockOptionsView* ov = [[[fontclockOptionsView alloc] initWithHeader:header buttons:[NSArray arrayWithObjects:b1,b2,b3,nil]] autorelease];
		ov.frame = CGRectMake(x,y,width,ov.bounds.size.height);
		[ov setTarget:self selector:@selector(headerFontChanged:)];
		y += ov.bounds.size.height;
	
		[scroller addSubview:ov];
	}
	y += gap;
	{
		int pref = [[NSUserDefaults standardUserDefaults] integerForKey:@"headercolor"];

		UILabel* header = [[[UILabel alloc]initWithFrame:CGRectMake(0,0,width,height)] autorelease];
		header.text = @"Header Color";
		header.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:24];

		fontclockColorSwatchGroup* sg = [[[fontclockColorSwatchGroup alloc] initWithHeader:header colors:colors] autorelease];
		sg.frame = CGRectMake(x,y,width,sg.bounds.size.height);
		sg.selectedIndex = pref;
		[sg setTarget:self selector:@selector(headerColorChanged:)];
		y += sg.bounds.size.height;

		[scroller addSubview:sg];
	}
	y += gap;
	{
		BOOL pref = [[NSUserDefaults standardUserDefaults] boolForKey:@"24hour"];

		UILabel* header = [[[UILabel alloc]initWithFrame:CGRectMake(0,0,width,height)] autorelease];
		header.text = @"Use 24-Hour Clock";
		header.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:24];
		
		UIButton* b1 = [UIButton buttonWithType:UIButtonTypeCustom];
		b1.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:TITLE_FONT_SIZE];
		[b1 setTitle:@"Yes" forState:UIControlStateNormal];
		if(pref) b1.selected = YES;

		UIButton* b2 = [UIButton buttonWithType:UIButtonTypeCustom];
		b2.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:TITLE_FONT_SIZE];
		[b2 setTitle:@"No" forState:UIControlStateNormal];
		if(!pref) b2.selected = YES;

		fontclockOptionsView* ov = [[[fontclockOptionsView alloc] initWithHeader:header buttons:[NSArray arrayWithObjects:b1,b2,nil]] autorelease];
		ov.frame = CGRectMake(x,y,width,ov.bounds.size.height);
		[ov setTarget:self selector:@selector(hour24changed:)];
		y += ov.bounds.size.height;
	
		[scroller addSubview:ov];
	}
	y += gap;
	{

		int pref = [[NSUserDefaults standardUserDefaults] integerForKey:@"linecolor"];

		UILabel* header = [[[UILabel alloc]initWithFrame:CGRectMake(0,0,width,height)] autorelease];
		header.text = @"Line Color";
		header.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:24];

		fontclockColorSwatchGroup* sg = [[[fontclockColorSwatchGroup alloc] initWithHeader:header colors:colors] autorelease];
		sg.frame = CGRectMake(x,y,width,sg.bounds.size.height);
		sg.selectedIndex = pref;
		[sg setTarget:self selector:@selector(lineColorChanged:)];
		y += sg.bounds.size.height;

		[scroller addSubview:sg];
	}
	y += gap;
	{
		int pref = [[NSUserDefaults standardUserDefaults] integerForKey:@"backgroundcolor"];

		UILabel* header = [[[UILabel alloc]initWithFrame:CGRectMake(0,0,width,height)] autorelease];
		header.text = @"Background Color";
		header.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:24];

		fontclockColorSwatchGroup* sg = [[[fontclockColorSwatchGroup alloc] initWithHeader:header colors:colors] autorelease];
		sg.frame = CGRectMake(x,y,width,sg.bounds.size.height);
		sg.selectedIndex = pref;
		[sg setTarget:self selector:@selector(backgroundColorChanged:)];
		y += sg.bounds.size.height;

		[scroller addSubview:sg];
	}
	y += gap;
	UIView*	divider = [[[UIView alloc] initWithFrame:CGRectMake(x,y,width,DIV_HEIGHT)] autorelease];
	divider.backgroundColor = [UIColor blackColor];
	[scroller addSubview:divider];
	y += divider.bounds.size.height;
	y += gap;
	{
		UIButton* button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
		[button setTitle:@"Done" forState:UIControlStateNormal];
		[button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
		button.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:24];
		[button sizeToFit];
		button.frame = CGRectMake(300-button.bounds.size.width, y,button.bounds.size.width,32);
		[button addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
		[scroller addSubview:button];
	}
	{
		UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
		[button setImage:[UIImage imageNamed:@"bentologo.png"] forState:UIControlStateNormal];
		[button sizeToFit];
		button.center = CGPointMake(x+button.bounds.size.width/2, y + button.bounds.size.height/2);
		[button addTarget:self action:@selector(about:) forControlEvents:UIControlEventTouchUpInside];
		y += button.bounds.size.height;

		[scroller addSubview:button];
	}
	y += 20;	
	scroller.contentSize = CGSizeMake(300, y);
} 

- (void)dealloc 
{
	[super dealloc];
}

@end


@implementation fontclockOptionsView

-(void)buttonClick:(UIButton*)button
{
	if(!button.selected)
	{
		for(UIButton* b in buttons)
		{
			b.selected = (b == button);
		}
	}
	[target performSelector:selector withObject:[NSNumber numberWithInt:button.tag]];
}

-(void)setTarget:(id)t selector:(SEL)s
{
	target = t;
	selector = s;
}

-(id)initWithHeader:(UIView*)header buttons:(NSArray*)b
{
	[super init];

	buttons = [b retain];
	
	self.autoresizesSubviews = NO;
	
	UIView* divider;
	float y = 0;
	float width = header.bounds.size.width;
	float height = header.bounds.size.height;
	
	[self addSubview:header];
	y += height;
	
	divider = [[[UIView alloc] initWithFrame:CGRectMake(0,y,width,DIV_HEIGHT)] autorelease];
	divider.backgroundColor = [UIColor blackColor];
	[self addSubview:divider];
	y += divider.bounds.size.height;

	int i = 0;
	
	for(UIButton* button in buttons)
	{
		button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
		[button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal]; 
		[button setTitleColor:[UIColor blackColor] forState:UIControlStateSelected]; 
		[button setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted]; 
		[button setTitle:[[button titleForState:UIControlStateNormal] stringByAppendingString:@" \u2713"] forState:UIControlStateSelected];
		 
		button.frame = CGRectMake(0, y, width, height);
		[self addSubview:button];
		button.tag = i++;
		y += button.bounds.size.height;
		[button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];

		divider = [[[UIView alloc] initWithFrame:CGRectMake(0,y,width,DIV_HEIGHT)] autorelease];
		divider.backgroundColor = [UIColor blackColor];
		[self addSubview:divider];
		y += divider.bounds.size.height;
	}
	
	self.frame = CGRectMake(0,0, width, y);
	
	return self;
}

-(void)dealloc
{
	[buttons release];
	[super dealloc];
}

@end

@implementation fontclockColorSwatch 

-(id)initWithFrame:(CGRect)frame
{
	[super initWithFrame:frame];

	[self setImage:[UIImage imageNamed:@"swatchoff.png"] forState:UIControlStateNormal];
	[self setImage:[UIImage imageNamed:@"swatchon.png"] forState:UIControlStateSelected];
	[self setImage:[UIImage imageNamed:@"swatchon.png"] forState:UIControlStateHighlighted];

	return self;
}

-(void)setBackgroundColor:(UIColor *)color
{
	[super setBackgroundColor:color];
	
	if(color == [UIColor whiteColor])
	{
		[self setImage:[UIImage imageNamed:@"swatchoff-white.png"] forState:UIControlStateNormal];
	}
}

@end

@implementation fontclockColorSwatchGroup

@synthesize selectedIndex;

-(void)dealloc
{
	[buttons release];
	[super dealloc];
}

-(void)buttonClick:(UIButton*)button
{
	if(!button.selected)
	{
		for(UIButton* b in buttons)
		{
			b.selected = (b == button);
		}
	}
	[target performSelector:selector withObject:[NSNumber numberWithInt:button.tag]];
}

-(void)setTarget:(id)t selector:(SEL)s
{
	target = t;
	selector = s;
}


-(void)setSelectedIndex:(int)idx
{
	selectedIndex = idx;
	int i = 0;
	for(UIButton* b in buttons)
	{
		b.selected = (i == selectedIndex);
		i++;
	}	
}


-(id)initWithHeader:(UIView*)header colors:(NSArray*)colors
{
	[super init];
	
	self.autoresizesSubviews = NO;

	UIView* divider;
	float y = 0;
	float width = header.bounds.size.width;
	float height = header.bounds.size.height;
	
	[self addSubview:header];
	y += height;
	
	divider = [[[UIView alloc] initWithFrame:CGRectMake(0,y,width,DIV_HEIGHT)] autorelease];
	divider.backgroundColor = [UIColor blackColor];
	[self addSubview:divider];
	y += divider.bounds.size.height;
	y += 10;
	
	CGRect rect = CGRectMake(0, y, 32, 32);
	int i = 0;
	NSMutableArray* array = [NSMutableArray new];
	
	for(UIColor* color in colors)
	{
		fontclockColorSwatch* sw = [[[fontclockColorSwatch alloc] initWithFrame:rect] autorelease];
		[array addObject:sw];
		sw.backgroundColor = color;
		[sw addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
		sw.frame = rect;
		[self addSubview:sw];
		rect = CGRectMake(rect.origin.x+rect.size.width+18,y,rect.size.width,rect.size.height);
		sw.tag = i++;
		if(i == 6)
		{
			y += rect.size.height + 10;
			rect = CGRectMake(0, y, 32, 32);
		}
	}
	y += rect.size.height;
	self.frame = CGRectMake(0,0, width, y);
	buttons = array;
	
	self.selectedIndex = 0;	

	return self;
}

@end