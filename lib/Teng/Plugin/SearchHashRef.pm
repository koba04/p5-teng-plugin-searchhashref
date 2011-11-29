package Teng::Plugin::SearchHashRef;
use utf8;
use strict;
use warnings;

our @EXPORT = qw/search_hashref/;
our $VERSION = '0.01';

sub search_hashref {
    my ($self, $table_name, $where, $opt, $key) = @_;

    $key = 'id' unless defined $key;
    return { map { $_->$key => $_ } $self->search($table_name, $where, $opt)->all };
}

1;
__END__

=head1 NAME

Teng::Plugin::SearchHashRef - like a DBI's selectall_hashref

=head1 SYNOPSIS

  package Your::DB;
  use parent 'Teng';
  __PACKAGE__->load_plugin('SearchHashRef');

  my $hash_ref = $db->search_hashref($table, { name => 'hoge' });
    or
  my $hash_ref = $db->search_hashref($table, { name => 'hoge' }, 'uniq_key');

=head1 DESCRIPTION

Teng::Plugin::SearchHashRef is Teng Plugin of like a DBI's selectall_hashref

=head1 AUTHOR

koba04 E<lt>koba0004@gmail.comE<gt>

=head1 SEE ALSO

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
