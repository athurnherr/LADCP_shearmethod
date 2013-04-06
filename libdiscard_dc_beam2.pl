#======================================================================
#                    L I B D I S C A R D _ D C _ B E A M 2 . P L 
#                    doc: Thu Mar 28 21:57:14 2013
#                    dlm: Fri Mar 29 15:29:21 2013
#                    (c) 2013 A.M. Thurnherr
#                    uE-Info: 13 30 NIL 0 0 72 2 2 4 NIL ofnI
#======================================================================

sub edit_LADCP_vels()
{
    print(STDERR "\t\tDISCARDING beam-2 velocities from downcast...\n");
    
    for (my($ens)=$LADCP_start; $ens<=$LADCP_bottom; $ens++) {
        for (my($bin)=0; $bin<$LADCP{N_BINS}; $bin++) {
            undef($LADCP{ENSEMBLE}[$ens]->{BEAM_VEL}[$bin][1]);
            @{$LADCP{ENSEMBLE}[$ens]->{VELOCITY}[$bin]} =
            	velInstrumentToEarth(\%LADCP,$ens,velBeamToInstrument(\%LADCP,@{$LADCP{ENSEMBLE}[$ens]->{BEAM_VEL}[$bin]}));
        }
    }
}

1;

