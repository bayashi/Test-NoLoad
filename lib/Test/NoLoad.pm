package Test::NoLoad;
use strict;
use warnings;
use Test::More qw//;

our $VERSION = '0.02';

use Exporter;
our @ISA    = qw/Exporter/;
our @EXPORT = qw/check_no_load load_ok/;

sub check_no_load {
    my @modules = @_;

    for my $module (@modules) {
        Test::More::ok( !_loaded($module), "no load: $module" );
    }
}

sub _loaded {
    my $module = shift;
    $module =~ s!::!/!g;
    return defined( $INC{"$module\.pm"} );
}

sub load_ok {
    my @modules = @_;

    for my $module (@modules) {
        Test::More::ok( _loaded($module), "loaded: $module" );
    }
}

1;

__END__

=head1 NAME

Test::NoLoad - Fail, if the module was loaded


=head1 SYNOPSIS

    use Test::AllModules;
    use Test::NoLoad;

    BEGIN {
        all_ok(
            search_path => 'MyApp',
            check => sub {
                my $class = shift;
                eval "use $class;1;";
            },
        );
    }

    check_no_load(qw/ Class::ISA Pod::Plainer Switch /);


=head1 DESCRIPTION

Test::NoLoad export the function `check_no_load`.
It will be fail, if the module was loaded.


=head1 EXPORTED FUNCTIONS

=head2 check_no_load(@modules)


=head1 REPOSITORY

Test::NoLoad is hosted on github
<http://github.com/bayashi/Test-NoLoad>


=head1 AUTHOR

Dai Okabayashi E<lt>bayashi@cpan.orgE<gt>


=head1 LICENSE

This module is free software; you can redistribute it and/or
modify it under the same terms as Perl itself. See L<perlartistic>.

=cut
