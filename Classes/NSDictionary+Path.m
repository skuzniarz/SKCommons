//
//  NSDictionary+Path.m
//  SKCommons
//
//  Created by skuzniarz on 19/08/13.
//  Copyright (c) 2013-2014 Szczepan Kuzniarz. All rights reserved.
//

#import "NSDictionary+Path.h"


@implementation NSDictionary (Path)

- (id)objectForPath:(NSString *)path {
    NSArray *pathComponents = [path componentsSeparatedByString:@"/"];
    if ([pathComponents count] == 0) {
        return nil;
    }
    NSMutableArray *result = [NSMutableArray array];
    [self sk_objectsForPath:pathComponents startingFrom:self storingInto:result];
    if ([result count] == 0) {
        return nil;
    } else {
        if ([self sk_isWildcard:path]) {
            return result;
        } else {
            return result[0];
        }
    }
}

- (void)sk_objectsForPath:(NSArray *)pathComponents startingFrom:(NSDictionary *)current storingInto:(NSMutableArray *) result {
    int i = 0;
    while (true) {
        NSString *pathComponent = pathComponents[i];
        if (![self sk_isWildcard:pathComponent]) {
            i++;
            if (i == [pathComponents count]) {
                if ([current objectForKey:pathComponent] != nil) {
                    [result addObject:[current objectForKey:pathComponent]];
                }
                return;
            }
            current = (NSDictionary *)[current objectForKey:pathComponent];
            if (current == nil) {
                return;
            }
        } else {
            i++;
            if (i == [pathComponents count]) {
                [NSException raise:@"Invalid path" format:@"Last component of path %@ is a wildcard", pathComponent];
            }
            NSEnumerator *keyEnumerator = [current keyEnumerator];
            NSString *key;
            NSArray *restOfPath = [pathComponents subarrayWithRange:NSMakeRange(i, [pathComponents count] - i)];
            while ((key = [keyEnumerator nextObject]) != nil) {
                if ([key rangeOfString:pathComponent options:NSRegularExpressionSearch].location != NSNotFound) {
                    [self sk_objectsForPath:restOfPath startingFrom:[current objectForKey:key] storingInto:result];
                }
            }
            return;
        }
    }
}

- (BOOL)sk_isWildcard:(NSString *)path {
    return ([path rangeOfString:@".*"].location != NSNotFound);
}

@end
