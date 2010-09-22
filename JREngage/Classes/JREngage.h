/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
 Copyright (c) 2010, Janrain, Inc.
 
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
 
 File:	 JREngage.h
 Author: Lilli Szafranski - lilli@janrain.com, lillialexis@gmail.com
 Date:	 Tuesday, June 1, 2010
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */


#import <Foundation/Foundation.h>
#import "JRSessionData.h"
#import "JRActivityObject.h"
#import "JRUserInterfaceMaestro.h"

#define SOCIAL_PUBLISHING

@class JREngage;
@class JRUserInterfaceMaestro;

/**
 * /brief
 * The JREngageDelegate protocol is adopted by an object that wishes to receive notifications when and 
 * information about a user that authenticates with your application and publishes activities to their 
 * social networks.
 *
 * This protocol will notify the delegate(s) when authentication and social publishing succeed or fail,
 * it will provider the delegate(s) with the authenticated user's profile data, and, if server-side
 * authentication is desired, it can provide the delegate(s) with the data payload returned by your 
 * server's token URL.
 **/
@protocol JREngageDelegate <NSObject>
@required

/**
 * Sent if the application tries to show a JREngage dialog, and JREngage failed to configure.
 *
 * @param $error
 *   The error that occurred during configuration.
 *
 * \note
 * This message is only sent if your application tries to show a JREngage dialog, not when the error
 * occurs, since your application may preemptively configure JREngage, but never actually use it.
 **/
- (void)jrEngageDialogDidFailToShowWithError:(NSError*)error;

@optional
/**
 * Sent if the authorization was canceled for any reason other than an error.  For example, 
 * the user hits the "Cancel" button, any class (e.g., the JREngage delegate) calls the cancelAuthentication
 * message, or if configuration of the library taking more than about 16 seconds (rare) to download.
 **/
- (void)jrAuthenticationDidNotComplete;

/**
 * Deprecated
 **/
- (void)jrAuthenticationReceivedAuthenticationTokenForProvider:(NSString*)provider;

/**
 * Tells the delegate that the user has successfully authenticated with the given provider, passing to
 * the delegate an \c NSDictionary object with the user's profile data
 *
 * @param $profile
 *   An \c NSDictionary containing all the information Janrain Engage knows about the user logging into your application
 *
 *   The structure of the dictionary (represented here in json) should look something like the 
 *   following:
 * \code
 "profile": 
 {
    "displayName": "brian",
    "preferredUsername": "brian",
    "url": "http:\/\/brian.myopenid.com\/",
    "providerName": "Other",
    "identifier": "http:\/\/brian.myopenid.com\/"
 }
 * \endcode
 *
 * For a full description of the dictionary and its fields, 
 * please see the @link https://rpxnow.com/docs#api_auth_info Janrain Engage API. @endlink
 *
 * @param $provider
 *   The name of the provider on which the user authenticated.  For a list of possible strings, 
 *   please see the List of Providers
 * */
- (void)jrAuthenticationDidSucceedForUser:(NSDictionary*)profile forProvider:(NSString*)provider;

/**
 * Sent when authentication failed and could not be recovered by the library.
 *
 * @param $error
 *   The error that occurred during authentication.
 *
 * @param $provider
 *   The name of the provider on which the user tried to authenticate.  For a list of possible strings, 
 *   please see the List of Providers
 *
 * \note
 * This message is not sent if authentication was canceled.  To be notified of a canceled authentication, 
 * see jrAuthenticationDidNotComplete.
 **/
- (void)jrAuthenticationDidFailWithError:(NSError*)error forProvider:(NSString*)provider;

/**
 * Sent after JREngage has successfully posted the token to the serverAuthenticationUrl, containing the body of the
 * response from the server.
 *
 * @param $serverAuthenticationUrl
 *   The URL on the server where the token was posted and server-side authentication was completed
 *
 * @param $serverResponsePayload
 *   The response from the server
 *
 * @param $provider
 *   The name of the provider on which the user authenticated.  For a list of possible strings, 
 *   please see the List of Providers
 *
 **/
