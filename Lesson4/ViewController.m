//
//  ViewController.m
//  Lesson4
//
//  Created by Vasily on 12.04.15.
//  Copyright (c) 2015 Vasily Filippov. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"
#import "CastomTableViewCell.h"

@interface ViewController ()

@property(nonatomic, weak) IBOutlet UITableView * tableView;

@property(nonatomic, strong) MakeArrayas * makeArrays;


- (IBAction)backAction:(id)sender;

- (IBAction)first_ArrayAtion:(id)sender;

- (IBAction)another_ArrayAction:(id)sender;


@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.arrayM = [[NSMutableArray alloc]init];
    self.makeArrays = [MakeArrayas new]; //важно не забыть инициировать этот класс, т.к. без него нотификация работать не будет!
    
    
    if (self.isFirstArray) {
        [self makeFirst];
    }
    else {
        [self makeAnother];
    }
    
    
}


- (void) makeFirst {
    //метод по срабатыванию кнопки с предыдущего окна (работает через делегат)
    MakeArrayas * makeArrays = [[MakeArrayas alloc]init];
    [makeArrays setDelegate:self];
    [makeArrays makeFirstArray];
    
    
}

- (void) makeAnother {
    //метод по срабатыванию кнопки с предыдущего окна (работает через делегат)
    MakeArrayas * makeArrays = [[MakeArrayas alloc]init];
    [makeArrays setDelegate:self];
    [makeArrays makeAnotherArray];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [NSNotificationCenter set_Notif:ARRAY_NOTIF Selector:@selector(makeFirstArray:) Object:self];
    //подписываемся на нотификацию
    
}

- (void)viewWillDisappear:(BOOL)animated{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    //отписываемся от нотификации
}

//возвращает первый массив для таблички (обработанный методом makeFirstArray из класса ArrayInsecta - при нажатии на кнопку Таблица 1 на текущей странице
- (void) makeFirstArray:(NSNotification*)notification {
    
    
    [self.arrayM removeAllObjects]; // очищаем массив
    self.arrayM = [notification.userInfo objectForKey: ARRAY_KEY];
    
    self.isFirstArray = YES;
    [self reloadTableView]; //перегружаем таблицу
    
}

//возвращает второй массив для таблички (обработанный методом makeAnotherArray из класса ArrayInsecta - при нажатии на кнопку Таблица 2 на текущей странице
- (void) makeAnotherArray:(NSNotification*)notification {
    
    [self.arrayM removeAllObjects]; // очищаем массив
    self.arrayM = [notification.userInfo objectForKey: ARRAY_KEY];
    
    self.isFirstArray = NO;
    [self reloadTableView]; //перегружаем таблицу
    
}



#pragma mark - UITableViewDelegate


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arrayM.count;
}

//здесь заполняем таблицу наименование - цена:
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString * simpleTaibleIndefir = @"Cell";
    CastomTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:simpleTaibleIndefir];
    cell.label_ProductValue.text = [[self.arrayM objectAtIndex:indexPath.row]objectForKey:@"value"];
    cell.label_ProductPrice.text = [[self.arrayM objectAtIndex:indexPath.row]objectForKey:@"price"];
    
    //указываем картинку для заполнения в кастомной ячейке:
    UIImage * image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg",[[self.arrayM objectAtIndex:indexPath.row]objectForKey:@"value"]]];
    cell.imageView_ProductImage.image = image;
    
    
    return cell;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //заполняем наследуемый вьюконтроллер DatailViewController (наименование, цена и описание)
    
    DetailViewController * detal = [self.storyboard instantiateViewControllerWithIdentifier:@"Detail"];
    NSDictionary * dict = [self.arrayM objectAtIndex:indexPath.row];
    
    detal.string_MainValue = [dict objectForKey:@"value"];
    detal.string_Price = [dict objectForKey:@"discr"];
    detal.string_Discr = [dict objectForKey:@"price"];
    
    [self.navigationController pushViewController:detal animated:YES];
    
}


//кнопка возврата на предыдущую страницу:
- (IBAction)button_Back:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}



//подписываемся на делегат:
#pragma mark ArraySnowDelegate

- (void) makeArraysFirstArrayReady:(MakeArrayas*) makeArrays FirstArray:(NSMutableArray*) firstArray{
    
    [self.arrayM removeAllObjects]; // очищаем массив
    self.arrayM = firstArray; //получаем таблицу по методу протокола
    [self reloadTableView]; //перегружаем таблицу
    
}
- (void) makeArraysSecondArrayReady:(MakeArrayas*) makeArrays SecondArray:(NSMutableArray*) secondArray{
    
    [self.arrayM removeAllObjects]; // очищаем массив
    self.arrayM = secondArray; //получаем таблицу по методу протокола
    [self reloadTableView]; //перегружаем таблицу
    
}

