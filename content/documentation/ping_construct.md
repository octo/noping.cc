---
date: "2017-05-10T10:01:13+02:00"
title: "ping_construct(3)"
menu:
  main:
    parent: "docs"
    identifier: "ping_construct"
---
# NAME

ping\_construct - Constructor for the liboping class

# SYNOPSIS

    #include <oping.h>

    pingobj_t *ping_construct (void);
    void       ping_destroy   (pingobj_t *obj);

# DESCRIPTION

The __ping\_construct__ constructor allocates the memory necessary for a
liboping object, initializes that memory and returns a pointer to it.

The __ping\_destroy__ iterates over all hosts associated with the liboping object
_obj_, closes the sockets, removes the hosts and frees _obj_'s memory.

# RETURN VALUE

The __ping\_construct__ constructor returns a pointer to the allocated memory or NULL if no memory could be allocated.

# SEE ALSO

[ping\_setopt(3)](http://man.he.net/man3/ping\_setopt),
[ping\_send(3)](http://man.he.net/man3/ping\_send),
[ping\_host\_add(3)](http://man.he.net/man3/ping\_host\_add),
[ping\_get\_error(3)](http://man.he.net/man3/ping\_get\_error),
[ping\_iterator\_get(3)](http://man.he.net/man3/ping\_iterator\_get),
[liboping(3)](http://man.he.net/man3/liboping)

# AUTHOR

liboping is written by Florian "octo" Forster <ff at octo.it>.
Its homepage can be found at [http://noping.cc/](http://noping.cc/).

Copyright (c) 2005-2016 by Florian "octo" Forster.
