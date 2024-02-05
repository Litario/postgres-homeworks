from constants.constants import NONCOLOR, YELLOW


def colprint(date: list) -> None:
    """Печать словарей из списка"""

    for dct in date:
        dct: dict
        for k, v in dct.items():
            print(f'{YELLOW} {k} {NONCOLOR}: {v}')
        print()
