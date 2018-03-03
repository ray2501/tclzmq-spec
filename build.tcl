#!/usr/bin/tclsh

set arch "x86_64"
set base "tclzmq-4.0.1"

set var [list git clone https://github.com/jdc8/tclzmq $base]
exec >@stdout 2>@stderr {*}$var

cd $base

set var2 [list git checkout 06075d43296ccc588846f85aa6ae419d24def138]
exec >@stdout 2>@stderr {*}$var2

set var2 [list git reset --hard]
exec >@stdout 2>@stderr {*}$var2

file delete -force ".git"
cd ..

set var2 [list tar czvf $base.tar.gz $base]
exec >@stdout 2>@stderr {*}$var2


if {[file exists build]} {
    file delete -force build
}

file mkdir build/BUILD build/RPMS build/SOURCES build/SPECS build/SRPMS
file copy -force $base.tar.gz build/SOURCES

set buildit [list rpmbuild --target $arch --define "_topdir [pwd]/build" -bb tclzmq.spec]
exec >@stdout 2>@stderr {*}$buildit

# Remove our source code
file delete -force $base
file delete $base.tar.gz
