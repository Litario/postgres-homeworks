import pathlib

base_dir: pathlib.Path = pathlib.Path(__file__).resolve().parent.parent

employees_csv = 'north_data/employees_data.csv'
EMPLOYEES_CSV_PATH: pathlib.Path = base_dir.joinpath(employees_csv)

customers_csv = 'north_data/customers_data.csv'
CUSTOMERS_CSV_PATH: pathlib.Path = base_dir.joinpath(customers_csv)

orders_csv = 'north_data/orders_data.csv'
ORDERS_CSV_PATH: pathlib.Path = base_dir.joinpath(orders_csv)

# print(base_dir)
# print(EMPLOYEES_CSV_PATH)
