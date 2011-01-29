#! perl
# Copyright (C) 2011, Parrot Foundation.

use strict;
use warnings;
use File::Spec::Functions;
use YAML qw/LoadFile/;
use List::MoreUtils qw/any/;

=head1 NAME

show_experimental.pl - Show experimental features listed in docs/changes/api.yaml

=head1 SYNOPSIS

    perl tools/dev/show_experimental.pl

=head1 DESCRIPTION

Shows all currently experimental features. This script could be used to generate
documentation about experimental features in the future.

=head1 PREREQUISITE

YAML

=cut

my $api  = catfile(qw/docs changes api.yaml/);
my $yaml = LoadFile($api);
while ( my($title,$data) = each %$yaml) {
    my $tags = $data->{tags};
    my $note = $data->{note} || '';
    # This format is ugly, but is functional for now
    print "$title\t$note\n" if any { $_ eq 'experimental' } @$tags;
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
