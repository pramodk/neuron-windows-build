rem Adapted from https://github.com/meta-toolkit/meta/blob/c7019401185cdfa15e1193aad821894c35a83e3f/.appveyor.yml

set HTTP_RETRIES=3

echo Install MSMPI

rem v9.0.1
pwsh -c Invoke-WebRequest -MaximumRetryCount %HTTP_RETRIES% -OutFile msmpisetup.exe https://download.microsoft.com/download/4/A/6/4A6AAED8-200C-457C-AB86-37505DE4C90D/msmpisetup.exe || goto :error
pwsh -c Invoke-WebRequest -MaximumRetryCount %HTTP_RETRIES% -OutFile msmpisdk.msi https://download.microsoft.com/download/4/A/6/4A6AAED8-200C-457C-AB86-37505DE4C90D/msmpisdk.msi || goto :error
msmpisetup.exe -unattend || goto :error
msmpisdk.msi /passive || goto :error

echo Install finished MSMPI

:error
exit /b %errorlevel%
