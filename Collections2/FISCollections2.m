//
//  FISCollections2.m
//  Collections2
//
//  Created by Chris Gonzales on 5/31/14.
//  Copyright (c) 2014 FIS. All rights reserved.
//

#import "FISCollections2.h"

@implementation FISCollections2

//define methods here

-(BOOL)beginsWithC:(NSArray *)tools
{
    NSString *c = @"c";
    NSPredicate *cFilter = [NSPredicate predicateWithFormat:@"SELF beginsWith %@", c];
    NSArray *filterCarray = [tools filteredArrayUsingPredicate:cFilter];
    
    if ([filterCarray isEqualToArray:tools]) {
        return YES;
    }
    
    return NO;
}

-(NSArray *)containA:(NSArray *)array
{
    NSString *a = @"a";
    NSPredicate *containsAFilter = [NSPredicate predicateWithFormat:@"SELF contains %@", a];
    
    NSArray *filteredArray = [array filteredArrayUsingPredicate:containsAFilter];
    
    return filteredArray;
}

-(NSString *)firstWa:(NSArray *)array
{
    NSString *wa = @"wa";
    NSPredicate *waFilter = [NSPredicate predicateWithFormat:@"SELF contains %@", wa];
    
    NSArray *waFilteredArray = [array filteredArrayUsingPredicate:waFilter];
    
    return waFilteredArray.firstObject;
}

-(NSArray *)removeNonStrings:(NSArray *)array
{

    NSMutableArray *nsstrings = [NSMutableArray array];
    
    for (NSInteger i = 0; i < array.count; i++) {
        if ([array[i] isKindOfClass:[NSString class]]) {
            [nsstrings addObject:array[i]];
        }
    
    }
    return nsstrings;
    
}

-(NSArray *)countElements:(NSArray *)array
{
    

    NSCountedSet *theCount = [[NSCountedSet alloc] initWithArray:array];
    NSMutableArray *theNewDictionary = [NSMutableArray array];
    
    for (NSDictionary *dictionary in theCount) {
        
        
        NSNumber *theCountOfElements = [NSNumber numberWithInteger:[theCount countForObject:dictionary]];
        NSMutableDictionary *dictionaryWithCount = [[NSMutableDictionary alloc] initWithDictionary:dictionary];
        
        [dictionaryWithCount setObject:theCountOfElements forKey:@"count"];
        [theNewDictionary addObject:dictionaryWithCount];
    
    }

    return theNewDictionary;
}

-(NSArray *)mergeDataWithKeys:(NSArray *)keys AndData:(NSArray *)data
{
    NSMutableArray *mergeData = [NSMutableArray array];
    
    
    for (NSDictionary *keysDictionary in keys) {
        
        NSMutableDictionary *mergedDictionary = [[NSMutableDictionary alloc] initWithDictionary:keysDictionary];
        
        NSString *firstNameObject = [keysDictionary objectForKey:@"first_name"];
        
        if (firstNameObject) {
            
            for (NSDictionary *dataDictionary in data) {
                
                NSDictionary *otherInfo = [dataDictionary objectForKey:firstNameObject];
                
                [mergedDictionary addEntriesFromDictionary:otherInfo];
                
                [mergeData addObject:mergedDictionary];
            }
        }
        
}
    return mergeData;
 
}

-(NSArray *)findCool:(NSArray *)array
{
    NSMutableArray *coolDictionary = [NSMutableArray array];
    NSString *coolFinder = @"cool";
    
    for (NSInteger i = 0; i < array.count; i++) {
        if ([array[i] containsObject:coolFinder])
        {
            [coolDictionary addObject:array[i]];
        }
    }
    return coolDictionary;

}

-(NSDictionary *)organizeSchools:(NSDictionary *)schools
{
    NSMutableArray *cities = [NSMutableArray array];
    
    for (NSDictionary *school in schools) {
        
        //this makes a string for the city names
        NSString *city = schools[school][@"location"];
        
        //add the cities to a array
        [cities addObject:city];
    }
    //removes duplicates of city names
    NSOrderedSet *removedDuplicates = [NSOrderedSet orderedSetWithArray:cities];
    
    //the Final dictionary
   NSMutableDictionary *groupedSchoolsInCity = [[NSMutableDictionary alloc] init];
    
    
    
    //now going to go through each city name
    for (NSString *city in removedDuplicates) {
        
        
        // going to put all the school names into an array
        NSMutableArray *allSchoolsInCity = [NSMutableArray array];
        
        //another for loop to grab the school names
        for (NSDictionary *school in schools) {
            
            //school names as a string
            NSString *schoolCity = schools[school][@"location"];
            
            //if school location is equal to the city in the cities array it add object to school array
            if ([schoolCity isEqualToString:city]) {
                [allSchoolsInCity addObject:school];
            }
        }
        //now add the school to the city for key 
        [groupedSchoolsInCity setValue:allSchoolsInCity forKey:city];
//        NSLog(@"%@", groupedSchoolsInCity);
    }
    
    return groupedSchoolsInCity;
}



@end
