
#import "itemisAppAppDelegate.h"
#import "IPUIView.h"
#import "itemisAppProviders.h"

#import "EventListViewController.h"
#import "BlogListViewController.h"
#import "OfficeListViewController.h"
#import "CareerViewViewController.h"

@implementation itemisAppAppDelegate

@synthesize window, rootController;

-(UIViewController*)createController {
	itemisAppProviders *providers = [[[itemisAppProviders alloc] init] autorelease];
	UITabBarController *result = [[UITabBarController alloc] init];
	NSMutableArray *controllers = [NSMutableArray array];
	
	UIViewController<IPUIView> *controller;
	UINavigationController *navController;
	IPContentProvider *contentProvider;


	
	// controller for @"News"
	contentProvider = [providers providerForCurrentTimeline];
	
	controller = [[EventListViewController alloc] init];
	[controller setContentProvider: contentProvider];
	controller.tabBarItem.title = @"News";
	controller.tabBarItem.image = [UIImage imageNamed:@"calendar.png"];
	navController = [[UINavigationController alloc] initWithRootViewController:controller];
	[controllers addObject: navController];
	[controller release];
	[navController release];

	
	// controller for @"Blog"
	contentProvider = [providers providerForBlogposts];
	
	controller = [[BlogListViewController alloc] init];
	[controller setContentProvider: contentProvider];
	controller.tabBarItem.title = @"Blog";
	controller.tabBarItem.image = [UIImage imageNamed:@"chat.png"];
	navController = [[UINavigationController alloc] initWithRootViewController:controller];
	[controllers addObject: navController];
	[controller release];
	[navController release];

	
	// controller for @"itemis"
	contentProvider = [providers providerForCompanyDescription];
	
	controller = [[OfficeListViewController alloc] init];
	[controller setContentProvider: contentProvider];
	controller.tabBarItem.title = @"itemis";
	controller.tabBarItem.image = [UIImage imageNamed:@"itemis.png"];
	navController = [[UINavigationController alloc] initWithRootViewController:controller];
	[controllers addObject: navController];
	[controller release];
	[navController release];

	
	// controller for @"Carreer"
	contentProvider = [providers providerForCareerData];
	
	controller = [[CareerViewViewController alloc] init];
	[controller setContentProvider: contentProvider];
	controller.tabBarItem.title = @"Carreer";
	controller.tabBarItem.image = [UIImage imageNamed:@"trophy.png"];
	navController = [[UINavigationController alloc] initWithRootViewController:controller];
	[controllers addObject: navController];
	[controller release];
	[navController release];


	result.viewControllers = controllers;
	return result;
}

- (void)applicationDidFinishLaunching:(UIApplication *)application {    
	self.rootController = [self createController];
	[window addSubview: [self.rootController view]];
    [window makeKeyAndVisible];
}

- (void)dealloc {
	self.rootController = nil;
    [window release];
    [super dealloc];
}


@end
