---
date: "2017-05-10T10:01:13+02:00"
title: "ping_iterator_get(3)"
menu:
  main:
    parent: "docs"
    identifier: "ping_iterator_get"
---
# NAME

ping\_iterator\_get, ping\_iterator\_next - Iterate over all hosts of a liboping object

# SYNOPSIS

    #include <oping.h>

    pingobj_iter_t *ping_iterator_get (pingobj_t *obj);
    pingobj_iter_t *ping_iterator_next (pingobj_iter_t *iter)

# DESCRIPTION

These two functions can be used to iterate over all hosts associated with a
liboping object. You can use these methods as follows:

    pingobj_iter_t *iter;

    for (iter = ping_iterator_get (obj);
         iter != NULL;
         iter = ping_iterator_next (iter))
    {
      ...;
    }

To get usable information from an iterator object (which is also an opaque data
type, just like the liboping object itself) use [ping\_iterator\_get\_info(3)](http://man.he.net/man3/ping\_iterator\_get\_info) and
[ping\_iterator\_get\_context(3)](http://man.he.net/man3/ping\_iterator\_get\_context).

# RETURN VALUE

The __ping\_iterator\_get__ returns an iterator for _obj_ or NULL if no host is
associated with _obj_.

The __ping\_iterator\_next__ returns an iterator for the host following _iter_ or
NULL if the last host has been reached.

# SEE ALSO

[ping\_host\_add(3)](http://man.he.net/man3/ping\_host\_add),
[ping\_iterator\_get\_info(3)](http://man.he.net/man3/ping\_iterator\_get\_info),
[ping\_iterator\_get\_context(3)](http://man.he.net/man3/ping\_iterator\_get\_context),
[liboping(3)](http://man.he.net/man3/liboping)

# AUTHOR

liboping is written by Florian "octo" Forster <ff at octo.it>.
Its homepage can be found at [http://noping.cc/](http://noping.cc/).

Copyright (c) 2005-2016 by Florian "octo" Forster.
