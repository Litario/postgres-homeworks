import csv

import psycopg2

from work_dir.passwords import POSTGRES_PASSWORD


def send_csv_to_postgres(csv_file_name, postgres_table_name):
    """Функция для передачи данных из csv файла в базу данных PostgreSQL"""

    with open(f'{csv_file_name}', encoding='windows-1251') as csv_file:
        csv_reader = csv.DictReader(csv_file)
        dict_db = list(csv_reader)

    db = []
    for dct in dict_db:
        dct: dict
        db.append(tuple(dct.values()))

    try:
        ## connect to DATABASE
        conn = psycopg2.connect(host='localhost',
                                database='north',
                                user='postgres',
                                password=POSTGRES_PASSWORD)

        ## create cursor
        with conn.cursor() as cur:
            s0 = "(" + ', '.join(['%s'] * len(db[0])) + ")"  # "%s * n"
            insert_sql_code: str = "INSERT INTO " + postgres_table_name + " VALUES " + s0

            ## cursor execute
            cur.executemany(insert_sql_code, db)
            cur.execute("SELECT * FROM " + postgres_table_name)

        conn.commit()

    finally:
        cur.close()
        conn.close()
