@ECHO OFF
pushd %~dp0

set DOCKER_IMAGE_TAG=rhene/sphinx-latexpdf

if "%1" == "" (
	echo.Usage: "docker_run_make (html or latexpdf)"
	goto end
)


echo.Check docker installed
docker >NUL 2>NUL
if errorlevel 9009 (
	echo.
	echo.The 'docker' command was not found.
	echo.Make sure you have Docker installed.
	goto end
)

echo.Build docker image
docker build -t %DOCKER_IMAGE_TAG% ./
if %errorlevel% neq 0 ( 
	echo.
	echo.Docker build error!!
	echo.Abort process.
    goto end 
)

echo.Run docker image and build shpinx document (make %1%)
docker run --rm -v "%cd%:/docs" %DOCKER_IMAGE_TAG% make %1%


:end
popd