- (void)jrAuthenticationDidReachTokenUrl:(NSString*)tokenUrl withPayload:(NSData*)tokenUrlPayload forProvider:(NSString*)provider;

/**
 * Sent when the call to the token URL has failed. 
 *
 * @param $serverAuthenticationUrl
 *   The URL on the server where the token was posted and server-side authentication was completed
 *
 * @param $error
 *   The error that occurred during server-side authentication
 *
 * @param $provider
 *   The name of the provider on which the user authenticated.  For a list of possible strings, 
 *   please see the List of Providers
 **/
- (void)jrAuthenticationCallToTokenUrl:(NSString*)tokenUrl didFailWithError:(NSError*)error forProvider:(NSString*)provider;


/**
 * Sent if social publishing was canceled for any reason other than an error.  For example, 
 * the user hits the "Cancel" button, any class (e.g., the JREngage delegate) calls the cancelPublishing
 * message, or if configuration of the library taking more than about 16 seconds (rare) to download.
 **/
- (void)jrSocialDidNotCompletePublishing;

/**
 * Sent after the social publishing dialog is closed (e.g., the user hits the "Close" button) and publishing is complete.  
 * You can receive multiple - (void)jrSocialDidPublishActivity:(JRActivityObject*)activity forProvider:(NSString*)provider
 * messages before the dialog is closed and publishing is complete.
 **/
- (void)jrSocialDidCompletePublishing;

/**
 * Sent after the user successfully shares an activity on the given provider.
 *
 * @param $activity
 *   The shared activity
 *
 * @param $provider
 *   The name of the provider on which the user published the activity.  For a list of possible strings, 
 *   please see the List of Providers
 **/
- (void)jrSocialDidPublishActivity:(JRActivityObject*)activity forProvider:(NSString*)provider;

///**
// * Sent when publishing an activity failed and could not be recovered by the library.
// *
// * @param $activity
// *   The activity the user was trying to share
// *
// * @param $provider
// *   The name of the provider on which the user attempted to publish the activity.  For a list of possible strings, 
// *   please see the List of Providers
// **/
//- (void)jrSocialPublishingActivity:(JRActivityObject*)activity didFailForProvider:(NSString*)provider;

/**
 * Sent when publishing an activity failed and could not be recovered by the library.
 *
 * @param $activity
 *   The activity the user was trying to share
 *
 * @param $error
 *   The error that occurred during publishing
 *
 * @param $provider
 *   The name of the provider on which the user attempted to publish the activity.  For a list of possible strings, 
 *   please see the List of Providers
 **/
- (void)jrSocialPublishingActivity:(JRActivityObject*)activity didFailWithError:(NSError*)error forProvider:(NSString*)provider;

@end

/**
 * \brief
 * Use the JREngage class to authenticate a user with your application and allow them
 * to publish activities to their social networks.
 * 
 * If you wish to include 3rd-Party Authentication and Social Publishing in your iPhone 
 * application, you can use the JREngage class to acheive this.  Prior to using the JREngage
 * library, you must already have an application on @link http://rpxnow.com RPXNow.com @endlink.
 * This is all that is required for basic authentication, although some providers may require extra
 * configuration (which can be done through your application's Dashboard on 
 * @link http://rpxnow.com RPXNow.com @endlink).  For social publishing, you will have to configure
 * your rpxnow application with the desired providers.
 *
 * If desired, you can optionally implement server-side authentication^.  When provided, 
 * the JREngage library can post the user's authentication token to a url on your server: 
 * the serverAuthenticationUrl (also referred to as a tokenUrl).  Your server can complete authentication,
 * access more of JREngage's API, log the authentication, etc. and the server's response will be 
 * passed back through to your iPhone application.
 *
 * ^ In the previous version of the Engage for iPhone library, implementing the serverAuthenticationUrl, or
 * tokenUrl, was required.  This is no longer the case, although you can optionally implement the 
 * serverAuthenticationUrl if you wish to continue authentication on your server.
 **/
