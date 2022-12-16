import pandas as pd
import psycopg2
import streamlit as st
from configparser import ConfigParser

"#Final Project: E-commerce website"


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


def run_query_1():
    #List all the customer's details that have used a coupon.
    f"Coupons Table"

    sql_table = f"SELECT * FROM coupons;"
    try:
        df = query_db(sql_table)
        st.dataframe(df)
    except:
        st.write(
            "Sorry! Something went wrong with your query, please try again."
        )
    
    #get coupons list
    sql_coupons_names = f"SELECT name FROM coupons;"
    try:
        coupons_names = query_db(sql_coupons_names)["name"].tolist()    
        coupon_name = st.selectbox("Choose a coupon", coupons_names)
        sql_coupons_id = f"SELECT coupon_id FROM coupons WHERE name='{coupon_name}';"
        coupon_ids = query_db(sql_coupons_id)["coupon_id"].tolist()
        query = f"""
        SELECT Customers.customer_id , Customers.fname, Customers.lname, Customers.age, Customers.email, Customers.address 
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

    

def run_query_2():
    #mayank's query - List the number of orders that were shipped from each warehouse with warehouse details. 
    f"Coupons Table"

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
    
def run_query_3():
    #mayank's query 
    pass

def run_query_4():
    #aniket's query
    pass

def run_query_5():
    #aniket's query
    pass

def run_query_6():
    #aniket's query 
    pass

"## Read tables"
query_1 = "List all the customer's details that have used a particular coupon."
query_2 = "List the number of orders that were shipped from each warehouse."
query_3 = "Query 3"
query_4 = "Query 4"
query_5 = "Query 5"
query_6 = "Query 6"

all_queries = [query_1, query_2, query_3, query_4, query_5, query_6]
try:
    query_details = st.selectbox("Choose which type of query you want to run", all_queries)
except:
    st.write("Sorry! Something went wrong with your query, please try again.")

if query_details:
    if query_details == query_1:
        run_query_1()
    elif query_details == query_2:
        run_query_2()
    elif query_details == query_3:
        run_query_3()
    elif query_details == query_4:
        run_query_4()
    elif query_details == query_5:
        run_query_5()
    else:
        run_query_6()




"""
"## Query customers"

sql_customer_names = "SELECT name FROM customers;"
try:
    customer_names = query_db(sql_customer_names)["name"].tolist()
    customer_name = st.selectbox("Choose a customer", customer_names)
except:
    st.write("Sorry! Something went wrong with your query, please try again.")

if customer_name:
    sql_customer = f"SELECT * FROM customers WHERE name = '{customer_name}';"
    try:
        customer_info = query_db(sql_customer).loc[0]
        c_age, c_city, c_state = (
            customer_info["age"],
            customer_info["city"],
            customer_info["state"],
        )
        st.write(
            f"{customer_name} is {c_age}-year old, and lives in {c_city}, {c_state}."
        )
    except:
        st.write(
            "Sorry! Something went wrong with your query, please try again."
        )

"## Query orders"

sql_order_ids = "SELECT order_id FROM orders;"
try:
    order_ids = query_db(sql_order_ids)["order_id"].tolist()
    order_id = st.selectbox("Choose an order", order_ids)
except:
    st.write("Sorry! Something went wrong with your query, please try again.")

if order_id:
    sql_order = f"""
"""        SELECT C.name, O.order_date
        FROM orders as O, customers as C 
        WHERE O.order_id = {order_id}
        AND O.customer_id = C.id;"""
"""
    try:
        customer_info = query_db(sql_order).loc[0]
        customer_name, order_date = (
            customer_info["name"],
            customer_info["order_date"],
        )
        st.write(f"This order is placed by {customer_name} on {order_date}.")
    except:
        st.write(
            "Sorry! Something went wrong with your query, please try again."
        )
"""