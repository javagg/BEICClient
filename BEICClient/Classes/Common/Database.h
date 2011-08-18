//
//  Database.h
//  BEICClient
//
//  Created by 璐 李 on 11-8-15.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "sqlite3.h"


@interface Database : NSObject {
    sqlite3 *dbh;
}

- (id)initWithFile:(NSString *)dbFile;
- (void)close;
- (sqlite3 *)dbh;
- (sqlite3_stmt *)prepare:(NSString *)sql;
- (id)lookupSingularSQL:(NSString *)sql forType:(NSString *)rettype;

@end
