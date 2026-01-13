import re
from collections.abc import MutableMapping, MutableSequence, Iterable
from typing import Any

import jsonpath


type JsonPrimitives = str | int | float | bool | None
type JsonObject = MutableMapping[str, Json | JsonPrimitives]
type JsonSequence = MutableSequence[Json | JsonPrimitives]
type Json = JsonObject | JsonSequence


RE_VARIABLE = r'\${(.+?)}'
def recurse_inplace_template_substitution(data: Json, context: Json|None = None) -> None:
    """
    >>> rr = recurse_inplace_template_substitution
    >>> context = {'name': 'test', 'sub': {'ll': [1,2,3], 'dd': 3}}
    >>> data = {'a': 'hello ${name}'}
    >>> rr(data, context)
    >>> data
    {'a': 'hello test'}
    >>> data = [{"a": "${name}"}, "There were ${sub.ll[1]} ${name}s and ${sub.dd} things"]
    >>> rr(data, context)
    >>> data
    [{'a': 'test'}, 'There were 2 tests and 3 things']
    """
    context = context or data
    def _template_substitution(match: re.Match) -> str:
        (v,) = jsonpath.findall(f'$.{match.group(1)}', context) or ('',)
        return str(v)
    def _iterable_pair(obj):
        if isinstance(obj, MutableMapping): return obj.items()
        if isinstance(obj, MutableSequence): return enumerate(data)
    items = _iterable_pair(data)
    if not items:
        return
    for k, v in items:
        if not isinstance(v, str):
            if isinstance(v, (MutableMapping, MutableSequence)):
                recurse_inplace_template_substitution(v, context)
            continue
        _v = re.sub(RE_VARIABLE, _template_substitution, v)
        if _v != v:
            data[k] = _v
