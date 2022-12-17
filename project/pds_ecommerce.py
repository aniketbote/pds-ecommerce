import pandas as pd
import psycopg2
import streamlit as st
from configparser import ConfigParser

"# Project : PDS E-commerce"


@st.cache
def get_config(filename="database.ini", section="postgresql"):
    parser = ConfigParser()
    parser.read(filename)
    return {k: v for k, v in parser.items(section)}


@st.cache
def query_db(sql: str):
    # print(f"Running query_db(): {sql}")

    db_info = get_config()

    # Connect to an existing database
    conn = psycopg2.connect(**db_info)

    # Open a cursor to perform database operations
    cur = conn.cursor()

    # Execute a command: this creates a new table
    cur.execute(sql)

    # Obtain data
    data = cur.fetchall()

    column_names = [desc[0] for desc in cur.description]

    # Make the changes to the database persistent
    conn.commit()

    # Close communication with the database
    cur.close()
    conn.close()

    df = pd.DataFrame(data=data, columns=column_names)

    return df


"## Read tables"

sql_all_table_names = "SELECT relname FROM pg_class WHERE relkind='r' AND relname !~ '^(pg_|sql_)';"
try:
    all_table_names = query_db(sql_all_table_names)["relname"].tolist()
    table_name = st.selectbox("Choose a table", all_table_names)
except:
    st.write("Sorry! Something went wrong with your query, please try again.")

if table_name:
    f"Display the table"

    sql_table = f"SELECT * FROM {table_name};"
    try:
        df = query_db(sql_table)
        st.dataframe(df)
    except:
        st.write(
            "Sorry! Something went wrong with your query, please try again."
        )

"## Query 1"
"The query finds all the seller, their products and total amount for each product bought by a specific customer"

sql_customer_names = "SELECT fname FROM Customers order by fname;"
try:
    customer_names = query_db(sql_customer_names)["fname"].tolist()
    customer_name = st.selectbox("Choose a customer name", customer_names)
    order = st.radio(
        "Order the result by amount",
        ('Ascending', 'Descending'))
    only_above_number = st.number_input('Display only results above this amount', min_value = 0)
except:
    st.write("Sorry! Something went wrong with your query, please try again.")

if customer_name:
    ord = 'ASC' if order == 'Ascending' else 'DESC'
    sql_customer = f"""select SE.name as seller_name, P.name as product_name, sum(B.quantity * P.price) as amount from Customers C, OrderedByAppliedonShippedfrom O, BoughtIn B, Products P, SoldBy S, Sellers SE where C.customer_id = O.customer_id and O.order_id = B.order_id and P.product_id = B.product_id and S.product_id = P.product_id and S.seller_id = SE.seller_id and C.fname = '{customer_name}' group by SE.name, P.name having sum(B.quantity * P.price) >= {only_above_number} order by amount {ord}, SE.name, P.name;"""
    try:
        customer_info = query_db(sql_customer)
        df = pd.DataFrame(data=customer_info)
        st.dataframe(df)
    except:
        st.write(
            "Sorry! Something went wrong with your query, please try again."
        )



"## Query 2"
"The query finds total quantity shipped from warehouse having specific name for all products shipped"

sql_warehouse_names = "SELECT warehouse_name FROM Warehouse order by warehouse_name;"
try:
    warehouse_names = query_db(sql_warehouse_names)["warehouse_name"].tolist()
    warehouse_name = st.selectbox("Choose a warehouse name", warehouse_names)
    order = st.radio(
        "Order the result by total quantity",
        ('Ascending', 'Descending'))
    only_above_number = st.number_input('Display only results above this total quantity', min_value = 0)

except:
    st.write("Sorry! Something went wrong with your query, please try again.")

if warehouse_name:
    ord = 'ASC' if order == 'Ascending' else 'DESC'
    sql_customer = f"""select P.name as product_name, sum(B.quantity) as total_quantity from Warehouse W, OrderedByAppliedonShippedfrom O, BoughtIn B, Products P where O.warehouse_name = W.warehouse_name and O.warehouse_zipcode = W.warehouse_zipcode and O.order_id = B.order_id and P.product_id = B.product_id and W.warehouse_name = '{warehouse_name}' group by P.name having sum(B.quantity) >= {only_above_number} order by total_quantity {ord}, P.name;"""
    try:
        customer_info = query_db(sql_customer)
        df = pd.DataFrame(data=customer_info)
        st.dataframe(df)
    except:
        st.write(
            "Sorry! Something went wrong with your query, please try again."
        )


