#!/bin/sh
uploaddata=$1;
time perl cleanup_state.pl
time perl fetch_10ks.pl
time perl fetch_filer_headers.pl
time perl parse_headers.pl
time perl update_cik_name_lookup.pl
time perl relationship_wrapper.pl;
time perl clean_relationships.pl;
time perl populate_companies.pl;
time perl export_database_info.pl;
if [ "$uploaddata" == 1 ]; then
	cd ../utils
	bash ./publish_data.sh;
fi;