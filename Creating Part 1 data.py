import numpy as np
import pandas as pd
import random

'''
Creating sellers data
Create table Sellers(
    seller_id varchar(16) primary key,
    name varchar(50) not null,
    email varchar(50) not null,
    address varchar(256) not null,
    phone_num varchar(16) not null
);
'''
seller_ids = ['CBAYSELLER' + str(i+1) for i in range(10)]
print(seller_ids)
seller_names = ['Wendy Barajas', 'Kason Webber', 'Siobhan Brooks', 'Griff Noble', 'Hania Dillard', 'Rares Gordon', 'Maryam Aguirre', 'Riley Dodson', 'Myra Mcgill', 'Skyla Kennedy']
print(seller_names)
emails = []
for i in range(10):
    email = '.'.join(seller_names[i].split()).lower()+ '@' + random.choice(["yahoo.com", 'gmail.com', 'outlook.com'])
    emails.append(email)                                              
print(emails)
addresses = ['738 East Country Dr. Traverse City, MI 49684', '42 North Pineknoll Ave. Mchenry, IL 60050',
'4 Johnson Ave. Saint Albans, NY 11412', '526 East Greenview Rd. Kenosha, WI 53140', 
'985 Old 2nd Drive Gibsonia, PA 15044', '513 Birchwood Drive Mount Airy, MD 21771', '974 Devon Rd. Waltham, MA 02453', 
'851 Harvey Street Tuckerton, NJ 08087','8760 Saxton Street Maplewood, NJ 07040', '8935 Sage Avenue Covington, GA 30014']
print(addresses)
phone_numbers = ['(606) 277-3789', '(753) 202-3905', '(444) 793-9896', '(967) 383-1737', '(391) 627-0383',
                 '(444) 883-8518', '(689) 752-2005', '(911) 896-3287', '(835) 554-4090', '(918) 820-1393']
print(phone_numbers)
sellers_dict = {
    'seller_id':seller_ids,
    'name': seller_names,
    'email': emails,
    'address': addresses,
    'phone_num': phone_numbers
}
sellers_df = pd.DataFrame(sellers_dict)
sellers_df.to_csv("sellers.csv", index=False)
sellers_df



'''
Creating employees data
Create table Employees(
    employee_id varchar(16) primary key,
    employee_name varchar(50) not null,
    designation varchar(50) not null,
    department varchar(50) not null
);
'''
designations = []
departments = []
department_types = ['receiving', 'putaway', 'storage', 'picking', 'packing', 'shipping']
for i in range(24):
    designations.append("Worker")
for i in range(6):
    for j in range(4):
        departments.append(department_types[i])
for i in range(4):
    designations.append("SuperVisor")
    departments.append('Supervision')
for i in range(2):
    designations.append("Manager")
    departments.append("Management")



employees_dict = {
    'employee_id' :  ['CBAYEMP0000'+ str(i+1) for i in range(30)],
    'employee_name' : ['Nicola Oliver', 'Jason Rees', 'Natalie Jones', 'Harry Avery', 'Adrian Paige',\
                        'Cameron King', 'Joe Forsyth', 'Penelope Ellison', 'Sarah Edmunds', 'Jane Jackson',\
                        'Mary Mitchell', 'Alexandra Langdon', 'Diane Edmunds', 'Peter Welch', 'Jake Roberts',\
                        'Brian Hughes', 'Katherine Sanderson', 'Ryan Peake', 'Frank Parsons', 'Stephen Powell',\
                        'Rose Sanderson', 'Luke Bower', 'Jack Henderson', 'Chloe Lyman', 'Abigail Lee',\
                        'Zoe Howard', 'Virginia Reid', 'Nathan King', 'David Henderson', 'Blake Metcalfe'],
    'designation' : designations,
    'department' : departments
}

employees_df = pd.DataFrame(employees_dict)
employees_df.to_csv("employees.csv", index=False)
employees_df


'''
Creating products data
Create table Products(
    product_id varchar(16) primary key,
    name varchar(50) not null,
    price real not null,
    availability integer not null
);
'''
product_names = ['C-bay Mattress', 'C-bay Pillows', 'C-bay Cloth Hangars', 
                 'C-bay Bed Frame', 'C-bay Bed Sheet', 'C-bay Comforter',
                 'C-bay Wine Glasses', 'C-bay Plate Set', 'C-bay Storage Container Set', 
                 'C-bay Knife Set', 'C-bay Spoon Set', 'C-bay Cast Iron Skillet',
                 'C-bay Heater', 'C-bay Air Conditioner', 'C-bay Fan', 
                 'C-bay Kitchen Cart', 'C-bay Coffee Table', 'C-bay Body Wash', 
                 'C-bay Shampoo and Conditioner', 'C-bay Dry Bath Towel', 'C-bay Curtain Rod', 
                 'C-bay Handwash', 'C-bay Toilet Roll Pack', 'C-bay Trash Bags 40 Count', 
                 'C-bay Laundry Detergent Pacs', 'C-bay Storage Bags 300 count', 'C-bay Razor', 
                 'C-bay Mop', 'C-bay Paper Towels', 'C-bay Handsoap Liquid']
prices = [149.99, 14.99, 5.99, 74.99, 13.99, 24.99,
    27.99, 34.99, 19.99, 16.99, 9.99, 13.99,
    29.99, 174.99, 14.99, 12.99, 134.99,
    5.23, 4.99, 14.99, 14.99, 2.99, 14.99,
    19.99, 16.99, 18.99, 14.99, 16.99, 
    20.99, 9.99]
print(len(product_names), len(prices))
for product, price in zip(product_names, prices):
    print(product," : ", price)
    
products_dict = {
    'product_id' : ["CBAYPDT000" + str(i+1) for i in range(30)],
    'name': product_names,
    'price': prices,
    'availability': [1000 for i in range(30)]
}
products_df = pd.DataFrame(products_dict)
products_df.to_csv("products.csv", index=False)
products_df



'''
Creating coupons data
create table Coupons(
    coupon_id varchar(16) primary key,
    name varchar(16) not null,
    discount real not null,
    start_date date not null, - yyyy-mm-dd
    end_date date not null - yyyy-mm-dd
);
'''
coupons_dict =  {'coupon_id': ['CBAYCOUPON1','CBAYCOUPON2','CBAYCOUPON3','CBAYCOUPON4','CBAYCOUPON5'],
                 'name': ['FLAT20', 'BLACKFRIDAY', 'FIRSTORDER', 'SUMMERSALE', 'WINTERSALE'],
                 'discount': [0.2, 0.5, 0.5, 0.3, 0.3],
                 'start_data': ['2020-01-01', '2021-11-26', '2020-01-01', '2021-05-01', '2021-09-01'],
                 'end_date' : ['2030-01-01', '2021-11-26', '2030-01-01', '2021-09-01', '2022-03-01']
}
coupons_df = pd.DataFrame(coupons_dict)
coupons_df.to_csv("coupons.csv", index=False)
coupons_df




