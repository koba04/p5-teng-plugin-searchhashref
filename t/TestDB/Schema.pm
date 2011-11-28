package TestDB::Schema;

use strict;
use warnings;
use Teng::Schema::Declare;

table {
    name 'user_item';
    pk 'id';
    columns qw/id user_id item_id count/;
};
1;
