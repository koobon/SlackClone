//
//  JSONUtil.h
//  dong
//
//  Created by Dev.swing on 2016. 3. 7..
//  Copyright © 2016년 RichwareSystems. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JSONUtil : NSObject

+ (id)objectFromJson:(NSString*)json ;

+ (NSString*)jsonFromObject:(id)obj ;

@end
