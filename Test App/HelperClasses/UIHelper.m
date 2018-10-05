//
//  UIHelper.m
//  Test App
//
//  Created by Dina Mansour on 9/8/18.

//

#import <QuartzCore/QuartzCore.h>
#import "UIHelper.h"
#import "SVProgressHUD.h"
#import "Reachability.h"
#import "TWMessageBarManager.h"
#import "TWAppDelegateStyleSheet.h"
#import "SDWebImageManager.h"
#import "Constants.h"


@implementation UIHelper

+(void)setDefualtUI:(UIViewController *)viewController{
    UIImageView *backgroundImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg2.png"]];
    backgroundImage.frame = viewController.view.frame;
    [viewController.view addSubview:backgroundImage];
    [viewController.view sendSubviewToBack:backgroundImage];
}

+(void)hideKeyBoard:(UIView *)view{
    for (UIView *subView in [view subviews]){
        if ([subView isFirstResponder])
            [subView resignFirstResponder];
    }
    
}

+(void)showProgressBar {
    
    Reachability *reachability = [Reachability reachabilityForInternetConnection];
    if ([reachability currentReachabilityStatus] == NotReachable) {
        //        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Error Connection" message:@"Please check your internet connection" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil ];
        //   [alert show];
    }else{
        
        [SVProgressHUD setDefaultAnimationType:SVProgressHUDAnimationTypeFlat];
        [SVProgressHUD show];
    }
}

+(void)showProgressBarWithDimView {
    //    [SVProgressHUD showInView:view status:NSLocalizedString(@"Loading", @"Loading") networkIndicator:YES posY:[[UIScreen mainScreen] bounds].size.height/2
    //                     maskType:SVProgressHUDMaskTypeGradient];
    
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
    [SVProgressHUD setDefaultAnimationType:SVProgressHUDAnimationTypeFlat];
    [SVProgressHUD show];
}

+(void)showProgressBarWithDimViewAndStatus:(NSString *)status{
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
    [SVProgressHUD setDefaultAnimationType:SVProgressHUDAnimationTypeFlat];
    [SVProgressHUD showWithStatus:NSLocalizedString(@"Loading", @"Loading")];
}

+(void)dissmissProgressBar{
    [SVProgressHUD dismiss];
}

+(void)dissmissProgressBarWithErrorMessage:(UIView *)view{
    [view setUserInteractionEnabled:YES];
    [SVProgressHUD dismiss];
}

+(void)showErrorMessage:(NSString *)errorMessage Title:(NSString *)title{
    [TWMessageBarManager sharedInstance].styleSheet = [TWAppDelegateStyleSheet  styleSheet];
    if (![[TWMessageBarManager sharedInstance] isMessageVisible]) {
        
        [[TWMessageBarManager sharedInstance] showMessageWithTitle:title
                                                       description:errorMessage
                                                              type:TWMessageBarMessageTypeError
                                                    statusBarStyle:UIStatusBarStyleLightContent
                                                          callback:nil];
        
    }
    
}

+(void)showInformativeMessage:(NSString *)message Title:(NSString *)title{
    
    [TWMessageBarManager sharedInstance].styleSheet = [TWAppDelegateStyleSheet  styleSheet];
    if (![[TWMessageBarManager sharedInstance] isMessageVisible]) {
        
        [[TWMessageBarManager sharedInstance] showMessageWithTitle:title
                                                       description:message
                                                              type:TWMessageBarMessageTypeInfo
                                                    statusBarStyle:UIStatusBarStyleLightContent
                                                          callback:nil];
        
    }
    
}

+(void)showSuccessMessage:(NSString *)message Title:(NSString *)title{
    
    [TWMessageBarManager sharedInstance].styleSheet = [TWAppDelegateStyleSheet  styleSheet];
    if (![[TWMessageBarManager sharedInstance] isMessageVisible]) {
        
        [[TWMessageBarManager sharedInstance] showMessageWithTitle:title
                                                       description:message
                                                              type:TWMessageBarMessageTypeSuccess
                                                    statusBarStyle:UIStatusBarStyleLightContent
                                                          callback:nil];
        
    }
    
}

+(void)showErrorMessageWithErrorCode:(int)errorCode andErrorMessage:(NSString *)errorMessage Title:(NSString *)title{
    
    [self showErrorMessage:errorMessage Title:title];
    
}

+(UIImageView *)roundImageAndSetborder:(UIImageView *)image {
    [UIHelper roundImage:image];
    // [image.layer setBorderColor: [[UIColor St] CGColor]];
    [image.layer setBorderWidth: 2.0];
    
    return image;
}



