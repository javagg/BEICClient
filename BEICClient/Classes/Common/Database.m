//
//  Database.m
//  BEICClient
//
//  Created by 璐 李 on 11-8-15.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "Database.h"

#import "sqlite3.h"

@implementation Database

- (id)initWithFile:(NSString *)dbFile { 
    self = [super init];
    if (self != nil) {
        NSString *paths = [[NSBundle mainBundle] resourcePath];
        NSString *path = [paths stringByAppendingPathComponent:dbFile]; 
        int result = sqlite3_open([path UTF8String], &dbh);
        NSAssert1(SQLITE_OK == result, NSLocalizedStringFromTable (@"Unable to open the sqlite database (%@).", @"Database", @""), [NSString stringWithUTF8String:sqlite3_errmsg(dbh)]); 
    }
    return self; 
}

- (void)close { 
    if (dbh) {
        sqlite3_close(dbh);
    } 
}

- (sqlite3 *)dbh {
    return dbh;
}

- (sqlite3_stmt *)prepare:(NSString *)sql {
    const char *utfsql = [sql UTF8String]; 
    sqlite3_stmt *statement; 
    if (sqlite3_prepare([self dbh],utfsql,-1,&statement,NULL)==SQLITE_OK) {
        return statement; 
    } else { 
        return 0;
    }
} 

- (id)lookupSingularSQL:(NSString *)sql forType:(NSString *)rettype { 
    id result = nil;
    sqlite3_stmt *statement = [self prepare:sql];
    
    if (statement != nil) { 
        if (sqlite3_step(statement) == SQLITE_ROW) { 
            if ([rettype compare:@"text"] == NSOrderedSame) { 
                result = [NSString stringWithUTF8String: (char *)sqlite3_column_text (statement, 0)]; 
            } else if ([rettype compare:@"integer"] == NSOrderedSame) {
                result = (id)sqlite3_column_int (statement,0); 
            } 
        } 
    }
    
    sqlite3_finalize(statement); 
    return result;
}

@end

