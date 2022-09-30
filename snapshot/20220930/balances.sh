while read k;
do
echo '
match ["'$k'"] {
  [revAddr] => {
    new
    return,
    lookup(`rho:registry:lookup`),
    RevVaultCh,
    vaultCh,
    balanceCh
    in {
      lookup!(`rho:rchain:revVault`, *RevVaultCh) |
      for (@(_, RevVault) <- RevVaultCh) {
        @RevVault!("findOrCreate", revAddr, *vaultCh) |
        for (@(true, vault) <- vaultCh) {
          @vault!("balance", *balanceCh) |
          for (@balance <- balanceCh) {
		return!(revAddr ++ ",${bal}" %% {"bal": balance} )
		}
            }
          }
        }
      }
} 
' > /tmp/rho
  curl -k -s  -d @"/tmp/rho" https://observer.services.mainnet.rchain.coop/api/explore-deploy|
 jq --raw-output '.expr[0].ExprString.data'

done
