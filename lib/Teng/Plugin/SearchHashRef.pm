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

Teng::Plugin::SearchHashRef -

=head1 SYNOPSIS

  use Teng::Plugin::SearchHashRef;

=head1 DESCRIPTION

Teng::Plugin::SearchHashRef is

=head1 AUTHOR

koba04 E<lt>koba0004@gmail.comE<gt>

=head1 SEE ALSO

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
