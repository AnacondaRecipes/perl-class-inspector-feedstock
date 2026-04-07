:: Make sure this goes in site
perl Makefile.PL INSTALLDIRS=site
IF %ERRORLEVEL% NEQ 0 exit 1
:: Perl on Windows with MSVC emits an nmake-style Makefile; do not use GNU make
:: (msys2-make) or you get "multiple target patterns" and other parse errors.
for /f "usebackq delims=" %%M in (`perl -MConfig -e "print $Config{make}"`) do set "MAKE_PROG=%%M"
"%MAKE_PROG%"
IF %ERRORLEVEL% NEQ 0 exit 1
"%MAKE_PROG%" test
IF %ERRORLEVEL% NEQ 0 exit 1
"%MAKE_PROG%" install