//
//  fontclockAppDelegate.h
//  fontclock
//
//  Created by rickb on 5/16/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface fontclockAppDelegate : NSObject <UIApplicationDelegate> 
{
    UIWindow *window;
    UIViewController *rootViewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UIViewController *rootViewController;

@end

