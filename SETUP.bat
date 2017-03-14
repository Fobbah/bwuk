mkdir external_libraries
echo =========Fetching dependencies=========
echo Downloading BWTA2 2.2
tools\curl\curl.exe -o external_libraries/BWTAlib_2.2.7z -k -L --remote-name https://bitbucket.org/auriarte/bwta2/downloads/BWTAlib_2.2.7z
echo Downloading BWAPI 4.1.2
tools\curl\curl.exe -o external_libraries/bwapi_v4.1.2.zip -k -L --remote-name https://github.com/bwapi/bwapi/archive/v4.1.2.zip
echo Downloading Catch
mkdir external_libraries\catch
tools\curl\curl.exe -o external_libraries/catch/catch.hpp -k -L --remote-name https://github.com/philsquared/Catch/releases/download/v1.8.2/catch.hpp
echo Finished fetching dependencies
echo ========Extracting Dependencies========
echo Extracting BWTA 2.2
tools\7zip\7za.exe x -oexternal_libraries\ external_libraries\BWTAlib_2.2.7z
move external_libraries\BWTAlib_2.2 external_libraries\BWTA2
echo Extracting BWAPI 4.1.2
tools\7zip\7za.exe x -oexternal_libraries\tmp external_libraries\bwapi_v4.1.2.zip bwapi-4.1.2
move external_libraries\tmp\bwapi-4.1.2 external_libraries\BWAPI
rd /s /q external_libraries\tmp
echo Finished extracting Dependencies
echo ===========COMPILING BWAPI=============
echo Enabling VC2013 comamand prompt
pushd "%VS120COMNTOOLS%"
call ..\..\VC\vcvarsall.bat x86
popd
pushd external_libraries\BWAPI\bwapi
echo *************COMPILING DEBUG*****************
msbuild bwapi.sln /p:Configuration=Debug /p:Platform=Win32 /t:BWAPI
msbuild bwapi.sln /p:Configuration=Debug /p:Platform=Win32 /t:BWAPIClient
msbuild bwapi.sln /p:Configuration=Debug /p:Platform=Win32 /t:BWAPI_PluginInjector
echo ************COMPILING RELEASE****************
msbuild bwapi.sln /p:Configuration=Release /p:Platform=Win32 /t:BWAPI
msbuild bwapi.sln /p:Configuration=Release /p:Platform=Win32 /t:BWAPIClient
msbuild bwapi.sln /p:Configuration=Release /p:Platform=Win32 /t:BWAPI_PluginInjector
popd
echo ============SETUP COMPLETE==============
pause