# -*- coding:utf-8 -*-
from numbers import Real
from decimal import Decimal
from itertools import tee, filterfalse


def sorted2(iterable):
    """

    :param iterable: An iterable (array or alike)
        entity which elements should be sorted.
    :return: List with sorted elements.
    """
    def predicate(x):
        return isinstance(x, (Real, Decimal))

    t1, t2 = tee(iterable)
    numbers = filter(predicate, t1)
    non_numbers = filterfalse(predicate, t2)
    sorted_numbers = sorted(numbers)
    sorted_non_numbers = sorted(non_numbers, key=str)
    return sorted_numbers + sorted_non_numbers


def filter_keys(dic):
    if not dic:
        return None
    lst = list(dic)
    if len(lst) == 0:
        return lst
    r = []
    for key in lst:
        if not dic[key] or isinstance(dic[key], dict):
            continue
        r.append(key)
    return sorted(r)


def find_common_elements(lst):
    if len(lst) == 0:
        return []
    if not isinstance(lst[0], dict):
        return lst
    if len(lst) == 1:
        return filter_keys(lst[0])
    ll = filter_keys(lst[0])
    for item in lst:
        tmp = filter_keys(item)
        ll = list(set(tmp).intersection(ll))
    for key in ll:
        values = []
        for item in lst:
            values.append(item[key])
        for value in values:
            pass
    return ll


if __name__ == "__main__":
    l1 = []
    assert(find_common_elements(l1) == [])
    l2 = [1, 2, 3]
    assert(find_common_elements(l2) == l2)
    l3 = [{'a': 1, 'b': 2}]
    assert(find_common_elements(l3) == sorted(['a', 'b']))
    l4 = [{'a': 1, 'b': 2}, {'a': 1, 'd': 2, 'c': 3}]
    assert(find_common_elements(l4) == sorted(['a']))
    l5 = [{'a': 1, 'b': 2}, {'d': 2, 'c': 3}]
    assert(find_common_elements(l5) == [])
    l6 = [{'a': None, 'b': 2}, {'a': 1, 'b': None, 'd': 2, 'c': 3}]
    assert(find_common_elements(l6) == sorted([]))
    l7 = [{'a': None, 'b': 2}, {'a': 1, 'b': 3, 'd': 2, 'c': 3}]
    assert(find_common_elements(l7) == sorted(['b']))