"## Query 3"
"The query finds verified review for a given product. A review is verified if the customer who made the review also bought the product"

sql_product_names = "SELECT name FROM Products order by name;"
try:
    product_names = query_db(sql_product_names)["name"].tolist()
    product_name = st.selectbox("Choose a product name", product_names)
except:
    st.write("Sorry! Something went wrong with your query, please try again.")

if product_name:
    sql_customer = f"""select C.fname as first_name, C.lname as last_name, P.name as product_name, M.review, O.order_id from MadeReview M, Customers C, OrderedByAppliedonShippedfrom O,BoughtIn B, Products P where C.customer_id = O.customer_id and O.order_id = B.order_id and B.product_id = P.product_id and M.customer_id = C.customer_id and M.product_id = P.product_id and P.name = '{product_name}';"""
    try:
        customer_info = query_db(sql_customer)
        df = pd.DataFrame(data=customer_info)
        st.dataframe(df)
    except:
        st.write(
            "Sorry! Something went wrong with your query, please try again."
        )


#List all the customer's details that have used a coupon.
"## Query 4"
"In this query we find the users and display their details that have used a particular coupon in their orders."
#get coupons list
sql_coupons_names = f"SELECT name FROM coupons;"
try:
    coupons_names = query_db(sql_coupons_names)["name"].tolist()    
    coupon_name = st.selectbox("Choose a coupon", coupons_names)
    sql_coupons_id = f"SELECT coupon_id FROM coupons WHERE name='{coupon_name}';"
    coupon_ids = query_db(sql_coupons_id)["coupon_id"].tolist()
    query = f"""
    SELECT Customers.customer_id, Customers.fname, Customers.lname, OrderedByAppliedonShippedfrom.order_id as applied_on_order, Customers.age, Customers.email, Customers.address
    from Customers 
    join OrderedByAppliedonShippedfrom on Customers.customer_id=OrderedByAppliedonShippedfrom.customer_id 
    where OrderedByAppliedonShippedfrom.coupon_id='{coupon_ids[0]}';"""

    try:
        query_output_df = query_db(query)
        st.dataframe(query_output_df)
    except:
        st.write(
            "Sorry! Something went wrong with your query, please try again."
        )
except:
    st.write("Sorry! Something went wrong with your query, please try again.")


"## Query 5"
"In this query we display the names and addresses of all the sellers who have sold a product which has been reviewed with a particular number of stars."
try:
    num_stars_list = [1, 2, 3, 4, 5]
    num_stars = st.selectbox("Choose number of stars", num_stars_list)
    query = f"""SELECT DISTINCT(s.name, s.address, p.product_id, p.name) as seller_details
    FROM Sellers s
    JOIN SoldBy sb ON s.seller_id = sb.seller_id
    JOIN Products p ON sb.product_id = p.product_id
    JOIN MadeReview r ON p.product_id = r.product_id
    WHERE r.stars = {num_stars};"""
    seller_details = query_db(query)
    seller_details = seller_details["seller_details"].tolist()
    for seller in seller_details:
        cur_seller = seller.split(',')
        st.write(f"Seller {cur_seller[0][1:]} lives at {cur_seller[1]}\" and  got a  {num_stars} star rating for product: {cur_seller[-1][:-1]}")
except:
    st.write("Sorry! Something went wrong with your query, please try again.")


"## Query 6"
"In this query we display the number of orders that have been shipped from each warehouse."
sql_table = f"""
    SELECT warehouse_name, count(warehouse_name) as orders_shipped
    from OrderedByAppliedonShippedfrom 
    Group By (OrderedByAppliedonShippedfrom.warehouse_name, OrderedByAppliedonShippedfrom.warehouse_zipcode);"""

try:
    df = query_db(sql_table)
    st.dataframe(df)
except:
    st.write(
        "Sorry! Something went wrong with your query, please try again."
    )
