---
date: 2017-05-09T13:53:27+0200
title: "ping_send(3)"
menu:
  main:
    parent: "docs"
    identifier: "ping_send"
---
# NAME

ping\_send - Send ICMP echo requests to all associated hosts and wait for ICMP echo responses to arrive

# SYNOPSIS

    #include <oping.h>

    int ping_send (pingobj_t *obj);

# DESCRIPTION

The __ping\_send__ method is the actual workhorse of this library. It crafts ICMP
packets for the hosts associated with _obj_ and sends them via the
corresponding sockets. It then waits for echo responses and receives them,
writing latency information for each host. The method returns after all echo
replies have been read or the timeout (set with [ping\_setopt(3)](http://man.he.net/man3/ping\_setopt)) is reached.

After this function returns you will most likely iterate over all hosts using
[ping\_iterator\_get(3)](http://man.he.net/man3/ping\_iterator\_get) and ping\_iterator\_next (described in the same manual
page) and call [ping\_iterator\_get\_info(3)](http://man.he.net/man3/ping\_iterator\_get\_info) on each host.

# RETURN VALUE

__ping\_send__ returns the number of echo replies received or a value less than
zero if an error occurred. Use [ping\_get\_error(3)](http://man.he.net/man3/ping\_get\_error) to receive an error message.

# SEE ALSO

[ping\_construct(3)](http://man.he.net/man3/ping\_construct),
[ping\_setopt(3)](http://man.he.net/man3/ping\_setopt),
[ping\_iterator\_get(3)](http://man.he.net/man3/ping\_iterator\_get),
[ping\_iterator\_get\_info(3)](http://man.he.net/man3/ping\_iterator\_get\_info),
[ping\_get\_error(3)](http://man.he.net/man3/ping\_get\_error),
[liboping(3)](http://man.he.net/man3/liboping)

# AUTHOR

liboping is written by Florian "octo" Forster <ff at octo.it>.
Its homepage can be found at [http://noping.cc/](http://noping.cc/).

Copyright (c) 2005-2016 by Florian "octo" Forster.
