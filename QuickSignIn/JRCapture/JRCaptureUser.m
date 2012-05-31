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


#import "JRCaptureUser.h"

@interface NSArray (GamesToFromDictionary)
- (NSArray*)arrayOfGamesDictionariesFromGamesObjects;
- (NSArray*)arrayOfGamesObjectsFromGamesDictionaries;
@end

@implementation NSArray (GamesToFromDictionary)
- (NSArray*)arrayOfGamesDictionariesFromGamesObjects
{
    NSMutableArray *filteredDictionaryArray = [NSMutableArray arrayWithCapacity:[self count]];
    for (NSObject *object in self)
        if ([object isKindOfClass:[JRGames class]])
            [filteredDictionaryArray addObject:[(JRGames*)object dictionaryFromObject]];

    return filteredDictionaryArray;
}

- (NSArray*)arrayOfGamesObjectsFromGamesDictionaries
{
    NSMutableArray *filteredDictionaryArray = [NSMutableArray arrayWithCapacity:[self count]];
    for (NSObject *dictionary in self)
        if ([dictionary isKindOfClass:[NSDictionary class]])
            [filteredDictionaryArray addObject:[JRGames gamesObjectFromDictionary:(NSDictionary*)dictionary]];

    return filteredDictionaryArray;
}
@end

@interface NSArray (OnipLevelOneToFromDictionary)
- (NSArray*)arrayOfOnipLevelOneDictionariesFromOnipLevelOneObjects;
- (NSArray*)arrayOfOnipLevelOneObjectsFromOnipLevelOneDictionaries;
@end

@implementation NSArray (OnipLevelOneToFromDictionary)
- (NSArray*)arrayOfOnipLevelOneDictionariesFromOnipLevelOneObjects
{
    NSMutableArray *filteredDictionaryArray = [NSMutableArray arrayWithCapacity:[self count]];
    for (NSObject *object in self)
        if ([object isKindOfClass:[JROnipLevelOne class]])
            [filteredDictionaryArray addObject:[(JROnipLevelOne*)object dictionaryFromObject]];

    return filteredDictionaryArray;
}

- (NSArray*)arrayOfOnipLevelOneObjectsFromOnipLevelOneDictionaries
{
    NSMutableArray *filteredDictionaryArray = [NSMutableArray arrayWithCapacity:[self count]];
    for (NSObject *dictionary in self)
        if ([dictionary isKindOfClass:[NSDictionary class]])
            [filteredDictionaryArray addObject:[JROnipLevelOne onipLevelOneObjectFromDictionary:(NSDictionary*)dictionary]];

    return filteredDictionaryArray;
}
@end

@interface NSArray (PhotosToFromDictionary)
- (NSArray*)arrayOfPhotosDictionariesFromPhotosObjects;
- (NSArray*)arrayOfPhotosObjectsFromPhotosDictionaries;
@end

@implementation NSArray (PhotosToFromDictionary)
- (NSArray*)arrayOfPhotosDictionariesFromPhotosObjects
{
    NSMutableArray *filteredDictionaryArray = [NSMutableArray arrayWithCapacity:[self count]];
    for (NSObject *object in self)
        if ([object isKindOfClass:[JRPhotos class]])
            [filteredDictionaryArray addObject:[(JRPhotos*)object dictionaryFromObject]];

    return filteredDictionaryArray;
}

- (NSArray*)arrayOfPhotosObjectsFromPhotosDictionaries
{
    NSMutableArray *filteredDictionaryArray = [NSMutableArray arrayWithCapacity:[self count]];
    for (NSObject *dictionary in self)
        if ([dictionary isKindOfClass:[NSDictionary class]])
            [filteredDictionaryArray addObject:[JRPhotos photosObjectFromDictionary:(NSDictionary*)dictionary]];

    return filteredDictionaryArray;
}
@end

@interface NSArray (PluralLevelOneToFromDictionary)
- (NSArray*)arrayOfPluralLevelOneDictionariesFromPluralLevelOneObjects;
- (NSArray*)arrayOfPluralLevelOneObjectsFromPluralLevelOneDictionaries;
@end