+(UIImageView *)roundImage:(UIImageView *)image{
    image.frame = CGRectMake(image.frame.origin.x,image.frame.origin.y, image.frame.size.height,image.frame.size.height);
    image.layer.cornerRadius = image.frame.size.width/2;
    image.clipsToBounds = YES;
    
    return image;
}

+ (void) alignLabelWithTop:(UILabel *)targetLabel {
    
    CGSize labelSize = targetLabel.frame.size;//CGSizeMake(250, 300);
    CGSize theStringSize = [targetLabel.text sizeWithFont:targetLabel.font constrainedToSize:labelSize lineBreakMode:targetLabel.lineBreakMode];
    targetLabel.frame = CGRectMake(targetLabel.frame.origin.x, targetLabel.frame.origin.y, labelSize.width, theStringSize.height);
    
}

+(NSString *)checkLangauge:(NSString *)text{
    // NSString *language = @"en";
    
    NSString *isoLangCode = (__bridge_transfer NSString*)CFStringTokenizerCopyBestStringLanguage((__bridge CFStringRef)text, CFRangeMake(0, text.length));
    return isoLangCode;
    
}

+(NSString *) stringByStrippingHTML:(NSString *)str {
    NSRange rng;
    
    while ((rng = [str rangeOfString:@"<[^>]+>" options:NSRegularExpressionSearch]).location != NSNotFound)
        str = [str stringByReplacingCharactersInRange:rng withString:@""];
    return str;
}

+ (void)shakeView:(UIView*)view {
    
    CGRect r                = view.frame;
    int x_                  = r.origin.x;
    r.origin.x              = r.origin.x - r.origin.x * 0.2;
    CGContextRef context    = UIGraphicsGetCurrentContext();
    [UIView beginAnimations:nil context:context];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDuration:.1f];
    [UIView setAnimationRepeatCount:5];
    [UIView setAnimationRepeatAutoreverses:NO];
    [view setFrame:r];
    r.origin.x = x_;
    [view setFrame:r];
    [UIView commitAnimations];
}

- (void)addPulseAnimationToView:(UIView *)view    {
    
    CABasicAnimation *pulseAnimation;
    pulseAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    [pulseAnimation setDuration:1.0f];
    [pulseAnimation setRepeatCount:HUGE_VAL];
    [pulseAnimation setAutoreverses:YES];
    [pulseAnimation setFromValue:[NSNumber numberWithFloat:1.0f]];
    [pulseAnimation setToValue:[NSNumber numberWithFloat:0.2f]];
    [view.layer addAnimation:pulseAnimation forKey:@"animateOpacity"];
}

- (void)addRoundedCornersToView:(UIView *)view radius:(CGFloat)radius alpha:(CGFloat)alpha    {
    
    CALayer *layer = [view layer];
    [layer setMasksToBounds:YES];
    [layer setCornerRadius:radius];
    [view setBackgroundColor:[view.backgroundColor colorWithAlphaComponent:alpha]];
}

+(BOOL) isValidEmail:(NSString *)checkString
{
    BOOL stricterFilter = NO; // Discussion http://blog.logichigh.com/2010/09/02/validating-an-e-mail-address/
    NSString *stricterFilterString = @"[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}";
    NSString *laxString = @".+@([A-Za-z0-9]+\\.)+[A-Za-z]{2}[A-Za-z]*";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:checkString];
}

+(void)resizeViewToFitSubviews:(UIView *)view
{
    float w = 0;
    float h = 0;
    
    for (UIView *v in [view subviews]) {
        if (v.hidden) {
            ;
        }else{
            
            float fw = v.frame.origin.x + v.frame.size.width;
            float fh = v.frame.origin.y + v.frame.size.height;
            w = MAX(fw, w);
            h = MAX(fh, h);
        }
    }
    [view setFrame:CGRectMake(view.frame.origin.x, view.frame.origin.y, w, h)];
}

+(UIColor*)colorWithHexString:(NSString*)hex
{
    NSString *cString = [[hex stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) return [UIColor grayColor];
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
    
    if ([cString length] != 6) return  [UIColor grayColor];
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:1.0f];
}

+(CGRect)rectForText:(NSString *)text
           usingFont:(UIFont *)font
       boundedBySize:(CGSize)maxSize
{
    maxSize.width= maxSize.width;
    
    
    NSAttributedString *attrString =
    [[NSAttributedString alloc] initWithString:text
                                    attributes:@{ NSFontAttributeName:font}];
    
    CGRect frame  =[attrString boundingRectWithSize:maxSize
                                            options:NSStringDrawingUsesLineFragmentOrigin
                                            context:nil];
    frame.size.height =frame.size.height ;
    return frame;
}

