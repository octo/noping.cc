---
date: "2017-05-10T10:01:13+02:00"
title: "ping_setopt(3)"
menu:
  main:
    parent: "docs"
    identifier: "ping_setopt"
---
# NAME

ping\_setopt - Set options for a liboping object

# SYNOPSIS

    #include <oping.h>

    int ping_setopt (pingobj_t *obj, int opt, void *val);

# DESCRIPTION

The __ping\_setopt__ method sets options that apply to all hosts associated with
the object _obj_ and hosts that are yet to be added to the object.

The _obj_ argument is a pointer to an _liboping_ object, as returned by
[ping\_construct(3)](http://man.he.net/man3/ping\_construct).

The _opt_ argument specifies the option to set. Use one of the following
constants. You can check if the required constant is supported by the library
at compile time using `#ifdef`. It is recommended to check for desired
features using the `OPING_VERSION` define.

- __PING\_OPT\_TIMEOUT__

The time to wait for a "echo reply" to be received; in seconds. In this case
the memory pointed to by _val_ is interpreted as a double value and must be
greater than zero. The default is __PING\_DEF\_TIMEOUT__.

- __PING\_OPT\_TTL__

The value written into the time-to-live (= TTL) field of generated ICMP
packets. The memory pointed to by _val_ is interpreted as an integer. Valid
values are 1 through 255. Default is __PING\_DEF\_TTL__.

- __PING\_OPT\_AF__

The address family to use. The memory pointed to by _val_ is interpreted as an
integer and must be either __AF\_UNSPEC__, __AF\_INET__, or __AF\_INET6__. This
option only affects hosts that are being added __after__ this option has been
set. Default is __PING\_DEF\_AF__. If you change this option, and a source address
is set (see __PING\_OPT\_SOURCE__) that setting will be reset.

- __PING\_OPT\_DATA__

Set the data to send. The value passed must be a char-pointer to a
null-terminated string. By default a 56 byte long string is used so that the
packet size of an ICMPv4 packet is exactly 64 bytes. That's the behavior of the
[ping(1)](http://man.he.net/man1/ping) command.

- __PING\_OPT\_SOURCE__

Set the source address to use. The value passed must be a char-pointer to a
null-terminated string specifying either a numerical network address or
network hostname. This option will ignore the address family setting (as
set with __PING\_OPT\_AF__) and will set the object's address family according to
the source address assigned.

- __PING\_OPT\_DEVICE__

Set the outgoing network device to be used. The value passed must be a
char-pointer to a null-terminated string specifying an interface name
(e.&nbsp;g. `eth0`). Please note that this might not be supported by all
operating systems. In that case, __ping\_setopt__ sets the error to
`operation not supported`.

- __PING\_OPT\_QOS__

Sets the _Quality of Service_ flags that should be used when crafting ICMP and
ICMPv6 packets. The memory pointed to by _val_ is interpreted as a `uint8_t`.
The byte is passed to [setsockopt(2)](http://man.he.net/man2/setsockopt) without modification, using the
`IP_TOS` (IPv4) or `IPV6_TCLASS` (IPv6) option. It is the caller's
responsibility to chose a valid bit combination. For details, read the [ip(7)](http://man.he.net/man7/ip)
and [ipv6(7)](http://man.he.net/man7/ipv6) manual pages, as well as _RFC&nbsp;2474_.

- __PING\_OPT\_MARK__

Mark (as in netfilter) outgoing packets using the SO\_MARK socket option. Takes
an int\* pointer as a value. Setting this requires CAP\_NET\_ADMIN under Linux.
Fails with `operation not supported` on platforms which don't have SO\_MARK.

The _val_ argument is a pointer to the new value. It must not be NULL. It is
dereferenced depending on the value of the _opt_ argument, see above. The
memory pointed to by _val_ is not changed.

# RETURN VALUE

__ping\_setopt__ returns zero upon success or less than zero upon failure.

# SEE ALSO

[ping\_construct(3)](http://man.he.net/man3/ping\_construct),
[liboping(3)](http://man.he.net/man3/liboping)

# AUTHOR

liboping is written by Florian "octo" Forster <ff at octo.it>.
Its homepage can be found at [http://noping.cc/](http://noping.cc/).

Copyright (c) 2005-2016 by Florian "octo" Forster.
