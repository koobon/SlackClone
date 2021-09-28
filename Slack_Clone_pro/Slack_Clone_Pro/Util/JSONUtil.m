//
//  JSONUtil.m
//  dong
//
//  Created by Dev.swing on 2016. 3. 7..
//  Copyright © 2016년 RichwareSystems. All rights reserved.
//

#import "JSONUtil.h"

@implementation JSONUtil

+(id)objectFromJson:(NSString*) json {
    
    NSData *data = [json dataUsingEncoding:NSUTF8StringEncoding];
    
    if( data == nil )
        return nil ;
    
    return [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    
}

+(NSString*)jsonFromObject:(id)obj {
        
    NSData *data = nil ;
    
    @try {
        
        NSError *err = nil ;
        
        data = [NSJSONSerialization dataWithJSONObject:obj options:0 error:&err] ;
        
    } @catch (NSException *exception) {
                
    } @finally {
        
    }
    
    if( data == nil )
        return nil ;
    
    
    NSString* json = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding] ;
    return json ;
}


@end
