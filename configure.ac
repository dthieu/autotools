AC_INIT([hello], [0.01], [example@gmail.com],
        [hello], [http://www.dthieu.com/]) # Name program and version
AC_PREREQ([2.68])                      # autoconf version >= 2.68
AC_CONFIG_SRCDIR([hello.c])            # Safety: File must exist
AC_CONFIG_HEADERS([config.h])          # Make config header
AC_CONFIG_AUX_DIR([build-aux])         # Auxiliary files go here
AM_INIT_AUTOMAKE([1.11 -Wall -Werror]) # Init automake
AC_CONFIG_FILES([Makefile])            # "configure" creates Makefile

AC_PROG_CC                             # Find & probe C compiler
# Another type:
# - AC_PROG_CXX: Find a C++ compiler
# - AC_PROG_LEX: Find flex/lex

# Put various checks and such here : programs, lib, header file,
# system services, lib functions,... 

# Do final output
AC_OUTPUT

