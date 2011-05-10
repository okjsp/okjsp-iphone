//
//  SettingImageViewController.m
//  iphone
//
//  Created by 정부 윤 on 10. 8. 16..
//  Copyright 2010 okjsp iphone. All rights reserved.
//

#import "SettingImageViewController.h"


@implementation SettingImageViewController

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad]; 
	
	//[ToDo] 로그인 한 사람의 이미지 보여져야 함.
	//[imageView setImage:[UIImage imageNamed: @"okjsp_Default.jpg"]];
	
}

- (IBAction) OnButtonDown : (id) sender 
{
	NSLog(@"사진 전송");
	
	//[ToDo] 전송중 일때 프로그래스 상태 이미지 호출 
	//[ToDo] okjsp 이미지 전송
	
	//[imageView setImage: [UIImage imageNamed: @"신세경-1.jpg"]]; 
}

-(IBAction)showActionSheet:(id)sender {
	UIActionSheet *myActionSheet = [[UIActionSheet alloc] 
									initWithTitle:@"사진 선택하기" 
									delegate:self 
									cancelButtonTitle:@"취소"
									destructiveButtonTitle:nil 
									otherButtonTitles:@"사진 촬영후 선택" , @"기존 항목 선택", nil];
	myActionSheet.actionSheetStyle = UIActionSheetStyleBlackOpaque;
	
	//탭바가 취소버튼의 영역을 먹고 있어서 아래 코드로 변경
	[myActionSheet showInView:self.tabBarController.view];
	//[myActionSheet showInView:self.view];
	[myActionSheet release];
	
}

- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex 
{  
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
	picker.delegate = self;
	picker.allowsEditing = YES;
	
	if (buttonIndex == 0)  
    {  
        NSLog(@"사진 촬영");
		picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    }  
    else if (buttonIndex == 1)  
    {  
        NSLog(@"기존사진선택");
		picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
		[self presentModalViewController:picker animated:YES];
		[picker release];
    }  
    else if (buttonIndex == 2)  
    {  
        NSLog(@"취소");
    }  
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
	NSLog("@사진선택");
	NSArray* keys = [info allKeys];
	
	for(int i=0 ; i<[keys count] ; i++){
		NSLog(@"@%@ : %@" , [keys objectAtIndex:i] , [info objectForKey:[keys objectAtIndex:i]]);
	}
	
	if( [info objectForKey:@"UIImagePickerControllerEditedImage"] ){
		imageView.image = [info objectForKey:@"UIImagePickerControllerEditedImage"];
	}else {
		imageView.image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
	}
	
	
	[self dismissModalViewControllerAnimated:YES];
	//[picker release];
}

/*
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:
(UIImage *)image editingInfo:(NSDictionary *)editingInfo
{
	//imageView.image = UIImagePNGRepresentation(imageView);
	//image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
	NSLog("@사진선택");
	imageView.image = image;
	/*
	NSArray* keys = [editingInfo allKeys];
	
	for(int i=0 ; i<[keys count] ; i++){
		NSLog(@"@%@ : %@" , [keys objectAtIndex:i] , [editingInfo objectForKey:[keys objectAtIndex:i]]);
	}
	
	if( [editingInfo objectForKey:@"UIImagePickerControllerEditedImage"] ){
		imageView.image = [editingInfo objectForKey:@"UIImagePickerControllerEditedImage"];
	}else {
		imageView.image = [editingInfo objectForKey:@"UIImagePickerControllerOriginalImage"];
	}
	*/
	
	//[self dismissModalViewControllerAnimated:YES];
	//[picker release];
//}


/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
 - (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
 if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
 // Custom initialization
 }
 return self;
 }
 */

/*
 // Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
 - (void)viewDidLoad {
 [super viewDidLoad];
 }
 */

/*
 // Override to allow orientations other than the default portrait orientation.
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
 // Return YES for supported orientations
 return (interfaceOrientation == UIInterfaceOrientationPortrait);
 }
 */

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