@implementation NSArray (PluralLevelOneToFromDictionary)
- (NSArray*)arrayOfPluralLevelOneDictionariesFromPluralLevelOneObjects
{
    NSMutableArray *filteredDictionaryArray = [NSMutableArray arrayWithCapacity:[self count]];
    for (NSObject *object in self)
        if ([object isKindOfClass:[JRPluralLevelOne class]])
            [filteredDictionaryArray addObject:[(JRPluralLevelOne*)object dictionaryFromObject]];

    return filteredDictionaryArray;
}

- (NSArray*)arrayOfPluralLevelOneObjectsFromPluralLevelOneDictionaries
{
    NSMutableArray *filteredDictionaryArray = [NSMutableArray arrayWithCapacity:[self count]];
    for (NSObject *dictionary in self)
        if ([dictionary isKindOfClass:[NSDictionary class]])
            [filteredDictionaryArray addObject:[JRPluralLevelOne pluralLevelOneObjectFromDictionary:(NSDictionary*)dictionary]];

    return filteredDictionaryArray;
}
@end

@interface NSArray (ProfilesToFromDictionary)
- (NSArray*)arrayOfProfilesDictionariesFromProfilesObjects;
- (NSArray*)arrayOfProfilesObjectsFromProfilesDictionaries;
@end

@implementation NSArray (ProfilesToFromDictionary)
- (NSArray*)arrayOfProfilesDictionariesFromProfilesObjects
{
    NSMutableArray *filteredDictionaryArray = [NSMutableArray arrayWithCapacity:[self count]];
    for (NSObject *object in self)
        if ([object isKindOfClass:[JRProfiles class]])
            [filteredDictionaryArray addObject:[(JRProfiles*)object dictionaryFromObject]];

    return filteredDictionaryArray;
}

- (NSArray*)arrayOfProfilesObjectsFromProfilesDictionaries
{
    NSMutableArray *filteredDictionaryArray = [NSMutableArray arrayWithCapacity:[self count]];
    for (NSObject *dictionary in self)
        if ([dictionary isKindOfClass:[NSDictionary class]])
            [filteredDictionaryArray addObject:[JRProfiles profilesObjectFromDictionary:(NSDictionary*)dictionary]];

    return filteredDictionaryArray;
}
@end

@interface NSArray (StatusesToFromDictionary)
- (NSArray*)arrayOfStatusesDictionariesFromStatusesObjects;
- (NSArray*)arrayOfStatusesObjectsFromStatusesDictionaries;
@end

@implementation NSArray (StatusesToFromDictionary)
- (NSArray*)arrayOfStatusesDictionariesFromStatusesObjects
{
    NSMutableArray *filteredDictionaryArray = [NSMutableArray arrayWithCapacity:[self count]];
    for (NSObject *object in self)
        if ([object isKindOfClass:[JRStatuses class]])
            [filteredDictionaryArray addObject:[(JRStatuses*)object dictionaryFromObject]];

    return filteredDictionaryArray;
}

- (NSArray*)arrayOfStatusesObjectsFromStatusesDictionaries
{
    NSMutableArray *filteredDictionaryArray = [NSMutableArray arrayWithCapacity:[self count]];
    for (NSObject *dictionary in self)
        if ([dictionary isKindOfClass:[NSDictionary class]])
            [filteredDictionaryArray addObject:[JRStatuses statusesObjectFromDictionary:(NSDictionary*)dictionary]];

    return filteredDictionaryArray;
}
@end

@interface NSArray (TesterStringPluralToFromDictionary)
- (NSArray*)arrayOfTesterStringPluralDictionariesFromTesterStringPluralObjects;
- (NSArray*)arrayOfTesterStringPluralObjectsFromTesterStringPluralDictionaries;
@end

@implementation NSArray (TesterStringPluralToFromDictionary)
- (NSArray*)arrayOfTesterStringPluralDictionariesFromTesterStringPluralObjects
{
    NSMutableArray *filteredDictionaryArray = [NSMutableArray arrayWithCapacity:[self count]];
    for (NSObject *object in self)
        if ([object isKindOfClass:[JRTesterStringPlural class]])
            [filteredDictionaryArray addObject:[(JRTesterStringPlural*)object dictionaryFromObject]];

    return filteredDictionaryArray;
}

