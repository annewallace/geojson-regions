processFile(){
	name=$1
	url=$2
	rm -rf countries/$name
	mkdir -p countries/$name/tmp
	cd countries/$name/tmp
	wget $url;
	unzip *.zip;
	rm *.zip;
	ogr2ogr -f GeoJSON -t_srs crs:84 ../all.geojson *.shp
	cd ..;
	rm tmp -rf;
	node ../../parseCountries.js all.geojson
	cd ../../
}

# 1:10 countries
processFile 10m http://www.naturalearthdata.com/http//www.naturalearthdata.com/download/10m/cultural/ne_10m_admin_0_countries.zip

# 1:50 countries
processFile 50m http://www.naturalearthdata.com/http//www.naturalearthdata.com/download/50m/cultural/ne_50m_admin_0_countries.zip

# 1:110 countries
processFile 110m http://www.naturalearthdata.com/http//www.naturalearthdata.com/download/110m/cultural/ne_110m_admin_0_countries.zip
