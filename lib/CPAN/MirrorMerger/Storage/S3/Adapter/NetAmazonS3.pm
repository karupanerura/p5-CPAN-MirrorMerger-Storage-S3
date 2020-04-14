package CPAN::MirrorMerger::Storage::S3::Adapter::NetAmazonS3;
use strict;
use warnings;

use Class::Accessor::Lite ro => [qw/s3_bucket/], new => 1;

sub upload {
    my ($self, $from_path, $save_key) = @_;
    my $obj = $self->s3_bucket->object(key => $save_key);
    return if $obj->exists();

    $obj->put_filename($from_path);
}

1;
__END__

=pod

=encoding utf-8

=head1 NAME

CPAN::MirrorMerger::Storage::S3::Adapter::NetAmazonS3 - Adapter for Net::Amazon::S3

=head1 SYNOPSIS

    use CPAN::MirrorMerger::Storage::S3;
    use CPAN::MirrorMerger::Storage::S3::Adapter::NetAmazonS3;
    use Net::Amazon::S3;
    use Net::Amazon::S3::Client;

    my $s3 = Net::Amazon::S3->new(...);
    my $client = Net::Amazon::S3::Client->new(s3 => $s3);
    my $s3_bucket = $client->bucket(name => 'merged-cpan', region => 'us-east-1');
    my $adapter = CPAN::MirrorMerger::Storage::S3::Adapter::NetAmazonS3->new(s3_bucket => $s3_bucket);
    my $storage = CPAN::MirrorMerger::Storage::S3->new(adapter => $adapter);

=head1 DESCRIPTION

S3 adapter for L<Net::Amazon::S3>.

=head1 SEE ALSO

L<CPAN::MirrorMerger>
L<Net::Amazon::S3>

=head1 LICENSE

Copyright (C) karupanerura.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

karupanerura E<lt>karupa@cpan.orgE<gt>

=cut