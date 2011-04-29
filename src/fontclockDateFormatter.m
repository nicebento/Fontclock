//
//  fontclockAppDelegate.m
//  fontclock
//
//  Created by rickb on 5/16/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "fontclockDateFormatter.h"

static NSString* digitStrings[] =
{
	@"Zero"
,	@"One"
,	@"Two"
,	@"Three"
,	@"Four"
,	@"Five"
,	@"Six"
,	@"Seven"
,	@"Eight"
,	@"Nine"
};

NSString* tenStrings[] = 
{
	@""
,	@"Ten"
,	@"Twenty"
,	@"Thirty"
,	@"Forty"
,	@"Fifty"
,	@"Sixty"
,	@"Seventy"
,	@"Eighty"
,	@"Ninety"
};

NSString* teenStrings[] =
{
	@"Ten"
,	@"Eleven"
,	@"Twelve"
,	@"Thirteen"
,	@"Fourteen"
,	@"Fifteen"
,	@"Sixteen"
,	@"Seventeen"
,	@"Eighteen"
,	@"Nineteen"
};

@implementation fontclockDateFormatter

@synthesize displayAsWords, allCaps;

-(NSString*)displayAsWords:(NSString*)dateString
{
	if([dateString compare:[self AMSymbol]] == NSOrderedSame)
	{
		return @"Ante Meridian";
	}else if([dateString compare:[self PMSymbol]] == NSOrderedSame)
	{
		return @"Post Meridian";
	}
	
	int num = atoi([dateString UTF8String]);
	int digit = num%10;
	int tens  = num/10;
	if(num >= 0 && num < 10)
	{
		dateString = [NSString stringWithFormat:@"%@",digitStrings[digit]];
	}else if(num >= 10 && num < 20)
	{
		dateString = [NSString stringWithFormat:@"%@",teenStrings[digit]];
	}else if(digit == 0)
	{
		dateString = [NSString stringWithFormat:@"%@",tenStrings[tens]];
	}else if(num >= 20 && num < 100)
	{
		dateString = [NSString stringWithFormat:@"%@ %@",tenStrings[tens], digitStrings[digit]];
	}
	
	return dateString;
}

-(NSString*)addNumberEnding:(NSString*)dateString
{
	NSRange startOrdinal = [dateString rangeOfString:@"#"];
	if(startOrdinal.length > 0)
	{
		NSRange endOrdinal = [dateString rangeOfString:@"#" options:0 range:NSMakeRange(startOrdinal.location+1,dateString.length-(startOrdinal.location+1))];
		if(endOrdinal.length > 0)
		{
			NSRange numRange = NSMakeRange(startOrdinal.location+1, endOrdinal.location-startOrdinal.location-1);
			NSString* numString = [dateString substringWithRange:numRange];
			
			NSString* numberEnding = @"th";
			int num = atoi([numString UTF8String]);
			int digit = num%10;
			
			if(num == 11 || num == 12 || num == 13)
				numberEnding = @"th";
			else if(digit == 1)
				numberEnding = @"st";
			else if(digit == 2)
				numberEnding = @"nd";
			else if(digit == 3)
				numberEnding = @"rd";
			
			numString = [numString stringByAppendingString:numberEnding];
			
			NSRange replaceRange = NSMakeRange(startOrdinal.location, endOrdinal.location-startOrdinal.location+1);
			dateString = [dateString stringByReplacingCharactersInRange:replaceRange withString:numString];
		}
	}
	return dateString;
}

- (NSString *)stringFromDate:(NSDate *)date
{
	NSString* dateString = [super stringFromDate:date];
	
	if(displayAsWords)
		dateString = [self displayAsWords:dateString];
	
	dateString = [self addNumberEnding:dateString];
	
	if(allCaps)
		dateString = [dateString uppercaseString];
	
	return dateString;
}

@end
