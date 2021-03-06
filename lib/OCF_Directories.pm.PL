#!/usr/bin/perl

use strict;
use warnings;

use Config;
use File::Spec;
use Storable;

my $_ocf_dirs = File::Spec->tmpdir."/ocf_dirs.bin";

die "Could not find ocf_firs temp file generated by Build.PL!"
    unless -s $_ocf_dirs;

my %ocf_dirs = %{ Storable::retrieve($_ocf_dirs) };

open OUT, '>', 'lib/OCF_Directories.pm';

print OUT qq{$Config{'startperl'}
# This program is open source, licensed under the PostgreSQL License.
# For license terms, see the LICENSE file.
#
# Copyright (C) 2016-2017: Jehan-Guillaume de Rorthais and Mael Rimbault

=head1 NAME

OCF_Directories - Binaries and binary options for use in Resource Agents

=head1 SYNOPSIS

  use FindBin;
  use lib "\$FindBin::RealBin/../../lib/heartbeat/";
  
  use OCF_Directories;

=head1 DESCRIPTION

This module has been ported from the ocf-directories shell script of the
resource-agents project. See L<https://github.com/ClusterLabs/resource-agents/>.

=head1 VARIABLES

Here are the variables exported by this module:

=over

=item \$INITDIR

=item \$HA_DIR

=item \$HA_RCDIR

=item \$HA_CONFDIR

=item \$HA_CF

=item \$HA_VARLIB

=item \$HA_RSCTMP

=item \$HA_RSCTMP_OLD

=item \$HA_FIFO

=item \$HA_BIN

=item \$HA_SBIN_DIR

=item \$HA_DATEFMT

=item \$HA_DEBUGLOG

=item \$HA_RESOURCEDIR

=item \$HA_DOCDIR

=item \$__SCRIPT_NAME

=item \$HA_VARRUN

=item \$HA_VARLOCK

=item \$ocf_prefix

=item \$ocf_exec_prefix

=back

=cut

package OCF_Directories;

use strict;
use warnings;
use 5.008;
use File::Basename;

BEGIN {
    use Exporter;


    our \$VERSION   = 'v2.2_beta1';
    our \@ISA       = ('Exporter');
    our \@EXPORT    = qw(
        \$INITDIR
        \$HA_DIR
        \$HA_RCDIR
        \$HA_CONFDIR
        \$HA_CF
        \$HA_VARLIB
        \$HA_RSCTMP
        \$HA_RSCTMP_OLD
        \$HA_FIFO
        \$HA_BIN
        \$HA_SBIN_DIR
        \$HA_DATEFMT
        \$HA_DEBUGLOG
        \$HA_RESOURCEDIR
        \$HA_DOCDIR
        \$__SCRIPT_NAME
        \$HA_VARRUN
        \$HA_VARLOCK
        \$ocf_prefix
        \$ocf_exec_prefix
    );
    our \@EXPORT_OK = ( \@EXPORT );
}

our \$INITDIR         = ( \$ENV{'INITDIR'}       || '$ocf_dirs{'INITDIR'}' );
our \$HA_DIR          = ( \$ENV{'HA_DIR'}        || '$ocf_dirs{'HA_DIR'}' );
our \$HA_RCDIR        = ( \$ENV{'HA_RCDIR'}      || '$ocf_dirs{'HA_RCDIR'}' );
our \$HA_CONFDIR      = ( \$ENV{'HA_CONFDIR'}    || '$ocf_dirs{'HA_CONFDIR'}' );
our \$HA_CF           = ( \$ENV{'HA_CF'}         || '$ocf_dirs{'HA_CF'}' );
our \$HA_VARLIB       = ( \$ENV{'HA_VARLIB'}     || '$ocf_dirs{'HA_VARLIB'}' );
our \$HA_RSCTMP       = ( \$ENV{'HA_RSCTMP'}     || '$ocf_dirs{'HA_RSCTMP'}' );
our \$HA_RSCTMP_OLD   = ( \$ENV{'HA_RSCTMP_OLD'} || '$ocf_dirs{'HA_RSCTMP_OLD'}' );
our \$HA_FIFO         = ( \$ENV{'HA_FIFO'}       || '$ocf_dirs{'HA_FIFO'}' );
our \$HA_BIN          = ( \$ENV{'HA_BIN'}        || '$ocf_dirs{'HA_BIN'}' );
our \$HA_SBIN_DIR     = ( \$ENV{'HA_SBIN_DIR'}   || '$ocf_dirs{'HA_SBIN_DIR'}' );
our \$HA_DATEFMT      = ( \$ENV{'HA_DATEFMT'}    || '$ocf_dirs{'HA_DATEFMT'}' );
our \$HA_DEBUGLOG     = ( \$ENV{'HA_DEBUGLOG'}   || '$ocf_dirs{'HA_DEBUGLOG'}' );
our \$HA_RESOURCEDIR  = ( \$ENV{'HA_RESOURCEDIR'}|| '$ocf_dirs{'HA_RESOURCEDIR'}' );
our \$HA_DOCDIR       = ( \$ENV{'HA_DOCDIR'}     || '$ocf_dirs{'HA_DOCDIR'}' );
our \$__SCRIPT_NAME   = ( \$ENV{'__SCRIPT_NAME'} || fileparse(\$0) );
our \$HA_VARRUN       = ( \$ENV{'HA_VARRUN'}     || '$ocf_dirs{'HA_VARRUN'}' );
our \$HA_VARLOCK      = ( \$ENV{'HA_VARLOCK'}    || '$ocf_dirs{'HA_VARLOCK'}' );
our \$ocf_prefix      = '$ocf_dirs{'prefix'}';
our \$ocf_exec_prefix = '$ocf_dirs{'exec_prefix'}';

1;

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2016: Jehan-Guillaume de Rorthais and Mael Rimbault.

Licensed under the PostgreSQL License.

};

close OUT;
