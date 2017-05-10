---
date: "2017-05-10T10:01:13+02:00"
title: "ping_get_error(3)"
menu:
  main:
    parent: "docs"
    identifier: "ping_get_error"
---
# NAME

ping\_get\_error - Return the last error message

# SYNOPSIS

    #include <oping.h>

    const char *ping_get_error (pingobj_t *obj);

# DESCRIPTION

The __ping\_get\_error__ method returns an error message indicating the last error
encountered. __This method is not thread safe whatsoever.__

# RETURN VALUE

A `const` string representing the last error or an empty string if no error
was encountered yet.

# SEE ALSO

[liboping(3)](http://man.he.net/man3/liboping)

# AUTHOR

liboping is written by Florian "octo" Forster <ff at octo.it>.
Its homepage can be found at [http://noping.cc/](http://noping.cc/).

Copyright (c) 2005-2016 by Florian "octo" Forster.
