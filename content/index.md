---
title: "octo's ping library"
---

**liboping** is a *C library* to generate ICMP echo requests, better known
as “ping packets”. It is intended for use in network monitoring applications or applications
that would otherwise need to fork `ping(1)` frequently. Included is a sample application,
called *oping*, which demonstrates the library's abilities. It is like
ping, ping6, and fping rolled into one. Since people are curious you might want to
[see an example output](example.txt).

<div style="float: right; margin: 0px 0px 1ex 1ex; padding: .5ex; border: 1px solid silver;">
	<a href="images/noping.png" class="ss-fancy"><img src="images/noping-thumb.png"
		width="150"
		height="99"
		style="display: block;"
		alt="Screenshot of noping." /></a>
	<div style="font-size: 80%;">Screenshot of <em>noping</em>.</div>
</div>
Starting with version&nbsp;1.4.0, a second example application, **noping**, provides an
*ncurses*-based front-end to *liboping*. Using curses windows it is able to display the
ping statistics online (i.e.&nbsp;“live”). An aberrant behavior detection highlights all round-trip
times that are unusually high or low.

liboping was inspired by ping, libping (homepage vanished) and
[fping](http://fping.org/):
It differs from these existing solutions in that it can ”ping” multiple hosts in parallel
using IPv4 or IPv6 transparently. Other design principles were an object oriented interface, simplicity
and extensibility: Is simple because there are only a few interface functions and no external
dependencies. It's extensible since all (internal) data is kept in “opaque data types”, so the storage
may change or be extended without applications noticing it.

## Download

*   [liboping-1.9.0.tar.bz2](files/liboping-1.9.0.tar.bz2)<br>
    <span style="font-size: smaller;">SHA-256: `44bb1d88b56b88fda5533edb3aa005c69b3cd396f20453a157d7e31e536f3530`</span>
*   [liboping-1.9.0.tar.gz](files/liboping-1.9.0.tar.gz)<br>
    <span style="font-size: smaller;">SHA-256: `86b44f684a3151bd4b5b75336876635ecb0f6cfe54a2fb29a6da06432f2dbb00`</span>

## Contributing

*liboping* is a free software project and you're very welcome to participate in
and contribute to its development.

### Repository

Source code is kept in a Git repository on
[GitHub](https://github.com/octo/liboping/).
You can “clone” the repository with the following command. Patches are welcome
anytime (see below).

    git clone git://github.com/octo/liboping.git

### Issues / bug tracker

We use [GitHub issues](https://github.com/octo/liboping/issues) to track bug
reports and feature requests.

### Pull requests / patches

Please open a [Pull request](https://github.com/octo/liboping/pulls) on *GitHub*
if you want to contribute code to *liboping*.

### Mailing list

User questions are best asked on our [mailing
list](https://mailman.verplant.org/listinfo/liboping). You need to subscribe
before you can post to the list.

## License

*liboping* is distributed under the [LGPL 2.1](http://www.gnu.org/licenses/lgpl.html).
The *oping* and *noping* utilities are licensed under the [GPL 2](http://www.gnu.org/licenses/gpl.html).
The license can also be found in the `COPYING` file in the source tarball.