+(UIImage*)imageWithImage:(UIImage*)image scaledToSize:(CGSize)newSize {
    UIGraphicsBeginImageContext(newSize);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}


+ (void)downloadImage:(NSString *)imageUrl andImage:(UIImageView *)imageView andImagePlaceholderName:(NSString *)imagePlaceholderName andIndicator:(UIActivityIndicatorView *)indicator{
    if(indicator != nil)
        indicator.hidden = NO;
    SDWebImageManager *manager = [SDWebImageManager sharedManager];
    NSURL * imageNSURL = [NSURL URLWithString:[imageUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    [manager downloadImageWithURL:imageNSURL options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        NSLog(@"");
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
        if (image && finished)
            imageView.image = image;
        else
            imageView.image = [UIImage imageNamed:imagePlaceholderName];
        if(indicator != nil)
            [indicator removeFromSuperview];
        
    }];
}

+ (CGSize)calculateHeightForText:(NSString *)text havingWidth:(CGFloat)widthValue andFont:(NSDictionary *)fontDictionary  {
    CGSize size = CGSizeZero;
    if (text) {
        CGRect frame = [text boundingRectWithSize:CGSizeMake(widthValue, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:fontDictionary context:nil];
        size = CGSizeMake(frame.size.width, frame.size.height + 1);
    }
    return size;
}

+ (CGFloat)calculateHeightForHtmlText:(NSString*)htmlText {
    
    NSMutableAttributedString *_bodyAttributedString = [[NSMutableAttributedString alloc] initWithData:[htmlText dataUsingEncoding:NSUnicodeStringEncoding] options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType } documentAttributes:nil error:nil];
    
    CGRect TextSize = [_bodyAttributedString boundingRectWithSize:CGSizeMake(SCREEN_WIDTH * 0.95, MAXFLOAT) options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading) context:nil];
    return TextSize.size.height;
}

+ (CGFloat)calculateHeightForEventInfoHtmlText:(NSString*)htmlText {
    
    NSString * stringWithFont = [NSString stringWithFormat:@"<span style=\"font-family:Helvetica;\"><font color=\"#%@\">%@</font></span>",[NSString stringWithFormat:@"000000"],htmlText];
    //    NSAttributedString *text = [[NSAttributedString alloc] initWithData:[stringWithFont dataUsingEncoding:NSUTF8StringEncoding]
    //                                                                options:@{NSDocumentTypeDocumentAttribute : NSHTMLTextDocumentType,
    //                                                                          NSCharacterEncodingDocumentAttribute : @(NSUTF8StringEncoding)}
    //                                                     documentAttributes:nil
    //                                                                  error:nil]; // make sure to check for error in a real app
    
    NSMutableAttributedString * text = [[NSMutableAttributedString alloc] initWithData:[stringWithFont dataUsingEncoding:NSUnicodeStringEncoding] options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType } documentAttributes:nil error:nil];
    
    // Then get the bounding rect based on a known width
    CGRect textFrame = [text boundingRectWithSize:CGSizeMake(SCREEN_WIDTH - 32 , CGFLOAT_MAX)
                                          options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                          context:nil];
    
    CGFloat height = textFrame.size.height;
    
    return height;
    
}
+(BOOL) isValidNumber:(NSString *)checkString{
    NSCharacterSet* notDigits = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];
    if ([checkString rangeOfCharacterFromSet:notDigits].location == NSNotFound)
    {
        // String consists only of the digits 0 through 9
        return YES;
    }else{
        return NO;
    }
}
+ (void)addShadow:(UIView*)view {
    view.layer.masksToBounds = NO;
    view.layer.shadowColor = [[UIColor grayColor] CGColor];
    view.layer.shadowOpacity = 0.4f;
    view.layer.shadowRadius = 2;
    view.layer.shadowOffset = CGSizeMake(2.0, 2.0);
}



+ (UIImage *)rotateImage:(UIImage *)image RotatedByDegrees:(CGFloat)degrees
{
    CGFloat radians = degrees * (M_PI / 180.0);
    
    UIView *rotatedViewBox = [[UIView alloc] initWithFrame:CGRectMake(0,0, image.size.height, image.size.width)];
    CGAffineTransform t = CGAffineTransformMakeRotation(radians);
    rotatedViewBox.transform = t;
    CGSize rotatedSize = rotatedViewBox.frame.size;
    
    UIGraphicsBeginImageContextWithOptions(rotatedSize, NO, [[UIScreen mainScreen] scale]);
    CGContextRef bitmap = UIGraphicsGetCurrentContext();
    
    CGContextTranslateCTM(bitmap, rotatedSize.height / 2, rotatedSize.width / 2);
    
    CGContextRotateCTM(bitmap, radians);
    
    CGContextScaleCTM(bitmap, 1.0, -1.0);
    CGContextDrawImage(bitmap, CGRectMake(-image.size.width / 2, -image.size.height / 2 , image.size.height, image.size.width), image.CGImage );
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}


