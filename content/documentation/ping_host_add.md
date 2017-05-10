---
date: "2017-05-10T10:01:13+02:00"
title: "ping_host_add(3)"
menu:
  main:
    parent: "docs"
    identifier: "ping_host_add"
---
# NAME

ping\_host\_add - Add a host to a liboping object

# SYNOPSIS

    #include <oping.h>

    int ping_host_add    (pingobj_t *obj, const char *host);
    int ping_host_remove (pingobj_t *obj, const char *host);

# DESCRIPTION

The __ping\_host\_add__ method tries to resolve the _host_ argument, open a
socket and associate everything with the liboping object _obj_.

The _obj_ argument is a pointer to an liboping object, as returned by
[ping\_construct(3)](http://man.he.net/man3/ping\_construct).

The _host_ parameter is a '\\0' terminated string which is interpreted as a
hostname or an IP address. Depending on the address family setting, set with
[ping\_setopt(3)](http://man.he.net/man3/ping\_setopt), the hostname is resolved to an IPv4 or IPv6 address.

The __ping\_host\_remove__ method looks for _host_ within _obj_ and remove it if
found. It will close the socket and deallocate the memory, too.

The names passed to __ping\_host\_add__ and __ping\_host\_remove__ must match. This
name can be queried using [ping\_iterator\_get\_info(3)](http://man.he.net/man3/ping\_iterator\_get\_info).

# RETURN VALUE

If __ping\_host\_add__ succeeds it returns zero. If an error occurs a value less
than zero is returned and the last error is saved internally. You can receive
the error message using [ping\_get\_error(3)](http://man.he.net/man3/ping\_get\_error).

__ping\_host\_remove__ returns zero upon success and less than zero if it failed.
Currently the only reason for failure is that the host isn't found, but this is
subject to change. Use [ping\_get\_error(3)](http://man.he.net/man3/ping\_get\_error) to receive the error message.

# SEE ALSO

[ping\_construct(3)](http://man.he.net/man3/ping\_construct),
[ping\_setopt(3)](http://man.he.net/man3/ping\_setopt),
[ping\_get\_error(3)](http://man.he.net/man3/ping\_get\_error),
[liboping(3)](http://man.he.net/man3/liboping)

# AUTHOR

liboping is written by Florian "octo" Forster <ff at octo.it>.
Its homepage can be found at [http://noping.cc/](http://noping.cc/).

Copyright (c) 2005-2016 by Florian "octo" Forster.
