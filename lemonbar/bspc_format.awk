BEGIN {
	FS = ":"
	OFS = " "
}

/W/ {
	status="%{l}"
	$1=substr($1, 2)
	for (i=1; i<=NF; i++) {
		item=""
		switch ($i) {
			case /^[fFoOuU]/:
				if ($i ~ /^[FOU]/)
					item = "\\uf13a"
				else if ($i ~ /^[uU]/)
					item = "\\uf06a"
				else
					item =  "\\uf111"
				item = "%{A:bspc desktop -f " substr($i, 2) ":}" item "%{A}"
				if ($i ~ /^[oO]/)
					item = "%{T3}" item "%{T1}"
				if ($i ~ /^[fF]/)
					item = "%{T2}" item "%{T1}"
				break
			case /^[mM]/:
				item = substr($i, 2)
				break
			default:
				item = $i
				break
		}
		status = status " " item
	}
	print status
}
