/**
 * Web view with an activity indicator
 */

// === required security settings
// Info.plist
//   1. hit plus sign 
//   2. type `NSAppTransportSecurity`
//   3. set type to `Dictionary`
//   4. hit plus in the `NSAppTransportSecurity` line
//   5. type `NSAllowsArbitraryLoads`
//   5. set type to `YES`

@interface WebViewController () <UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *actualWebView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
// go into properties and check 'animating' and 'hide when stopped'
@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // set delegate programmically
    self.actualWebView.delegate = self;
    // set default address
    [self goToURLInWebView:@"http://www.apple.com"];
}



// === protocol for `UIWebViewDelegate`
- (void) webViewDidStartLoad:(UIWebView *)webView {
    NSLog(@"webViewDidStartLoad");
    [self.activityIndicator startAnimating];
}
- (void) webViewDidFinishLoad:(UIWebView *)webView {
    NSLog(@"webViewDidFinishLoad");
    [self.activityIndicator stopAnimating];
}

// === helpers
- (void) goToURLInWebView:(NSString *)urlString {
    NSLog(@"Going to: %@", urlString);
    // set the url text field to the current page
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    [self.actualWebView loadRequest:request];
}