- (NSArray*)arrayOfTesterStringPluralObjectsFromTesterStringPluralDictionaries
{
    NSMutableArray *filteredDictionaryArray = [NSMutableArray arrayWithCapacity:[self count]];
    for (NSObject *dictionary in self)
        if ([dictionary isKindOfClass:[NSDictionary class]])
            [filteredDictionaryArray addObject:[JRTesterStringPlural testerStringPluralObjectFromDictionary:(NSDictionary*)dictionary]];

    return filteredDictionaryArray;
}
@end

@implementation JRCaptureUser
@synthesize captureUserId;
@synthesize uuid;
@synthesize created;
@synthesize lastUpdated;
@synthesize aboutMe;
@synthesize birthday;
@synthesize currentLocation;
@synthesize display;
@synthesize displayName;
@synthesize email;
@synthesize emailVerified;
@synthesize familyName;
@synthesize games;
@synthesize gender;
@synthesize givenName;
@synthesize lastLogin;
@synthesize middleName;
@synthesize objectLevelOne;
@synthesize onipLevelOne;
@synthesize password;
@synthesize photos;
@synthesize pinoLevelOne;
@synthesize pluralLevelOne;
@synthesize primaryAddress;
@synthesize profiles;
@synthesize statuses;
@synthesize testerBoolean;
@synthesize testerInteger;
@synthesize testerIpAddr;
@synthesize testerStringPlural;

- (id)init
{
    if ((self = [super init]))
    {
    }
    return self;
}

- (id)initWithEmail:(NSString *)newEmail
{
    if (!newEmail)
    {
        [self release];
        return nil;
     }

    if ((self = [super init]))
    {
        email = [newEmail copy];
    }
    return self;
}

+ (id)captureUser
{
    return [[[JRCaptureUser alloc] init] autorelease];
}

+ (id)captureUserWithEmail:(NSString *)email
{
    return [[[JRCaptureUser alloc] initWithEmail:email] autorelease];
}

- (id)copyWithZone:(NSZone*)zone
{
    JRCaptureUser *captureUserCopy =
                [[JRCaptureUser allocWithZone:zone] initWithEmail:self.email];

    captureUserCopy.captureUserId = self.captureUserId;
    captureUserCopy.uuid = self.uuid;
    captureUserCopy.created = self.created;
    captureUserCopy.lastUpdated = self.lastUpdated;
    captureUserCopy.aboutMe = self.aboutMe;
    captureUserCopy.birthday = self.birthday;
    captureUserCopy.currentLocation = self.currentLocation;
    captureUserCopy.display = self.display;
    captureUserCopy.displayName = self.displayName;
    captureUserCopy.emailVerified = self.emailVerified;
    captureUserCopy.familyName = self.familyName;
    captureUserCopy.games = self.games;
    captureUserCopy.gender = self.gender;
    captureUserCopy.givenName = self.givenName;
    captureUserCopy.lastLogin = self.lastLogin;
    captureUserCopy.middleName = self.middleName;
    captureUserCopy.objectLevelOne = self.objectLevelOne;
    captureUserCopy.onipLevelOne = self.onipLevelOne;
    captureUserCopy.password = self.password;
    captureUserCopy.photos = self.photos;
    captureUserCopy.pinoLevelOne = self.pinoLevelOne;
    captureUserCopy.pluralLevelOne = self.pluralLevelOne;
    captureUserCopy.primaryAddress = self.primaryAddress;
    captureUserCopy.profiles = self.profiles;
    captureUserCopy.statuses = self.statuses;
    captureUserCopy.testerBoolean = self.testerBoolean;
    captureUserCopy.testerInteger = self.testerInteger;
    captureUserCopy.testerIpAddr = self.testerIpAddr;
    captureUserCopy.testerStringPlural = self.testerStringPlural;

    return captureUserCopy;
}

