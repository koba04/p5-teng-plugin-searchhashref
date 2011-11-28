use strict;
use warnings;

use Test::More;
use lib 't';
use TestDB;

my $db = TestDB->new;

create_test_data();

subtest 'search_hashref' => sub {

    my $user_item = $db->search_hashref('user_item', { user_id => 10 }, {});
    is $user_item->{1}->item_id, 100, 'default key is id';
    is $user_item->{2}->count, 2000, 'default key is id(2)';

    $user_item = $db->search_hashref('user_item', { user_id => 10 }, {}, 'item_id');
    is $user_item->{100}->count, 1000, 'specify key';

    $user_item = $db->search_hashref('user_item', { user_id => 10 }, {}, 'user_id');
    is $user_item->{10}->count, 2000, 'specify key(duplicate)';

    $user_item = $db->search_hashref('user_item', { user_id => 9999 }, {}, 'user_id');
    is scalar(keys %$user_item), 0, 'no data';

};

sub create_test_data {
    $db->do(q{
        CREATE TABLE user_item (
            id      INTEGER,
            user_id INTEGER,
            item_id INTEGER,
            count   INTEGER
        );
    });
    $db->insert('user_item', { id => 1, user_id => 10, item_id => 100, count => 1000 });
    $db->insert('user_item', { id => 2, user_id => 10, item_id => 200, count => 2000 });
}

done_testing;
