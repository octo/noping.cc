---
date: 2017-05-09T13:53:27+0200
title: "ping_iterator_get_info(3)"
menu:
  main:
    parent: "docs"
    identifier: "ping_iterator_get_info"
---
# NAME

ping\_iterator\_get\_info - Receive information about a host

# SYNOPSIS

    #include <oping.h>

    int ping_iterator_get_info (pingobj_iter_t *iter,
		  int info,
		  void *buffer,
		  size_t *buffer_len);

# DESCRIPTION

The __ping\_iterator\_get\_info__ method can be used on an host iterator to return
various information about the current host.

The _iter_ argument is an iterator as returned by [ping\_iterator\_get(3)](http://man.he.net/man3/ping\_iterator\_get) or
[ping\_iterator\_next(3)](http://man.he.net/man3/ping\_iterator\_next).

The _info_ argument specifies the type of information returned. Use the
following defines:

- __PING\_INFO\_USERNAME__

Return the hostname of the host the iterator points to as supplied by the user.
This is the name you passed to [ping\_host\_add(3)](http://man.he.net/man3/ping\_host\_add) and which you need to pass
to `ping_host_remove`, too.

- __PING\_INFO\_HOSTNAME__

Return the hostname of the host the iterator points to. Since the name is
looked up using the socket address this may differ from the hostname passed to
[ping\_host\_add(3)](http://man.he.net/man3/ping\_host\_add). The hostname is actually looked up every time you call
this method, no cache is involved within _liboping_.

It is recommended to include `netdb.h` and allocate __NI\_MAXHOST__ bytes of
buffer.

- __PING\_INFO\_ADDRESS__

Return the address used in ASCII (i.e. human readable) format. The address is
looked up every time you call this method. 40 bytes should be sufficient for
the buffer (16 octets in hex format, seven colons and one null byte), but more
won't hurt.

- __PING\_INFO\_FAMILY__

Returns the address family of the host. The buffer should be big enough to hold
an integer. The value is either __AF\_INET__ or __AF\_INET6__.

- __PING\_INFO\_LATENCY__

Return the last measured latency or less than zero if the timeout occurred
before a echo response was received. The buffer should be big enough to hold a
double value.

- __PING\_INFO\_DROPPED__

Return the number of times that no response was received within the timeout.
This value is only increased but may wrap around at the 32&nbsp;bit boundary.
The buffer should be big enough to hold a 32&nbsp;bit integer, e.&nbsp;g. an
`uint32_t`.

- __PING\_INFO\_SEQUENCE__

Return the last sequence number sent. This number is increased regardless of
echo responses being received or not. The buffer should hold an integer.

- __PING\_INFO\_IDENT__

Return the ident that is put into every ICMP packet sent to this host. Per
convention this usually is the PID of the sending process, but since
_liboping_ can handle several hosts in parallel it uses a (pseudo-)random
number here. The buffer should be big enough to hold an integer value.

- __PING\_INFO\_RECV\_TTL__

Returns the _time to live_ (TTL) of the received network packets. This number
depends on the value that was used by the remote host when it sent the echo
reply and has nothing to do with the __PING\_OPT\_TTL__ of [ping\_setopt(3)](http://man.he.net/man3/ping\_setopt). The
buffer should be big enough to hold an integer value.

- __PING\_INFO\_RECV\_QOS__

Returns the value of the _Quality of Service_ (QoS) byte of the incoming IPv4
or IPv6 packet. This byte is not interpreted by _liboping_ at all and may be
DSCP&nbsp;/ ECN or precedence&nbsp;/ ToS depending on your network setup.
Please see the appropriate RFCs for further information on values you can
expect to receive. The buffer is expected to an `uint8_t`.

The _buffer_ argument is a pointer to an appropriately sized area of memory
where the result of the call will be stored. The _buffer\_len_ value is used as
input and output: When calling __ping\_iterator\_get\_info__ it reports the size of
the memory region pointed to by _buffer_. The method will write the number of
bytes actually written to the memory into _buffer\_len_ before returning.

# RETURN VALUE

__ping\_iterator\_get\_info__ returns zero if it succeeds.

__EINVAL__ is returned if the value passed as _info_ is unknown. Both,
_buffer_ and _buffer\_len_, will be left untouched in this case.

If the requested information didn't fit into _buffer_ then the size that would
have been needed is written into _buffer\_len_; _buffer_ itself is left
untouched. The return value is __ENOMEM__ in this case.

# KNOWN BUGS

- __PING\_INFO\_RECV\_TTL__ is not available under Debian Etch due to a missing
define in the header files.

# SEE ALSO

[ping\_iterator\_get(3)](http://man.he.net/man3/ping\_iterator\_get),
[liboping(3)](http://man.he.net/man3/liboping)

# AUTHOR

liboping is written by Florian "octo" Forster <ff at octo.it>.
Its homepage can be found at [http://noping.cc/](http://noping.cc/).

Copyright (c) 2005-2016 by Florian "octo" Forster.
