echo "Install Python"

pwsh -c Invoke-WebRequest -MaximumRetryCount %HTTP_RETRIES% -OutFile python-3.5.4.exe https://www.python.org/ftp/python/3.5.4/python-3.5.4.exe || goto :error
pwsh -c Invoke-WebRequest -MaximumRetryCount %HTTP_RETRIES% -OutFile python-3.6.8.exe https://www.python.org/ftp/python/3.6.8/python-3.6.8.exe || goto :error
:: pwsh -c Invoke-WebRequest -MaximumRetryCount %HTTP_RETRIES% -OutFile python-3.7.7.exe https://www.python.org/ftp/python/3.7.7/python-3.7.7.exe || goto :error
:: pwsh -c Invoke-WebRequest -MaximumRetryCount %HTTP_RETRIES% -OutFile python-3.8.2.exe https://www.python.org/ftp/python/3.8.2/python-3.8.2.exe || goto :error

python-3.5.4.exe /passive Include_pip=1 Include_test=0 PrependPath=1 DefaultJustForMeTargetDir=C:\python354
python-3.6.8.exe /passive Include_pip=1 Include_test=0 PrependPath=1 DefaultJustForMeTargetDir=C:\python368
:: python-3.7.7.exe /passive Include_pip=1 Include_test=0 PrependPath=1 DefaultJustForMeTargetDir=C:\python377
:: python-3.8.2.exe /passive Include_pip=1 Include_test=0 PrependPath=1 DefaultJustForMeTargetDir=C:\python382

echo "Python Installation Finished"

:error
exit /b %errorlevel%