//метод, который перезагружает таблицу в текущем окне:
- (void) reloadTableView {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationFade];});
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

//метод при нажатии на кнопку Таблица 1 (на текущей странице):

- (IBAction)button1:(id)sender {
    [self.makeArrays makeAnotherArray];
}

//метод при нажатии на кнопку Таблица 2 (на текущей странице):

- (IBAction)button2:(id)sender {
        [self.makeArrays makeFirstArray];
}

@end


//@implementation ViewController
//
//- (void)viewDidLoad {
//    [super viewDidLoad];
//    
//
//    
//    if (self.isFirstArray) {
//        [self makeFirstArray];
//        
//    }
//    
//    else  {
//        [self makeAnotherArray];
//    }
//}
//
//- (void) makeFirstArray {
//
//    MakeArrayas * makeArrayas = [[MakeArrayas alloc]init];
//    [makeArrayas setDelegate:self];
//    [makeArrayas makeFirstArray];
//}
//
//- (void) makeAnotherArray {
//
//    MakeArrayas * makeArrayas = [[MakeArrayas alloc]init];
//    [makeArrayas setDelegate:self];
//    [makeArrayas makeAnotherArray];
//    
//}
//
//
//-(void) didReceiveMemoryWarning {
//    
//    [super didReceiveMemoryWarning];
//    //Dispose of any resources that can de recreated.
//    
//}
//
////=======================================================================
//
//#pragma mark - UITableViewDelegate
//
//-(void) reloadTableView {
//    
//    dispatch_async(dispatch_get_main_queue(), ^{
//        
//        [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationFade];
//    });
//}
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    
//    return self.arrayM.count;
//    
//    
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    static NSString *simpleTableIdentifier = @"Cell";
//    CastomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
//  
//    
//
//    
//    UIImage * image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg",[[self.arrayM objectAtIndex:indexPath.row]objectForKey:@"value"]]];
//    
//
//        cell.label_ProductPrice.text = [[self.arrayM objectAtIndex: indexPath.row]objectForKey:@"value"];
//        cell.label_ProductValue.text = [[self.arrayM objectAtIndex:indexPath.row]objectForKey:@"price"];
//        
//         NSLog(@"cell.label_ProductPrice.text %@", cell.label_ProductPrice.text);
//    
//    cell.imageView_ProductImage.image = image;
//    
//    return cell;
//}
//
//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//   
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//    
//    DetailViewController *  detal = [self.storyboard
//                                     instantiateViewControllerWithIdentifier:@"Detail"];
//    
//    NSDictionary * dict = [self.arrayM objectAtIndex:indexPath.row];
//    
//    detal.string_MainValue = [dict objectForKey:@"value"];
//    detal.string_Price = [dict objectForKey:@"price"];
//    detal.string_Discr = [dict objectForKey:@"discr"];
//    
//    [self.navigationController pushViewController:detal animated:YES];
//    
//    NSLog(@"indexPath %li", (long)indexPath.row);
//    
//    } 
//    
//
//
//
//    
//
//- (IBAction)backAction:(id)sender {
//    [self.navigationController popViewControllerAnimated:YES];
//}
//
//- (IBAction)first_ArrayAtion:(id)sender {
//    
//    [self makeFirstArray];
//     
//    
//}
//
//- (IBAction)another_ArrayAction:(id)sender {
//     [self makeAnotherArray];
//    
//}
//
//
//    
//
//
//
//    
//
//
//
//
////=============================================================================================================
//#pragma mark - MakeArraysDelegate
//
//- (void) makeArraysFirstArrayReady : (MakeArrayas *) makeArrays FirstArray: (NSMutableArray *) firstArray {
//    
//    [self reloadTableView ];
//    [self.arrayM removeAllObjects];
//    self.arrayM = firstArray;
//    self.isFirstArray = YES;
//   
//    
//}
//- (void) makeArraysSecondArrayReady : (MakeArrayas *) makeArrays SecondArray: (NSMutableArray *) secondArray {
//    
//     [self reloadTableView ];
//    [self.arrayM removeAllObjects];
//    self.arrayM = secondArray;
//    self.isFirstArray = NO;
//   
//
//}
//
//
//@end