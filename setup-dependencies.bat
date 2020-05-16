rem Adapted from https://github.com/meta-toolkit/meta/blob/c7019401185cdfa15e1193aad821894c35a83e3f/.appveyor.yml

set HTTP_RETRIES=3

echo Install MSMPI

rem v9.0.1
:: rem powershell -c Invoke-WebRequest -MaximumRetryCount %HTTP_RETRIES% -OutFile msmpisetup.exe https://download.microsoft.com/download/4/A/6/4A6AAED8-200C-457C-AB86-37505DE4C90D/msmpisetup.exe || goto :error
:: rem powershell -c Invoke-WebRequest -MaximumRetryCount %HTTP_RETRIES% -OutFile msmpisdk.msi https://download.microsoft.com/download/4/A/6/4A6AAED8-200C-457C-AB86-37505DE4C90D/msmpisdk.msi || goto :error
:: rem msmpisetup.exe -unattend || goto :error
:: ren msmpisdk.msi /passive || goto :error

echo Install finished MSMPI

pwsh -c Invoke-WebRequest -MaximumRetryCount %HTTP_RETRIES% -OutFile python-3.5.4.exe https://www.python.org/ftp/python/3.5.4/python-3.5.4.exe || goto :error
pwsh -c Invoke-WebRequest -MaximumRetryCount %HTTP_RETRIES% -OutFile python-3.6.8.exe https://www.python.org/ftp/python/3.6.8/python-3.6.8.exe || goto :error
pwsh -c Invoke-WebRequest -MaximumRetryCount %HTTP_RETRIES% -OutFile python-3.7.7.exe https://www.python.org/ftp/python/3.7.7/python-3.7.7.exe || goto :error
pwsh -c Invoke-WebRequest -MaximumRetryCount %HTTP_RETRIES% -OutFile python-3.8.2.exe https://www.python.org/ftp/python/3.8.2/python-3.8.2.exe || goto :error
python-3.5.4.exe /quiet InstallAllUsers=1 Include_pip=1 Include_test=0 PrependPath=1
python-3.6.8.exe /quiet InstallAllUsers=1 Include_pip=1 Include_test=0 PrependPath=1
python-3.7.7.exe /quiet InstallAllUsers=1 Include_pip=1 Include_test=0 PrependPath=1
python-3.8.2.exe /quiet InstallAllUsers=1 Include_pip=1 Include_test=0 PrependPath=1

echo Install Python

:error
exit /b %errorlevel%
