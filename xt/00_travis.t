use strict;
use Config;
use Test::More;
use File::Spec;

diag $Config{make};

my $name = $Config{make};

if (File::Spec->file_name_is_absolute($name)) {
    if (-x $name && !-d _) {
        warn $name;
    }
}

my $exe_ext = $Config{_exe};
for my $dir (File::Spec->path) {
    diag "Searching for $dir";
    my $fullpath = File::Spec->catfile($dir, $name);
    if ((-x $fullpath || -x ($fullpath .= $exe_ext)) && -d _) {
        warn $fullpath;
    }
}

done_testing;
