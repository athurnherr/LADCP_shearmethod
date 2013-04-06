#======================================================================
#                    L I B D I S C A R D _ U C _ B E A M 4 . P L 
#                    doc: Thu Mar 28 21:57:14 2013
#                    dlm: Fri Mar 29 15:28:22 2013
#                    (c) 2013 A.M. Thurnherr
#                    uE-Info: 15 60 NIL 0 0 72 2 2 4 NIL ofnI
#======================================================================

sub edit_LADCP_vels()
{
    print(STDERR "\t\tDISCARDING beam-4 velocities from upcast...\n");
    
    for (my($ens)=$LADCP_bottom; $ens<=$LADCP_end; $ens++) {
        for (my($bin)=0; $bin<$LADCP{N_BINS}; $bin++) {
            undef($LADCP{ENSEMBLE}[$ens]->{BEAM_VEL}[$bin][3]);
            @{$LADCP{ENSEMBLE}[$ens]->{VELOCITY}[$bin]} =
            	velInstrumentToEarth(\%LADCP,$ens,velBeamToInstrument(\%LADCP,@{$LADCP{ENSEMBLE}[$ens]->{BEAM_VEL}[$bin]}));
        }
    }
}

1;