+ (id)captureUserObjectFromDictionary:(NSDictionary*)dictionary
{
    JRCaptureUser *captureUser =
        [JRCaptureUser captureUser];

    captureUser.captureUserId = [(NSNumber*)[dictionary objectForKey:@"id"] intValue];
    captureUser.uuid = [dictionary objectForKey:@"uuid"];
    captureUser.created = [NSDate dateFromISO8601DateTimeString:[dictionary objectForKey:@"created"]];
    captureUser.lastUpdated = [NSDate dateFromISO8601DateTimeString:[dictionary objectForKey:@"lastUpdated"]];
    captureUser.aboutMe = [dictionary objectForKey:@"aboutMe"];
    captureUser.birthday = [NSDate dateFromISO8601DateString:[dictionary objectForKey:@"birthday"]];
    captureUser.currentLocation = [dictionary objectForKey:@"currentLocation"];
    captureUser.display = [dictionary objectForKey:@"display"];
    captureUser.displayName = [dictionary objectForKey:@"displayName"];
    captureUser.email = [dictionary objectForKey:@"email"];
    captureUser.emailVerified = [NSDate dateFromISO8601DateTimeString:[dictionary objectForKey:@"emailVerified"]];
    captureUser.familyName = [dictionary objectForKey:@"familyName"];
    captureUser.games = [(NSArray*)[dictionary objectForKey:@"games"] arrayOfGamesObjectsFromGamesDictionaries];
    captureUser.gender = [dictionary objectForKey:@"gender"];
    captureUser.givenName = [dictionary objectForKey:@"givenName"];
    captureUser.lastLogin = [NSDate dateFromISO8601DateTimeString:[dictionary objectForKey:@"lastLogin"]];
    captureUser.middleName = [dictionary objectForKey:@"middleName"];
    captureUser.objectLevelOne = [JRObjectLevelOne objectLevelOneObjectFromDictionary:(NSDictionary*)[dictionary objectForKey:@"objectLevelOne"]];
    captureUser.onipLevelOne = [(NSArray*)[dictionary objectForKey:@"onipLevelOne"] arrayOfOnipLevelOneObjectsFromOnipLevelOneDictionaries];
    captureUser.password = [dictionary objectForKey:@"password"];
    captureUser.photos = [(NSArray*)[dictionary objectForKey:@"photos"] arrayOfPhotosObjectsFromPhotosDictionaries];
    captureUser.pinoLevelOne = [JRPinoLevelOne pinoLevelOneObjectFromDictionary:(NSDictionary*)[dictionary objectForKey:@"pinoLevelOne"]];
    captureUser.pluralLevelOne = [(NSArray*)[dictionary objectForKey:@"pluralLevelOne"] arrayOfPluralLevelOneObjectsFromPluralLevelOneDictionaries];
    captureUser.primaryAddress = [JRPrimaryAddress primaryAddressObjectFromDictionary:(NSDictionary*)[dictionary objectForKey:@"primaryAddress"]];
    captureUser.profiles = [(NSArray*)[dictionary objectForKey:@"profiles"] arrayOfProfilesObjectsFromProfilesDictionaries];
    captureUser.statuses = [(NSArray*)[dictionary objectForKey:@"statuses"] arrayOfStatusesObjectsFromStatusesDictionaries];
    captureUser.testerBoolean = [(NSNumber*)[dictionary objectForKey:@"testerBoolean"] boolValue];
    captureUser.testerInteger = [(NSNumber*)[dictionary objectForKey:@"testerInteger"] intValue];
    captureUser.testerIpAddr = [dictionary objectForKey:@"testerIpAddr"];
    captureUser.testerStringPlural = [(NSArray*)[dictionary objectForKey:@"testerStringPlural"] arrayOfTesterStringPluralObjectsFromTesterStringPluralDictionaries];

    return captureUser;
}

