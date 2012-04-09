package MooseX::Getopt::Usage::Pod::Text;

use strict;
use warnings;
our $VERSION = '0.01';

use base qw(Pod::Text);

sub cmd_head1 {
    my ($self, $attrs, $text) = @_;
    $text =~ s{SYNOPSIS}{USAGE};
    $text = $self->_headings($text);
    $self->SUPER::cmd_head1($attrs, $text);
}

sub cmd_head2 {
    my ($self, $attrs, $text) = @_;
    $text = $self->_headings($text);
    $self->SUPER::cmd_head2($attrs, $text);
}

sub cmd_head3 {
    my ($self, $attrs, $text) = @_;
    $text = $self->_headings($text);
    $self->SUPER::cmd_head3($attrs, $text);
}

sub _headings {
    my $self = shift;
    my $text = shift;
    # Try to do some lowercasing instead of all-caps in headings, and use
    # a colon to end all headings.
    $text =~ s{([A-Z])([A-Z]+)}{((length($2) > 2) ? $1 : lc($1)) . lc($2)}ge;
    $text .= ":" unless $text =~ /:$/;
    return $text;
}

1;
__END__

=pod

=head1 NAME

MooseX::Getopt::Usage::Pod::Text - pod2text duties for MooseX::Getopt::Usage.

=head1 SYNOPSIS

 use MooseX::Getopt::Usage::Pod::Text;
 my $parser = MooseX::Getopt::Usage::Pod::Text->new();
 my $out;
 $parser->output_string(\$out);
 $parser->parse_string_document($pod);
 say $out;

=head1 DESCRIPTION

A subclass of L<Pod::Text> to tweak the output to make a nice usage message.
Does the following.

=over 4

=item Lower cases headings (keeping first letter cap).

=item Adds a colon on the end of headings.

=item Changes SYNOPSIS head1 to USAGE.

=back

=head1 SEE ALSO

L<MooseX::Getopt::Usage>, L<MooseX::Getopt::Usage::Formatter>, L<perl>.

=head1 BUGS

All complex software has bugs lurking in it, and this module is no exception.
See L<MooseX::Getopt::Usage/BUGS> for details of how to report bugs.

=head1 ACKNOWLEDGEMENTS

Thanks to L<Pod::Usage> for the lower casing headings regexp. Based on Russ
Allbery's L<Pod::Text:Color> prototype code.

=head1 AUTHOR

Mark Pitchless, C<< <markpitchless at gmail.com> >>

=head1 COPYRIGHT

Copyright 2012 Mark Pitchless

=head1 LICENSE

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.

=cut

