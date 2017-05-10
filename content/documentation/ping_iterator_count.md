---
date: 2017-05-09T13:53:27+0200
title: "ping_iterator_count(3)"
menu:
  main:
    parent: "docs"
    identifier: "ping_iterator_count"
---
# NAME

ping\_iterator\_count - Count the number of hosts in a liboping object

# SYNOPSIS

    #include <oping.h>

    int ping_iterator_count (pingobj_t *obj);

# DESCRIPTION

This functions is used to count the number of hosts currently associated
with a liboping object.

# RETURN VALUE

The __ping\_iterator\_count__ returns an integer number or zero if no host is
associated with _obj_.

# SEE ALSO

[ping\_host\_add(3)](http://man.he.net/man3/ping\_host\_add),
[ping\_iterator\_get(3)](http://man.he.net/man3/ping\_iterator\_get),
[ping\_iterator\_next(3)](http://man.he.net/man3/ping\_iterator\_next),
[liboping(3)](http://man.he.net/man3/liboping)

# AUTHOR

liboping is written by Florian "octo" Forster <ff at octo.it>.
Its homepage can be found at [http://noping.cc/](http://noping.cc/).

Copyright (c) 2005-2016 by Florian "octo" Forster.
