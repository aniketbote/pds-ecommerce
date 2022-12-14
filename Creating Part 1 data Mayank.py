#!/usr/bin/env python
# coding: utf-8

# In[2]:


import numpy as np
import pandas as pd
import random


# In[7]:


seller_ids = ['CBAYSELLER' + str(i+1) for i in range(20)]
print(seller_ids)
seller_names = ['Cecily Wall',
                'Eden Coleman',
                'Zach Washington',
                'Kristina Holmes',
                'Wilson Hayden',
                'Shaun Frost',
                'Karim Matthams',
                'Jenna Mejia',
                'Jonty Conner',
                'Abdur Benton',
                'Carla Tucker',
                'Katrina Campos',
                'Hermione Mcclain',
                'Erin Mayer',
                'Asiya Wong',
                'Elise Velez',
                'Aine Cooke',
                'Melanie Saunders',
                'Shannon Branch', 
                'Joao Riggs']
print(seller_names)
emails = []
for i in range(20):
    email = '.'.join(seller_names[i].split()).lower()+ '@' + random.choice(["yahoo.com", 'gmail.com', 'outlook.com'])
    emails.append(email)                                              
print(emails)
addresses = ['611 Valley St. Massillon, OH 44646',
             '254 Lookout Street Bear, DE 19701',
             '8720 Newport Street Crystal Lake, IL 60014',
             '64 Van Dyke Circle Titusville, FL 32780',
             '54 N. Cottage St. Suite 630 Fayetteville, NC 28303',
             '8643 Shipley Street Cookeville, TN 38501',
             '875 Wakehurst Dr. Duarte, CA 91010', 
             '715 College Lane Glen Allen, VA 23059',
             '816 Glenridge St. Rolling Meadows, IL 60008',
             '9180 Griffin Road Homestead, FL 33030',
             '171 Newport Street Fuquay Varina, NC 27526',
             '909 Chestnut Rd. Whitehall, PA 18052',
             '9472 Military Lane Reston, VA 20191', 
             '438 Woodside Dr. Lakeland, FL 33801',
             '92 E. Aspen Street Dayton, OH 45420',
             '97 Lake Street East Hartford, CT 06118',
             '177 Pawnee Street Owings Mills, MD 21117',
             '8969 Vine Rd. Des Moines, IA 50310',
             '500 Hamilton Dr. Manchester, NH 03102', 
             '324 East Iroquois Drive Leland, NC 28451']
print(addresses)
phone_numbers = [2579628381, 6585341215, 7776347309, 2819497046, 7804286556, 7663732392, 2392275905,
                 2668181868, 4604675159, 8494975854, 6516926163, 9452886410, 8913373541, 9985722503,
                 9629854313, 3646011923, 3587172688, 5625068710, 8884707391, 997910598]
print(phone_numbers)

print(len(seller_ids), len(seller_names), len(emails), len(addresses), len(phone_numbers))
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


# In[8]:


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


# In[9]:


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


# In[14]:


coupon_ids = ['MTUOGB','UAWYVQ','GHXANS','KPFVWY','YZKSWQ','KZFGFA','MAILAP','GTFWGT','KGSXXU','LITZMO',
             'NHTBVT','LMFWGF','WAFANK','NOAXDQ','WXKVAA','HWTIUT','EUGWZA','KLPBCG','JPVVOB','ZDLXRF',
             'JTZGMP','UGLFVP','YTOVZI','ZIHFVV','ALHIRB','LERDKB','CJUKCJ','QBBEYD','CBVPKD','XHQOGH']

coupon_names = ['FLAT20', 'BLACKFRIDAY', 'FIRSTORDER', 'SUMMERSALE', 'WINTERSALE', 
                'KZFGFA','MAILAP','GTFWGT','KGSXXU','LITZMO', 'NHTBVT','LMFWGF',
                'WAFANK','NOAXDQ','WXKVAA','HWTIUT','EUGWZA','KLPBCG','JPVVOB','ZDLXRF',
                'JTZGMP','UGLFVP','YTOVZI','ZIHFVV','ALHIRB','LERDKB','CJUKCJ','QBBEYD','CBVPKD','XHQOGH']
discounts = [0.2, 0.5, 0.5, 0.3, 0.3, 0.11, 0.20, 0.15,
             0.05,0.10,0.18,0.20,0.08,0.11,0.18,0.09,0.15,
             0.14,0.08,0.16,0.08,0.09,0.16,0.08,0.05,0.17,
             0.20,0.13,0.11,0.11]
start_dates = ['2020-01-01','2021-11-26','2020-01-01','2021-05-01','2021-09-01',
               '2022-05-19','2022-03-06','2022-06-29','2022-07-20','2022-03-24',
               '2022-07-16','2022-06-28','2022-06-13','2022-03-13','2022-03-25',
               '2022-08-29','2022-05-18','2022-09-22','2022-08-10','2022-10-21',
               '2022-04-22','2022-10-26','2022-01-03','2022-04-12','2022-01-24',
               '2022-06-23','2022-07-12','2022-06-02','2022-06-08','2022-06-04']
end_dates = ['2030-01-01','2021-11-26','2030-01-01','2021-09-01','2022-03-01',
             '2023-04-21','2023-08-05','2023-10-01','2023-06-14','2023-09-12',
             '2023-12-05','2023-11-16','2023-01-21','2023-09-22','2023-11-13',
             '2023-02-05','2023-11-19','2023-07-25','2023-12-30','2023-10-24',
             '2023-03-07','2023-07-21','2023-08-03','2023-04-25','2023-09-26',
             '2023-03-16','2023-01-25','2023-07-16','2023-09-14','2023-07-05']
coupons_dict =  {'coupon_id': coupon_ids,
                 'name': coupon_names,
                 'discount': discounts,
                 'start_date': start_dates,
                 'end_date' : end_dates
}

coupons_df = pd.DataFrame(coupons_dict)
coupons_df.to_csv("coupons.csv", index=False)
coupons_df


# In[ ]:




