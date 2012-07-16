//
//  BI_LZMAUtil.m
//  
//
//  Created by lv on 12/7/13.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "BI_LZMAUtil.h"

extern int do7z_extract_entry(char *archivePath, char *entryName, char *entryPath);

@implementation LV_LZMAUtil

// Extract all the contents of a .7z archive into the indicated  dir

+ (BOOL) extract7zArchive:(NSString*)archivePath
			  toDirectory:(NSString*)dstPath;
{
	NSLog(@">>>>extract7zArchive=%@,dstPath=%@",archivePath, dstPath);
	//I Set Default Command =x
	/*
	 "Usage: 7zDec <command> <archive_name>\n\n"
	 "<Commands>\n"
	 "  e: Extract files from archive (without using directory names)\n"
	 "  l: List contents of archive\n"
	 "  t: Test integrity of archive\n"
	 "  x: eXtract files with full paths\n");
	 */
	if ([archivePath length]<=0||[dstPath length]<=0) 
	{
		NSLog(@"archivePath or dstPath is nil!!");
		return NO;
	}
	
	NSFileManager* fileManager = [NSFileManager defaultManager];
	[fileManager removeItemAtPath:dstPath error:nil];
	if (![fileManager fileExistsAtPath:dstPath])
	{
		[fileManager createDirectoryAtPath:dstPath withIntermediateDirectories:YES attributes:nil error:nil];
	}
	
	if(![fileManager changeCurrentDirectoryPath:dstPath])
	{
		NSLog(@"cd to %@ error!!",dstPath);
		return NO;
	}
	char *archivePathPtr = (char*) [archivePath UTF8String];
	int result = do7z_extract_entry(archivePathPtr, NULL, NULL);
	return result==0;
}


@end
