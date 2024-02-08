"""Скрипт для заполнения данными таблиц в БД Postgres."""

from functions import send_csv_to_postgres
from work_dir.adress import EMPLOYEES_CSV_PATH, CUSTOMERS_CSV_PATH, ORDERS_CSV_PATH

if __name__ == '__main__':
    send_csv_to_postgres(EMPLOYEES_CSV_PATH, 'employees')
    send_csv_to_postgres(CUSTOMERS_CSV_PATH, 'customers')
    send_csv_to_postgres(ORDERS_CSV_PATH, 'orders')
