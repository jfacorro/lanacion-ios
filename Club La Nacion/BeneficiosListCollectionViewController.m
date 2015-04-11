#import "BeneficiosListCollectionViewController.h"
#import "LNClubBackend.h"
#import "LNBenefitRepository.h"
#import "BeneficioCollectionViewCell.h"
#import "CategoriasProvider.h"

@interface BeneficiosListCollectionViewController ()
@property (nonatomic,strong) LNClubBackend *backend;
@property (nonatomic,strong) LNBenefitRepository *repository;
@property (nonatomic,strong) NSArray *benefitsArray;
@end

@implementation BeneficiosListCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.backend = [[LNClubBackend alloc]init];
    self.repository = [[LNBenefitRepository alloc]initWithBackend:self.backend];
    self.repository.serverUrl = @"http://http://lanacion.herokuapp.com/api";
    self.repository.basePath = @"categoria/";
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Do any additional setup after loading the view.
    
    [self retrieveBenefits];
}

- (void)retrieveBenefits
{
    NSString *parametersPath = [[CategoriasProvider descriptionForCategoria:self.categoria] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    self.repository.basePath = [self.repository.basePath stringByAppendingString:parametersPath];
    [self.repository findAllDocumentsWithSuccess:^(NSArray *documents) {
        self.benefitsArray = [NSArray arrayWithArray:documents];
        [self.collectionView reloadData];
    } failure:^(IJError *error) {
        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"Error" message:@"Ocurrio un error. Intente de nuevo" delegate:self cancelButtonTitle:@"Aceptar" otherButtonTitles:nil];
        [alert show];
        NSLog(@"failure");
    }];
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(self.collectionView.frame.size.width, 220.0f);
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.benefitsArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    BeneficioCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"BeneficioCell" forIndexPath:indexPath];
    
    [cell setBeneficio:[self.benefitsArray objectAtIndex:indexPath.row]];
    // Configure the cell
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