- (NSDictionary*)dictionaryFromObject
{
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithCapacity:10];


    if (captureUserId)
        [dict setObject:[NSNumber numberWithInt:captureUserId] forKey:@"id"];

    if (aboutMe)
        [dict setObject:aboutMe forKey:@"aboutMe"];

    if (birthday)
        [dict setObject:[birthday stringFromISO8601Date] forKey:@"birthday"];

    if (currentLocation)
        [dict setObject:currentLocation forKey:@"currentLocation"];

    if (display)
        [dict setObject:display forKey:@"display"];

    if (displayName)
        [dict setObject:displayName forKey:@"displayName"];

    if (email)
        [dict setObject:email forKey:@"email"];

    if (emailVerified)
        [dict setObject:[emailVerified stringFromISO8601DateTime] forKey:@"emailVerified"];

    if (familyName)
        [dict setObject:familyName forKey:@"familyName"];

    if (games)
        [dict setObject:[games arrayOfGamesDictionariesFromGamesObjects] forKey:@"games"];

    if (gender)
        [dict setObject:gender forKey:@"gender"];

    if (givenName)
        [dict setObject:givenName forKey:@"givenName"];

    if (lastLogin)
        [dict setObject:[lastLogin stringFromISO8601DateTime] forKey:@"lastLogin"];

    if (middleName)
        [dict setObject:middleName forKey:@"middleName"];

    if (objectLevelOne)
        [dict setObject:[objectLevelOne dictionaryFromObject] forKey:@"objectLevelOne"];

    if (onipLevelOne)
        [dict setObject:[onipLevelOne arrayOfOnipLevelOneDictionariesFromOnipLevelOneObjects] forKey:@"onipLevelOne"];

    if (password)
        [dict setObject:password forKey:@"password"];

    if (photos)
        [dict setObject:[photos arrayOfPhotosDictionariesFromPhotosObjects] forKey:@"photos"];

    if (pinoLevelOne)
        [dict setObject:[pinoLevelOne dictionaryFromObject] forKey:@"pinoLevelOne"];

    if (pluralLevelOne)
        [dict setObject:[pluralLevelOne arrayOfPluralLevelOneDictionariesFromPluralLevelOneObjects] forKey:@"pluralLevelOne"];

    if (primaryAddress)
        [dict setObject:[primaryAddress dictionaryFromObject] forKey:@"primaryAddress"];

    if (profiles)
        [dict setObject:[profiles arrayOfProfilesDictionariesFromProfilesObjects] forKey:@"profiles"];

    if (statuses)
        [dict setObject:[statuses arrayOfStatusesDictionariesFromStatusesObjects] forKey:@"statuses"];

    if (testerBoolean)
        [dict setObject:[NSNumber numberWithBool:testerBoolean] forKey:@"testerBoolean"];

    if (testerInteger)
        [dict setObject:[NSNumber numberWithInt:testerInteger] forKey:@"testerInteger"];

    if (testerIpAddr)
        [dict setObject:testerIpAddr forKey:@"testerIpAddr"];

    if (testerStringPlural)
        [dict setObject:[testerStringPlural arrayOfTesterStringPluralDictionariesFromTesterStringPluralObjects] forKey:@"testerStringPlural"];

    return dict;
}

