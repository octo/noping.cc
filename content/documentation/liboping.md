---
date: "2017-05-10T10:01:13+02:00"
title: "liboping(3)"
menu:
  main:
    parent: "docs"
    identifier: "liboping"
---
# NAME

liboping - Library to send ICMPv4/ICMPv6 echo packets to multiple hosts

# DESCRIPTION

This is an overview of liboping, a C library to send ICMP ECHO\_REQUEST packets
to remote hosts and measure the time it takes for replies to be received. This
method, often simply called "ping", is a common way to measure network latency
and/or host reachability.

The goals of this library are to provide the above functionality in a platform
and protocol independent manner. The interface is simple, object oriented and
(hopefully) ANSI-C compliant.

# GENERAL USAGE

There are two main types that are used by applications. Both are "opaque
types", meaning they are structures that are __not__ completely defined in the
header file, so you cannot access the structures' members. You don't need to,
don't do it. These structures are subject to change without notice.

- `pingobj_t`

A ping-object. You can set specific options for this object, add and remove
hosts to/from it and send ICMP packets to all associated hosts. This is often
called a "handle".

- `pingobj_iter_t`

An iterator over the hosts associated with a `pingobj_t` object. This iterator
can be used to query more information about a host, for example the hostname,
the measured latency or the current ICMP sequence.

Upon startup you usually create one or more `pingobj_t` objects and add hosts
to it using the `ping_host_add` method (see below). You periodically send
"echo requests" using the `ping_send` method, iterate over all hosts using
`ping_iterator_get` and `ping_iterator_next`. For each host you call
`ping_iterator_get_info` to read the current latency and do something with it.

If an error occurs you can use `ping_get_error` so get information on what
failed.

# LINKING WITH LIBOPING

Depending on you platform you don't need any extra libraries (e.g. GNU/Linux)
or `libsocket` (using `-lsocket`) if the `socket` function is not in the
C-library. The latter is the case for the Solaris operating system.

# SYMBOL NAMES

All "official" function or method names are prefixed with "ping\_". Don't use
any other functions or methods. Although no such functions should exist.

# THREAD SAFETY

liboping has been designed to be as thread safe a possible. However, this has
not been tested and may need some additional work. Use at your own risk and
please report back any problems or success messages. Thank you :)

# SEE ALSO

[ping\_construct(3)](http://man.he.net/man3/ping\_construct),
[ping\_setopt(3)](http://man.he.net/man3/ping\_setopt),
[ping\_host\_add(3)](http://man.he.net/man3/ping\_host\_add),
[ping\_send(3)](http://man.he.net/man3/ping\_send),
[ping\_get\_error(3)](http://man.he.net/man3/ping\_get\_error),
[ping\_iterator\_count(3)](http://man.he.net/man3/ping\_iterator\_count),
[ping\_iterator\_get(3)](http://man.he.net/man3/ping\_iterator\_get),
[ping\_iterator\_get\_info(3)](http://man.he.net/man3/ping\_iterator\_get\_info),
[ping\_iterator\_get\_context(3)](http://man.he.net/man3/ping\_iterator\_get\_context)

# LICENSE

liboping is licensed under the LGPL 2.1 or later.

# AUTHOR

liboping is written by Florian "octo" Forster <ff at octo.it>.
Its homepage can be found at [http://noping.cc/](http://noping.cc/).

Copyright (c) 2005-2017 by Florian "octo" Forster.
