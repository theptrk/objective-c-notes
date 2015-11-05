UIWebview
  
init:
  use: drag to IBOutlet

  delegate: 
    // code
    self.<UIWebview>.delegate = self;

  // no required methods
  
  protocals:

    - (void) webViewDidStartLoad:(UIWebView *)webView {
      NSLog(@"webViewDidStartLoad");
      [self.activityIndicator startAnimating];
    }
    - (void) webViewDidFinishLoad:(UIWebView *)webView {
      NSLog(@"webViewDidFinishLoad");
      [self.activityIndicator stopAnimating];
    }

  helpers: 

  - (void) goToURLInWebView:(NSString *)urlString {
    NSLog(@"Going to: %@", urlString);
    // set the url text field to the current page
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    [self.<UIWebview> loadRequest:request];
  }