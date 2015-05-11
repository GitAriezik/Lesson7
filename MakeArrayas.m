//
//  MakeArrayas.m
//  Lesson4
//
//  Created by Vasily on 14.04.15.
//  Copyright (c) 2015 Vasily Filippov. All rights reserved.
//

#import "MakeArrayas.h"
#import "AppConstants.h"


@implementation MakeArrayas




- (void) makeFirstArray {
    
    NSString * stringValue = @"Ford Kuga,Volkswagen Touareg,Mercedec-Benz";
    NSString * stringPrice = @"2 300 000,2 750 000,5 350 000";
    
    NSString * stringDisFordKuga = @"Мы с гордостью представляем Вам Ford Kuga — выражение стиля и мощи, наш самый умный в истории кроссовер. Ford Kuga оснащен самыми современными технологиями, способными воплотить в жизнь Ваши мечты о городских и внедорожных приключениях.Интеллектуальная система полного привода мгновенно адаптируется под рельеф и условия дороги, система автоматического торможения Active City Stop позволяет предотвратить столкновение при движении на низкой скорости, а система Ford SYNC с помощью голосовых команд позволяет управлять MP3-плеером и функциями телефона. Мы также гордимся тем, что первыми представляем в нашем кроссовере инновационную систему открывания багажника hands-free. Если у Вас заняты руки, просто проведите ногой под задним бампером, и багажник послушно откроется или закроется. Даже двигатель удивляет своей продуманностью. Современная технология прямого впрыска топлива и турбонаддув обеспечивают высокие показатели мощности, экономию топлива и низкий уровень выбросов CO2. При объеме всего 1,6 л EcoBoost обладает 150 / 182 л.с. и создает крутящий момент до 240 Нм.Оснащенный множеством инновационных функций, Kuga выводит стиль и технологии внедорожников на совершенно новый уровень.";
    NSString * stringDisVolkswagenTiguan = @"Мировой дебют Touareg состоялся на автосалоне в Париже 26 сентября 2002 года. Название аVтомобиля восходит к средним векам, когда таурегами называли «рыцарей пустыни», племена кочевников живущих в Сахаре.Сегодня Touareg – первый внедорожник представительского класса. Он стал олицетворением принципиально новой концепции Volkswagen, соединив в себе качества отличного внедорожника с комфортом седана и динамикой спортивного аVтомобиля.Гамма двигателей составляет бензиновый V6 (3,2 л/ 220 л.с.) и V8, мощностью 228 кВт/310 л.с., а также 5-литровый дизель V10 TDI (230 кВт/ 313 л.с.). Впоследствии планируется дополнить этот ряд пятицилиндровым TDI 2,5 л. мощностью 128 кВт/ 174 л.с. В паре с этими двигателями могут работать как механическая, так и автоматическая шестиступенчатая коробка передач.";
    NSString * stringDisMercedesBenz = @"Благодаря трём ключевым идеям, реализованным при его разработке, – Intelligent Drive («Интеллектуальное движение»), Efficient Technology («Экономичные технологии») и Essence of Luxury («Квинтэссенция роскоши») – новый S-Класс раздвигает горизонты автомобильной техники по целому ряду направлений одновременно. S-Класс находится на острие технического прогресса не только марки Mercedes-Benz, но и автомобильной отрасли в целом.";
    
    //заносим в массив значения из строки без символов запятая и пробел:
    
    NSArray * arrayPrice = [stringPrice componentsSeparatedByString:@", "];
    NSArray * arrayValue = [stringValue componentsSeparatedByString:@", "];

    NSMutableArray * arrayDict =[[NSMutableArray alloc]initWithObjects:stringDisFordKuga, stringDisVolkswagenTiguan, stringDisMercedesBenz, nil];
    
    
    NSMutableArray * arrayM = [[NSMutableArray alloc]init];
    
    //данный цикл записывает в коллекцию значения из массива arrayValue и соответствующие ему значения из массива arrayPrice, пока не закончатся элементы в массиве arrayPrice:
    
    for (int i = 0; i < arrayPrice.count; i++) {
        
        NSMutableDictionary * dict = [[NSMutableDictionary alloc]init];
        [dict setObject:[arrayValue objectAtIndex:i] forKey:@"value"];
        [dict setObject:[arrayPrice objectAtIndex:i] forKey:@"price"];
        [dict setObject:[arrayDict objectAtIndex:i] forKey:@"discr"];
        
        [arrayM addObject:dict];
        
    }
    
    //здесь сортируем массив по цене:
    NSSortDescriptor * sorter = [[NSSortDescriptor alloc] initWithKey:@"price" ascending:YES];
    NSArray * descriptors = [NSArray arrayWithObjects:sorter, nil];
    [arrayM sortUsingDescriptors:descriptors];
    
    
    [self.delegate makeArraysFirstArrayReady:self FirstArray:arrayM];
    
    NSDictionary * dict = [[NSDictionary alloc] initWithObjectsAndKeys: arrayM, ARRAY_KEY, nil];
    [NSNotificationCenter call_Notif:ARRAY_NOTIF Dictionary:dict];
    
    
}




- (void) makeAnotherArray {
        
        NSString * stringValue = @"WeThePeople Envy,Radio Astron,FatBoy Mini";
        NSString * stringPrice = @"71 565р,37 180р,22 750р";
        
    
    NSString * stringEnvy = @"Бла-бла-бал в мире велоспорта";
    NSString * stringAstron = @"Бла-бла-бал в мире велоспорта";
    NSString * stringMini = @"Бла-бла-бал в мире велоспорта";
    
    
    
    //заносим в массив значения из строки без символов запятая и пробел:
    
    NSArray* arrayPrice = [stringPrice componentsSeparatedByString:@", "];
    NSArray* arrayValue = [stringValue componentsSeparatedByString:@", "];
    NSMutableArray* arrayDict =[[NSMutableArray alloc]initWithObjects:stringEnvy, stringAstron, stringMini, nil];
    
    
    NSMutableArray* arrayM = [[NSMutableArray alloc]init];
    
    //данный цикл записывает в коллекцию значения из массива arrayValue и соответствующие ему значения из массива arrayPrice, пока не закончатся элементы в массиве arrayPrice:
    
    for (int i = 0; i < arrayPrice.count; i++) {
        
        NSMutableDictionary * dict = [[NSMutableDictionary alloc]init];
        [dict setObject:[arrayValue objectAtIndex:i] forKey:@"value"];
        [dict setObject:[arrayPrice objectAtIndex:i] forKey:@"price"];
        [dict setObject:[arrayDict objectAtIndex:i] forKey:@"discr"];
        
        
        [arrayM addObject:dict];
        
        
    }
    
    
    //здесь сортируем массив по цене:
    NSSortDescriptor * sorter = [[NSSortDescriptor alloc] initWithKey:@"price" ascending:YES];
    NSArray * descriptors = [NSArray arrayWithObjects:sorter, nil];
    [arrayM sortUsingDescriptors:descriptors];
    
    
    [self.delegate makeArraysSecondArrayReady: self SecondArray:arrayM];
    
    
    NSDictionary * dict = [[NSDictionary alloc]initWithObjectsAndKeys: arrayM, ARRAY_KEY, nil];
    [NSNotificationCenter call_Notif:ARRAY_NOTIF Dictionary:dict];
    
    
}


@end