+ (void)shareImage:(UIImage*)imageToShare viewController:(UIViewController*)viewController {
    
    NSArray *activityItems = @[imageToShare];
    
    UIActivityViewController *activityViewController = [[UIActivityViewController alloc] initWithActivityItems:activityItems applicationActivities:nil];
    activityViewController.excludedActivityTypes = @[UIActivityTypeAssignToContact, UIActivityTypePrint, UIActivityTypePostToWeibo];
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        [viewController presentViewController:activityViewController animated:YES completion:nil];
    } else {
        UIPopoverController *popup = [[UIPopoverController alloc] initWithContentViewController:activityViewController];
        [popup presentPopoverFromRect:CGRectMake(viewController.view.frame.size.width/2, viewController.view.frame.size.height, 0, 0)inView:viewController.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    }
}
+(Boolean) isIPhone4{
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    {
        CGSize result = [[UIScreen mainScreen] bounds].size;
        if(result.height == 480)
            return true;
    }
    return false;
}

+(Boolean)  isIPhone5 {
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    {
        CGSize result = [[UIScreen mainScreen] bounds].size;
        if(result.height == 568)
            return true;
    }
    return false;
}
+(Boolean)  isIPhone6 {
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    {
        CGSize result = [[UIScreen mainScreen] bounds].size;
        if(result.height == 667)
            return true;
    }
    return false;
}

+(Boolean)  isIPhone6Plus {
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    {
        CGSize result = [[UIScreen mainScreen] bounds].size;
        if(result.height == 736)
            return true;
    }
    return false;
}

+(Boolean)  isIPhoneX {
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    {
        CGSize result = [[UIScreen mainScreen] bounds].size;
        if(result.height == 812)
            return true;
    }
    return false;
}

+(UIView *)setCornerAndShadow:(UIView *)view{
    view.layer.cornerRadius = 5;
    view.clipsToBounds = true;
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:view.bounds cornerRadius: view.layer.cornerRadius];
    view.layer.shadowPath = path.CGPath;
    view.layer.backgroundColor = UIColorFromRGB(0x818382).CGColor;
    view.layer.shadowColor = UIColorFromRGB(0x818382).CGColor;
    view.layer.shadowOpacity = 0.2;
    view.layer.shadowOffset = CGSizeMake(5, 5);
    view.layer.shadowRadius = 1;
    view.layer.masksToBounds = NO;
    
    return view;
}
+(UILabel *)setLabelColor:(UILabel *)label{
    
    label.textColor = UIColorFromRGB(StaticLightFontColor);
    
    
    return label;
}
+(UILabel *)setFont:(UILabel *)label{
    
    [label setFont:[UIFont fontWithName:FONT size:15]];
    return label;
}
+(UILabel *)setTextColor:(UILabel *)text{
    
    text.textColor = UIColorFromRGB(StaticDarkColor);
    
    
    return text;
}
+(UIButton *)setButtonColor:(UIButton *)button{
    
    [button setTitleColor: UIColorFromRGB(StaticLightFontColor)];
    
    
    return button;
}
+(UIButton *)setButtonFadedColor:(UIButton *)button{
    
    [button setTitleColor: UIColorFromRGB(StaticFadedFontColor)];
    
    
    return button;
}




+(UITableView *)setMainViewSize:(UITableView *)tableView{
    CGFloat viewHeight =  tableView.frame.size.height;
    CGFloat viewWidth =  tableView.frame.size.width;
    UIEdgeInsets viewInsets =  tableView.contentInset;
    
    
    if ([UIHelper isIPhone4])
    {
        viewHeight = 260;
        viewWidth = 320;
        tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
        
    }else if ([UIHelper isIPhone5]) {
        
        viewHeight = 353;
        viewWidth = 320;
        tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
        
    }else if ([UIHelper isIPhone6])
    {
        viewHeight = 452;
        viewWidth = 375;
        tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    }else if ([UIHelper isIPhone6Plus]){
        viewHeight = 565;
        viewWidth = 414;
        tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    }else{
        viewHeight = 585;
        viewWidth = 375;
        tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    }
    tableView.frame = CGRectMake(tableView.frame.origin.x, tableView.frame.origin.y,  viewWidth, viewHeight);
    
    return tableView;
}




@end
