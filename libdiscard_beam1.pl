#======================================================================
#                    L I B D I S C A R D _ B E A M 1 . P L 
#                    doc: Thu Mar 28 21:57:14 2013
#                    dlm: Thu May 19 10:27:59 2016
#                    (c) 2013 A.M. Thurnherr
#                    uE-Info: 10 4 NIL 0 0 72 2 2 4 NIL ofnI
#======================================================================

# HISTORY:
#	Mar 28, 2016: - created
#   May 19, 2016: - adapted to velBeamToEarth()

sub edit_LADCP_vels()
{
    print(STDERR "\t\tDISCARDING beam-1 velocities...\n");
    
    for (my($ens)=$LADCP_start; $ens<=$LADCP_end; $ens++) {
        for (my($bin)=0; $bin<$LADCP{N_BINS}; $bin++) {
            undef($LADCP{ENSEMBLE}[$ens]->{BEAM_VEL}[$bin][0]);
            @{$LADCP{ENSEMBLE}[$ens]->{VELOCITY}[$bin]} = velBeamToEarth(\%LADCP,$ens,@{$LADCP{ENSEMBLE}[$ens]->{BEAM_VEL}[$bin]});
        }
    }
}

1;

