/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 Copyright (c) 2012, Janrain, Inc.

 All rights reserved.

 Redistribution and use in source and binary forms, with or without modification,
 are permitted provided that the following conditions are met:

 * Redistributions of source code must retain the above copyright notice, this
   list of conditions and the following disclaimer.
 * Redistributions in binary form must reproduce the above copyright notice,
   this list of conditions and the following disclaimer in the documentation and/or
   other materials provided with the distribution.
 * Neither the name of the Janrain, Inc. nor the names of its
   contributors may be used to endorse or promote products derived from this
   software without specific prior written permission.


 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
 ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR
 ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
 ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */


#import "JRGames.h"

@interface NSArray (OpponentsToFromDictionary)
- (NSArray*)arrayOfOpponentsDictionariesFromOpponentsObjects;
- (NSArray*)arrayOfOpponentsObjectsFromOpponentsDictionaries;
@end

@implementation NSArray (OpponentsToFromDictionary)
- (NSArray*)arrayOfOpponentsDictionariesFromOpponentsObjects
{
    NSMutableArray *filteredDictionaryArray = [NSMutableArray arrayWithCapacity:[self count]];
    for (NSObject *object in self)
        if ([object isKindOfClass:[JROpponents class]])
            [filteredDictionaryArray addObject:[(JROpponents*)object dictionaryFromObject]];

    return filteredDictionaryArray;
}

- (NSArray*)arrayOfOpponentsObjectsFromOpponentsDictionaries
{
    NSMutableArray *filteredDictionaryArray = [NSMutableArray arrayWithCapacity:[self count]];
    for (NSObject *dictionary in self)
        if ([dictionary isKindOfClass:[NSDictionary class]])
            [filteredDictionaryArray addObject:[JROpponents opponentsObjectFromDictionary:(NSDictionary*)dictionary]];

    return filteredDictionaryArray;
}
@end

@implementation JRGames
@synthesize gamesId;
@synthesize isFavorite;
@synthesize name;
@synthesize opponents;
@synthesize rating;

- (id)init
{
    if ((self = [super init]))
    {
    }
    return self;
}

+ (id)games
{
    return [[[JRGames alloc] init] autorelease];
}

- (id)copyWithZone:(NSZone*)zone
{
    JRGames *gamesCopy =
                [[JRGames allocWithZone:zone] init];

    gamesCopy.gamesId = self.gamesId;
    gamesCopy.isFavorite = self.isFavorite;
    gamesCopy.name = self.name;
    gamesCopy.opponents = self.opponents;
    gamesCopy.rating = self.rating;

    return gamesCopy;
}

+ (id)gamesObjectFromDictionary:(NSDictionary*)dictionary
{
    JRGames *games =
        [JRGames games];

    games.gamesId = [(NSNumber*)[dictionary objectForKey:@"id"] intValue];
    games.isFavorite = [(NSNumber*)[dictionary objectForKey:@"isFavorite"] boolValue];
    games.name = [dictionary objectForKey:@"name"];
    games.opponents = [(NSArray*)[dictionary objectForKey:@"opponents"] arrayOfOpponentsObjectsFromOpponentsDictionaries];
    games.rating = [(NSNumber*)[dictionary objectForKey:@"rating"] intValue];

    return games;
}

- (NSDictionary*)dictionaryFromObject
{
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithCapacity:10];


    if (gamesId)
        [dict setObject:[NSNumber numberWithInt:gamesId] forKey:@"id"];

    if (isFavorite)
        [dict setObject:[NSNumber numberWithBool:isFavorite] forKey:@"isFavorite"];

    if (name)
        [dict setObject:name forKey:@"name"];

    if (opponents)
        [dict setObject:[opponents arrayOfOpponentsDictionariesFromOpponentsObjects] forKey:@"opponents"];

    if (rating)
        [dict setObject:[NSNumber numberWithInt:rating] forKey:@"rating"];

    return dict;
}

- (void)updateFromDictionary:(NSDictionary*)dictionary
{
    if ([dictionary objectForKey:@"gamesId"])
        self.gamesId = [(NSNumber*)[dictionary objectForKey:@"id"] intValue];

    if ([dictionary objectForKey:@"isFavorite"])
        self.isFavorite = [(NSNumber*)[dictionary objectForKey:@"isFavorite"] boolValue];

    if ([dictionary objectForKey:@"name"])
        self.name = [dictionary objectForKey:@"name"];

    if ([dictionary objectForKey:@"opponents"])
        self.opponents = [(NSArray*)[dictionary objectForKey:@"opponents"] arrayOfOpponentsObjectsFromOpponentsDictionaries];

    if ([dictionary objectForKey:@"rating"])
        self.rating = [(NSNumber*)[dictionary objectForKey:@"rating"] intValue];
}

- (void)dealloc
{
    [name release];
    [opponents release];

    [super dealloc];
}
@end
