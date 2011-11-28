package TestDB;

use strict;
use warnings;
use parent 'Teng';
__PACKAGE__->load_plugin('SearchHashRef');

sub new {
    my $class = shift;

    $class->SUPER::new(
        # use mysql sandbox
        connect_info => [
            'dbi:SQLite::memory:',
            '',
            '',
            {RaiseError => 1, PrintError => 0, AutoCommit => 1},
        ],
    );
}

1;
