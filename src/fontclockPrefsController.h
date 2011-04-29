//
//  fontclockViewController.h
//  fontclock
//
//  Created by rickb on 5/16/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

#define TITLE_FONT_SIZE 17
#define HEADER_FONT_SIZE 40

@interface fontclockPrefsController : UIViewController 
{
}

@end


@interface fontclockOptionsView : UIView 
{
	NSArray* buttons;
	id target;
	SEL selector;

}

-(id)initWithHeader:(UIView*)header buttons:(NSArray*)buttons;
-(void)setTarget:(id)targer selector:(SEL)selector;

@end

@interface fontclockColorSwatch : UIButton
{
}

-(id)initWithFrame:(CGRect)frame;

@end


@interface fontclockColorSwatchGroup : UIView 
{
	NSArray* buttons;
	int selectedIndex;
	id target;
	SEL selector;
}

@property int selectedIndex;

-(id)initWithHeader:(UIView*)header colors:(NSArray*)colors;
-(void)setTarget:(id)targer selector:(SEL)selector;

@end
