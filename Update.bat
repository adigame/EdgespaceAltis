taskkill /f /im arma3server.exe
del "C:\arma 3 server\mpmissions\Edgespace.Altis.pbo"
C:\arma3tools\cpbo.exe -y -p "C:\Users\bevin.duplessis\Documents\GitHub\EdgespaceAltis\Edgespace.Altis"
copy Edgespace.Altis.pbo "C:\arma 3 server\mpmissions\"
C:\arma3tools\restartserver.bat
pause