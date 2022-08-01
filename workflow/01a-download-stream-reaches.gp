# Download the current stream reaches and convert to GeoJSON:
# - this needs to be run after changes to the State's Source Water Route Framework
# - save each file locally and then read and write to make sure GeoJSON file is saved as latest spec
CreateFolder(Folder="downloads/SWRF",CreateParentFolders="True",IfFolderExists="Ignore")
WebGet(URL="https://dnrftp.state.co.us/CDSS/GIS/Source_Water_Route_Framework.zip",OutputFile="downloads/SWRF/Source_Water_Route_Framework.zip")
# =====================================================
# Unzip the geodatabase.
UnzipFile(File="downloads/SWRF/Source_Water_Route_Framework.zip",OutputFolder="downloads/SWRF",IfFolderDoesNotExist="Create")
# Read the file from 'downloads/' and then write to '../data'.
ReadGeoLayersFromFGDB(InputFolder="downloads/SWRF/Source_Water_Route_Framework.gdb",ReadOnlyOneFeatureClass="TRUE",FeatureClass="Source_Water_Route_Framework",GeoLayerID="SWRF")
WriteGeoLayerToGeoJSON(GeoLayerID="SWRF",OutputFile="../data/co-stream-reaches.geojson")
