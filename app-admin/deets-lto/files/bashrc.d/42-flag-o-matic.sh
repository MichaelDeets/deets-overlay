OverrideFlagOMatic()
{
	if [[ "${ENABLE_FLAGOMATIC}" == "yes" ]]; then
		strip-flags()
		{
			ewarn "deets-overlay: strip-flags OVERRIDDEN"
		}

		replace-flags()
		{
			ewarn "deets-overlay: replace-flags OVERRIDDEN"
		}

		append-flags()
		{
			ewarn "deets-overlay: append-flags OVERRIDDEN"
		}

		filter-flags()
		{
			ewarn "deets-overlay: filter-flags OVERRIDDEN"
		}
	fi
}


BashrcdPhase all OverrideFlagOMatic
