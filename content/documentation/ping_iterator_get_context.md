---
date: 2017-05-09T13:53:27+0200
title: "ping_iterator_get_context(3)"
menu:
  main:
    parent: "docs"
    identifier: "ping_iterator_get_context"
---
# NAME

ping\_iterator\_get\_context, ping\_iterator\_set\_context - Store host-dependent data

# SYNOPSIS

    #include <oping.h>

    void *ping_iterator_get_context (pingobj_iter_t *iter);
    void  ping_iterator_set_context (pingobj_iter_t *iter, void *context);

# DESCRIPTION

__ping\_iterator\_set\_context__ can be used to store host-specific data within the
liboping structures. This data can be received again by calling
__ping\_iterator\_get\_context__. The data itself is never touched by liboping. If
you call ping\_host\_remove (see [ping\_host\_add(3)](http://man.he.net/man3/ping\_host\_add)) or ping\_destroy (see
[ping\_construct(3)](http://man.he.net/man3/ping\_construct)) and the context is not NULL liboping will assume you know
what you're doing and simply ignore the fact this might be a memory leak.

The _iter_ argument is an iterator object as returned by
[ping\_iterator\_get(3)](http://man.he.net/man3/ping\_iterator\_get) and ping\_iterator\_next.

The _context_ argument of __ping\_iterator\_set\_context__ is a pointer to
anything and may be NULL.

# RETURN VALUE

__ping\_iterator\_get\_context__ returns the same pointer previously passed to
__ping\_iterator\_set\_context__ or NULL if __ping\_iterator\_set\_context__ has never
been called before.

# SEE ALSO

[ping\_iterator\_get(3)](http://man.he.net/man3/ping\_iterator\_get),
[ping\_construct(3)](http://man.he.net/man3/ping\_construct),
[ping\_host\_add(3)](http://man.he.net/man3/ping\_host\_add),
[liboping(3)](http://man.he.net/man3/liboping)

# AUTHOR

liboping is written by Florian "octo" Forster <ff at octo.it>.
Its homepage can be found at [http://noping.cc/](http://noping.cc/).

Copyright (c) 2005-2016 by Florian "octo" Forster.
