//
//  BI_LZMAUtil.h
//
//  Created by lv on 11/19/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LV_LZMAUtil : NSObject {	
}

// Extract all the contents of a .7z archive into the indicated  dir,Default remove all items in dstPath
+ (BOOL) extract7zArchive:(NSString*)archivePath
					toDirectory:(NSString*)dstPath;



@end