- (void)updateFromDictionary:(NSDictionary*)dictionary
{
    if ([dictionary objectForKey:@"captureUserId"])
        self.captureUserId = [(NSNumber*)[dictionary objectForKey:@"id"] intValue];

    if ([dictionary objectForKey:@"uuid"])
        self.uuid = [dictionary objectForKey:@"uuid"];

    if ([dictionary objectForKey:@"created"])
        self.created = [NSDate dateFromISO8601DateTimeString:[dictionary objectForKey:@"created"]];

    if ([dictionary objectForKey:@"lastUpdated"])
        self.lastUpdated = [NSDate dateFromISO8601DateTimeString:[dictionary objectForKey:@"lastUpdated"]];

    if ([dictionary objectForKey:@"aboutMe"])
        self.aboutMe = [dictionary objectForKey:@"aboutMe"];

    if ([dictionary objectForKey:@"birthday"])
        self.birthday = [NSDate dateFromISO8601DateString:[dictionary objectForKey:@"birthday"]];

    if ([dictionary objectForKey:@"currentLocation"])
        self.currentLocation = [dictionary objectForKey:@"currentLocation"];

    if ([dictionary objectForKey:@"display"])
        self.display = [dictionary objectForKey:@"display"];

    if ([dictionary objectForKey:@"displayName"])
        self.displayName = [dictionary objectForKey:@"displayName"];

    if ([dictionary objectForKey:@"email"])
        self.email = [dictionary objectForKey:@"email"];

    if ([dictionary objectForKey:@"emailVerified"])
        self.emailVerified = [NSDate dateFromISO8601DateTimeString:[dictionary objectForKey:@"emailVerified"]];

    if ([dictionary objectForKey:@"familyName"])
        self.familyName = [dictionary objectForKey:@"familyName"];

    if ([dictionary objectForKey:@"games"])
        self.games = [(NSArray*)[dictionary objectForKey:@"games"] arrayOfGamesObjectsFromGamesDictionaries];

    if ([dictionary objectForKey:@"gender"])
        self.gender = [dictionary objectForKey:@"gender"];

    if ([dictionary objectForKey:@"givenName"])
        self.givenName = [dictionary objectForKey:@"givenName"];

    if ([dictionary objectForKey:@"lastLogin"])
        self.lastLogin = [NSDate dateFromISO8601DateTimeString:[dictionary objectForKey:@"lastLogin"]];

    if ([dictionary objectForKey:@"middleName"])
        self.middleName = [dictionary objectForKey:@"middleName"];

    if ([dictionary objectForKey:@"objectLevelOne"])
        self.objectLevelOne = [JRObjectLevelOne objectLevelOneObjectFromDictionary:(NSDictionary*)[dictionary objectForKey:@"objectLevelOne"]];

    if ([dictionary objectForKey:@"onipLevelOne"])
        self.onipLevelOne = [(NSArray*)[dictionary objectForKey:@"onipLevelOne"] arrayOfOnipLevelOneObjectsFromOnipLevelOneDictionaries];

    if ([dictionary objectForKey:@"password"])
        self.password = [dictionary objectForKey:@"password"];

    if ([dictionary objectForKey:@"photos"])
        self.photos = [(NSArray*)[dictionary objectForKey:@"photos"] arrayOfPhotosObjectsFromPhotosDictionaries];

    if ([dictionary objectForKey:@"pinoLevelOne"])
        self.pinoLevelOne = [JRPinoLevelOne pinoLevelOneObjectFromDictionary:(NSDictionary*)[dictionary objectForKey:@"pinoLevelOne"]];

    if ([dictionary objectForKey:@"pluralLevelOne"])
        self.pluralLevelOne = [(NSArray*)[dictionary objectForKey:@"pluralLevelOne"] arrayOfPluralLevelOneObjectsFromPluralLevelOneDictionaries];

    if ([dictionary objectForKey:@"primaryAddress"])
        self.primaryAddress = [JRPrimaryAddress primaryAddressObjectFromDictionary:(NSDictionary*)[dictionary objectForKey:@"primaryAddress"]];

    if ([dictionary objectForKey:@"profiles"])
        self.profiles = [(NSArray*)[dictionary objectForKey:@"profiles"] arrayOfProfilesObjectsFromProfilesDictionaries];

    if ([dictionary objectForKey:@"statuses"])
        self.statuses = [(NSArray*)[dictionary objectForKey:@"statuses"] arrayOfStatusesObjectsFromStatusesDictionaries];

    if ([dictionary objectForKey:@"testerBoolean"])
        self.testerBoolean = [(NSNumber*)[dictionary objectForKey:@"testerBoolean"] boolValue];

    if ([dictionary objectForKey:@"testerInteger"])
        self.testerInteger = [(NSNumber*)[dictionary objectForKey:@"testerInteger"] intValue];

    if ([dictionary objectForKey:@"testerIpAddr"])
        self.testerIpAddr = [dictionary objectForKey:@"testerIpAddr"];

    if ([dictionary objectForKey:@"testerStringPlural"])
        self.testerStringPlural = [(NSArray*)[dictionary objectForKey:@"testerStringPlural"] arrayOfTesterStringPluralObjectsFromTesterStringPluralDictionaries];
}

- (void)dealloc
{
    [uuid release];
    [created release];
    [lastUpdated release];
    [aboutMe release];
    [birthday release];
    [currentLocation release];
    [display release];
    [displayName release];
    [email release];
    [emailVerified release];
    [familyName release];
    [games release];
    [gender release];
    [givenName release];
    [lastLogin release];
    [middleName release];
    [objectLevelOne release];
    [onipLevelOne release];
    [password release];
    [photos release];
    [pinoLevelOne release];
    [pluralLevelOne release];
    [primaryAddress release];
    [profiles release];
    [statuses release];
    [testerIpAddr release];
    [testerStringPlural release];

    [super dealloc];
}
@end
