---
date: "2017-05-10T10:01:13+02:00"
title: "oping(8)"
menu:
  main:
    parent: "docs"
    identifier: "oping"
---
# NAME

oping - send ICMP ECHO\_REQUEST to network hosts

# SYNOPSIS

__oping__ \[__\-4__ | __\-6__\] \[__\-c__ _count_\] \[__\-i__ _interval_\] _host_ \[_host_ \[_host_ ...\]\]

__oping__ \[__\-4__ | __\-6__\] \[__\-c__ _count_\] \[__\-i__ _interval_\] __\-f__ _filename_

__noping__ \[__\-4__ | __\-6__\] \[__\-c__ _count_\] \[__\-i__ _interval_\] _host_ \[_host_ \[_host_ ...\]\]

__noping__ \[__\-4__ | __\-6__\] \[__\-c__ _count_\] \[__\-i__ _interval_\] __\-f__ _filename_

# DESCRIPTION

__oping__ uses ICMPv4 or ICMPv6 ECHO\_REQUEST packets to measure a hosts
reachability and the network latency. In contrast to the original [ping(8)](http://man.he.net/man8/ping)
utility __oping__ can send ICMP packets to multiple hosts in parallel and wait
for all ECHO\_RESPONSE packets to arrive. In contrast to the __fping__ utility
(URL is listed in ["SEE ALSO"](#SEE ALSO)) __oping__ can use both, IPv4 and IPv6
transparently and side by side.

__noping__ is an ncurses-based front-end to _liboping_ which displays ping
statistics online and highlights aberrant round-trip times if the terminal
supports colors.

# OPTIONS

- __\-4__

Force the use of IPv4.

- __\-6__

Force the use of IPv6.

- __\-c__ _count_

Send (and receive) _count_ ICMP packets, then stop and exit.

- __\-i__ _interval_

Send one ICMP packet (per host) each _interval_ seconds. This can be a
floating-point number to specify sub-second precision.

- __\-w__ _timeout_

Specifies the time to wait for an `ECHO REPLY` packet before giving up, in
seconds. This can be a floating point number for sub-second precision. Defaults
to __1.0__ seconds.

- __\-t__ _ttl_

Set the IP Time to Live to _ttl_. This must be a number between (and
including) 1&nbsp;and&nbsp;255\. If omitted, the value __64__ is used.

- __\-I__ _address_

Set the source address to use. You may either specify an IP number or a
hostname. You __cannot__ pass the interface name, as you can with GNU's
[ping(8)](http://man.he.net/man8/ping) - use the __\-D__ option for that purpose.

- __\-D__ _interface name_

Set the outgoing network device to use.

- __\-f__ _filename_

Instead of specifying hostnames on the command line, read them from
_filename_. If _filename_ is __\-__, read from `STDIN`.

If _oping_ is installed with the SetUID-bit, it will set the effective UID to
the real UID before opening the file. In the special (but common) case that
_oping_ is owned by the super-user (UID&nbsp;0), this means that privileges
are temporarily dropped before opening the file, in order to prevent users from
reading arbitrary files on the system.

If your system doesn't provide _saved set-user IDs_ (this was an optional
feature before POSIX&nbsp;2001), the behavior is different because it is not
possible to _temporarily_ drop privileges. The alternative behavior is: If the
real user ID (as returned by [getuid(2)](http://man.he.net/man2/getuid)) and the effective user ID (as
returned by [geteuid(2)](http://man.he.net/man2/geteuid)) differ, the only argument allowed for this option is
"-" (i.e. standard input).

- __\-O__ _filename_

Write measurements in _Comma Separated Values_ (CSV) format to _filename_.
This option writes three columns per row: wall clock time in (fractional)
seconds since epoch, hostname and the round trip time in milliseconds.

- __\-Q__ _qos_

Specify the _Quality of Service_ (QoS) for outgoing packets. This is a
somewhat tricky option, since the meaning of the bits in the IPv4 header has
been revised several times.

The currently recommended method is _Differentiated Services_ which is used in
IPv6 headers as well. There are shortcuts for various predefined
_per-hop behaviors_ (PHBs):

    - __be__

    Selects the _Best Effort_ behavior. This is the default behavior.

    - __ef__

    Selects the _Expedited Forwarding_ (EF) per-hop behavior, as defined in
    _RFC&nbsp;3246_. This PHB is characterised by low delay, low loss and low
    jitter, i.e. high priority traffic.

    - __va__

    Selects the _Voice Admitted_ (VA) per-hop behavior, as defined in
    _RFC&nbsp;5865_. This traffic class is meant for _Voice over IP_ (VoIP)
    traffic which uses _Call Admission Control_ (CAC) for reserving network
    capacity.

    - __af___c__p_

    Selects one of 12&nbsp;differentiated services code points (DSCPs), which are
    organized in four _classes_ with three _priorities_ each. Therefore, _c_
    must be a number between&nbsp;1 through&nbsp;4 and _p_ must be a number
    between&nbsp;1 through&nbsp;3, for example "af13", "af22" and "af41". In each
    class, the lower priority number takes precedence over the higher priority
    number.

    - __cs___n_

    Selects one of the eight _Class Selector_ PHBs. _n_ is a number
    between&nbsp;0 through&nbsp;7\. The class selectors have been defined to be
    compatible to the _Precedence_ field in the IPv4 header as defined in
    _RFC&nbsp;791_. Please note that "cs0" is synonymous to "be".

The old definition of the same bits in the IPv4 header was as _Type of
Service_ (ToS) field, specified in _RFC&nbsp;1349_. It defined four possible
values which have appropriate aliases. Please note that this use of the bits is
__deprecated__ and the meaning is limited to IPv4!

    - __lowdelay__

    Minimize delay

    - __throughput__

    Maximize throughput

    - __reliability__

    Maximize reliability

    - __mincost__

    Minimize monetary cost

Alternatively, you can also specify the byte manually. You can use either a
decimal number (0-255), a hexadecimal number (0x00-0xff) or an octal number
(00-0377) using the usual "0x" and "0" prefixes for hexadecimal and octal
respectively.

The printed lines will contain information about the QoS field of received
packets if either a non-standard QoS setting was used on outgoing packets or if
the QoS byte of incoming packets is not zero. In other words, the QoS
information is omitted if both, the outgoing and the incoming QoS bytes are
zero. The received byte is always interpreted as
_Differentiated Services Code Point_ (DSCP) and
_Explicit Congestion Notification_ (ECN), even if the deprecated
_Type of Service_ (ToS) aliases were used to specify the bits of outgoing
packets.

- __\-m__ _mark_

_Linux only_ Sets the _mark_ (an integer number) on outgoing packets. This
can be used by [iptables(8)](http://man.he.net/man8/iptables) and other networking infrastructure for filtering
and routing.

- __\-u__|__\-U__

_noping only_ __\-u__ forces UTF-8 output, __\-U__ disables UTF-8 output. If
neither is given, the codeset is automatically determined from the locale.

- __\-g__ __none__|__prettyping__|__boxplot__|__histogram__

_noping only_ Selects the graph to display.

    - __none__

    Do not show a graph.

    - __prettyping__

    Show a graph with time on the x-axis, the y-axis shows the round-trip time.
    This is the default graph.

    If your terminal supports unicode and colors, they are used to improve
    the precision of the data shown: a green box is drawn for round-trip times up
    to one third of the configured timeout, the height representing the RTT. Longer
    RTTs will start to fill the box yellow (with a green background) and then red
    (with a yellow background). Lost packages are drawn as a bold red explamation
    mark.

    - __boxplot__

    Show a _box plot_ where the x-axis, i.e. the width of the window, is the
    round-trip time. The entire width of the window it the ping interval, set with
    the __\-i__ option.

    The box is sized so it contains 50% of the replies. The vertical line shows the
    median. The whiskers are sized to contain 95% of the replies -- 2.5% below the
    whiskers and 2.5% above.

         |----------[#####|##########]--------------------------------------------|
         ^          ^     ^          ^                                            ^
        2.5%       25%   50%        75%                                         97.5%

    - __histogram__

    Show a _histrogram_ of the round-trip times. The width of the window is taken
    as round-trip time from 0ms on the left to the _interval_ (the __\-i__ option,
    default 1000ms) on the right.

    The height of the graph is scaled so that the most-used buckets vertically fills
    the line. The buckets are colored green up to and including the 80th
    percentile, yellow up to and including the 95th percentile and red for the
    remainder.

- __\-b__

Audible bell. Print a ASCII BEL character (\\a or 0x07) when a packet
is received before the timeout occurs. This can be useful in order to
monitory hosts' connectivity without looking physically at the
console, for example to trace network cables (start audible beep,
disconnect cable N: if beep stops, the cable was in use) or to tell
when a host returns from a reboot.

This relies on the terminal bell to be functional. To enable the
terminal bell, use the following instructions.

    - the visual bell is disabled in your terminal emulator, with the +vb
    commandline flag or the following in your .Xresources:

            XTerm*visualBell: false
    - the PC speaker module is loaded in your kernel:

            modprobe pcspkr
    - X11 has the terminal bell enabled:

            xset b on; xset b 100
    - and finally, if you are using PulseAudio, that the module-x11-bell
    module is loaded with a pre-loaded sample defined in your pulseaudio
    configuration:

        load-sample-lazy x11-bell /usr/share/sounds/freedesktop/stereo/complete.oga
        load-module module-x11-bell sample=x11-bell

- __\-P__ _percent_

Configures the latency percentile to report. _percent_ must be a number
between zero and 100, exclusively in both cases. In general, defaults to __95__.
If __\-c__ is given and a number less than 20, this would be the same as the
maximum. In this case the default is chosen so that it excludes the maximum,
e.g. if __\-c&nbsp;5__ is given, the default is _80_. The calculated percentile
is based on the last 900 packets (15 minutes with the default interval).

- __\-Z__ _percent_

If any hosts have a drop rate higher than _percent_, where _percent_ is a
number between zero and 100 inclusively, exit with a non-zero exit status.
Since it is not possible to have a higher drop rate than 100%, passing this
limit will effectively disable the feature (the default). Setting the option to
zero means that the exit status will only be zero if _all_ replies for _all_
hosts have been received.

The exit status will indicate the number of hosts with more than _percent_
packets lost, up to a number of 255 failing hosts.

# COLORS

If supported by the terminal, _noping_ will highlight the round-trip times
(RTT) using the colors green, yellow and red. Green signals RTTs that are in
the "expected" range, yellow marks moderately unusual times and times that
differ a lot from the expected value are printed in red.

The information used to categorize round-trip times is the _percentile_. RTTs
in the 80th percentile are considered to be "normal" and are printed in green.
RTTs within the 95th percentile are considered "moderately unusual" and are
printed in yellow. RTTs above that are considered to be "unusual" and are
printed in red.

# INTERACTIVE KEYBOARD CONTROLS

When running _noping_, the type of graph being displayed can be
changed by using the __g__ key.  A new host can be added at any time
with the __a__ key.

# SEE ALSO

[ping(8)](http://man.he.net/man8/ping), [http://fping.org/](http://fping.org/), [liboping(3)](http://man.he.net/man3/liboping)

# LICENSE

_oping_ and _noping_ are licensed under the GPL 2.
No other version of the license is applicable.

# AUTHOR

liboping is written by Florian "octo" Forster <ff at octo.it>.
Its homepage can be found at [http://noping.cc/](http://noping.cc/).

Copyright (c) 2005-2017 by Florian "octo" Forster.
