from dataclasses import dataclass


@dataclass
class _MyDataClass:
    key: str
    value: str
    items: list


class MyClass:
    def __init__(self, key, value):
        self.key = key
        self.value = value
        self.items = [1, 3]

    def __eq__(self, other):
        return self.key == other.key and self.value == other.value


var1 = _MyDataClass("k1", "v1", [1, 2])
var2 = _MyDataClass("k1", "v1", [1, 2])
var3 = _MyDataClass("k1", "v1", [2, 1])
var_list1 = [_MyDataClass("k1", "v1", [1, 2]), _MyDataClass("k2", "v2", [3, 2])]
var_list2 = [_MyDataClass("k1", "v1", [1, 2]), _MyDataClass("k2", "v2", [3, 2])]
var_list3 = [_MyDataClass("k1", "v1", [1, 2])]
var_obj1 = MyClass("k1", "v1")
var_obj2 = MyClass("k1", "v1")
var_obj3 = MyClass("k2", "v2")
var_obj_complex1 = {
    "foo": var_list1,
    "bar": {"sub": [MyClass("k1", "v1"), MyClass("k2", "v2")]},
}
var_obj_complex2 = {
    "foo": var_list1,
    "bar": {"sub": [MyClass("k1", "v1"), MyClass("k2", "v2")]},
}
var_obj_complex3 = {
    "foo": var_list1,
    "bar": {"sub": [MyClass("k2", "v1"), MyClass("k2", "v2")]},
}
