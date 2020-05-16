echo "Install MS-MPI"

pwsh -c Invoke-WebRequest -MaximumRetryCount %HTTP_RETRIES% -OutFile msmpisetup.exe https://download.microsoft.com/download/4/A/6/4A6AAED8-200C-457C-AB86-37505DE4C90D/msmpisetup.exe || goto :error
pwsh -c Invoke-WebRequest -MaximumRetryCount %HTTP_RETRIES% -OutFile msmpisdk.msi https://download.microsoft.com/download/4/A/6/4A6AAED8-200C-457C-AB86-37505DE4C90D/msmpisdk.msi || goto :error
msmpisetup.exe -unattend -installroot C:\msmpi || goto :error
msmpisdk.msi /passive || goto :error

echo "MPI Installation Finished"

:error
exit /b %errorlevel%
