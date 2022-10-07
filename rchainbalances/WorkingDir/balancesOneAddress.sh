k=${1-11112NBTK5hK9Jj9nu1P3TGTKXQX3V6sYmQGDhGZcvivweeWPD6QJq}
echo 'k = '$k
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
  curl -k -s -d @"/tmp/rho" https://44.205.70.147:443/api/explore-deploy  -H "Host: observer.services.mainnet.rchain.coop" | jq --raw-output '.expr[0].ExprString.data'
