//
//  ViewController.m
//  KeyboardTextFieldDemo

#import "ScrollViewController.h"

@implementation ScrollViewController

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    [scrollViewDemo setContentSize:CGSizeMake(0,321)];
    [scrollViewInsideScrollView setContentSize:CGSizeMake(0,321)];
//    [scrollViewOfTableViews setContentSize:CGSizeMake(0,scrollViewOfTableViews.bounds.size.height)];
}

-(void)dealloc
{
    returnKeyHandler = nil;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identifier = [NSString stringWithFormat:@"%ld%ld",(long)indexPath.section,(long)indexPath.row];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];

        UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(5,7,135,30)];
        textField.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleTopMargin;
        [returnKeyHandler addTextFieldView:textField];
        [textField setPlaceholder:identifier];
        [textField setBorderStyle:UITextBorderStyleRoundedRect];
        [cell.contentView addSubview:textField];
    }

    return cell;
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

- (BOOL)shouldAutorotate
{
    return YES;
}

@end
