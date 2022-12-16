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

    

def run_query_2():
    #mayank's query - List the number of orders that were shipped from each warehouse. 

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
    #List all the customer's details that have used a coupon.
    f"Coupons Table"
    #get coupons list
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
query_3 = "Find the names and addresses of all sellers who sell a product that has been reviewed with particular number of stars"
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
