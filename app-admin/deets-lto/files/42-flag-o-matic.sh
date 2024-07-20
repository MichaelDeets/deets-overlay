OverrideFlagOMatic()
{
	if [[ "${ENABLE_FLAGOMATIC}" != "yes" ]]; then
		strip-flags()
		{
			ewarn "deetsLTO: strip-flags OVERRIDDEN"
		}

		replace-flags()
		{
			ewarn "deetsLTO: replace-flags OVERRIDDEN"
		}

		append-flags()
		{
			ewarn "deetsLTO: append-flags OVERRIDDEN"
		}

		filter-flags()
		{
			ewarn "deetsLTO: filter-flags OVERRIDDEN"
		}
	fi
}


BashrcdPhase all OverrideFlagOMatic