@interface JREngage : NSObject </*JRConnectionManagerDelegate,*/ JRSessionDelegate>
{
    JRUserInterfaceMaestro *interfaceMaestro;   /*< Class that handles customizations to the library's UI */
	JRSessionData	*sessionData;               /*< Holds configuration and state for the JREngage library */
	NSMutableArray	*delegates;                 /*< Array of JREngageDelegate objects */
}

/**
 * Shared instance of the JREngage library
 * 
 * @return
 *   The instance of the JREngage library once it has been created, otherwise this will return \c nil
 **/
+ (JREngage*)jrEngage;

/**
 * Initializes and returns the shared instance of the JREngage library.
 *
 * @param $appId
 *   This is your 20-character application ID.  You can find this on your application's Dashboard
 *   on @link http://rpxnow.com rpxnow.com. @endlink  This value cannot be \c nil.
 *    
 * @param $serverAuthenticationUrl
 *   The url on your server where you wish to complete authentication.  If provided, 
 *   the JREngage library will post the user's authentication token to this url where it can
 *   used for further authentication and processing.  When complete, the library will pass the 
 *   server's response back to the your application.
 *   
 * @param $delegate
 *   The delegate object that implements the JREngageDelegate protocol.
 *
 * @return
 *   The shared instance of the \c JREngage object initialized with the given
 *   \c appId, \c serverAuthenticationUrl, and \c delegate.  If the given \c appId is nil, returns \c nil.
 **/
+ (JREngage*)jrEngageWithAppId:(NSString*)appId 
                   andTokenUrl:(NSString*)tokenUrl
                      delegate:(id<JREngageDelegate>)delegate;

/**
 * Add a JREngageDelegate to the JREngage library
 *
 * @param $delegate
 *   The delegate object that implements the JREngageDelegate protocol.
 **/
- (void)addDelegate:(id<JREngageDelegate>)delegate;

/** 
 * Remove a JREngageDelegate from the JREngage library
 *
 * @param $delegate
 *   The delegate object that implements the JREngageDelegate protocol. 
 **/
- (void)removeDelegate:(id<JREngageDelegate>)delegate;

/**
 * Use this function to begin authentication.  The JREngage library will 
 * pop up a modal dialog and take the user through the sign-in process.
 **/
- (void)showAuthenticationDialog;

/**
 * Use this function to begin social publishing.  The JREngage library will 
 * pop up a modal dialog and take the user through the sign-in process, if necessary,
 * and share the given \c JRActivityObject.
 *
 * @param $activity
 *   The activity you wish to share
 **/
- (void)showSocialPublishingDialogWithActivity:(JRActivityObject*)activity;

/**
 * If you want to push the JREngage dialogs on your own navigation controller, pass
 * the \c UINavigationController to the JREngage library before calling \c showAuthenticationDialog
 *
 * @param $navigationController
 *   Your application's navigation controller
 **/
- (void)setCustomNavigationController:(UINavigationController*)navigationController;

/**
 * May not use...
 **/
- (void)setCustomNavigationControllerShouldPopToViewController:(UIViewController*)viewController;

/**
 * Tell JREngage to forget that a user is already signed in with the given provider
 *
 * @param $provider
 *   The name of the provider on which the user authenticated.  For a list of possible strings, 
 *   please see the List of Providers
 **/
- (void)signoutUserForProvider:(NSString*)provider;

/**
 * Tell JREngage to forget that a user is signed in with all providers
 **/
- (void)signoutUserForAllProviders;

/**
 * Use this functions if you need to cancel authentication for any reason.
 **/
- (void)cancelAuthentication;

/**
 * Use this functions if you need to cancel publishing for any reason.
 **/
- (void)cancelPublishing;

/** 
 * Use this function to specify a different serverAuthenticationUrl than the one you 
 * initiated the library with
 **/
- (void)updateTokenUrl:(NSString*)newTokenUrl;
@end
