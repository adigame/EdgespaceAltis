taskkill /f /im arma3server.exe
timeout 4
del "C:\arma 3 server\mpmissions\Edgespace.Altis.pbo"
del "C:\arma 3 server\@life_server\addons\life_server.pbo"
timeout 4
C:\arma3tools\cpbo.exe -y -p "C:\Users\bevin.duplessis\Documents\GitHub\EdgespaceAltis\@life_server\addons\life_server"
C:\arma3tools\cpbo.exe -y -p "C:\Users\bevin.duplessis\Documents\GitHub\EdgespaceAltis\Edgespace.Altis"
copy Edgespace.Altis.pbo "C:\arma 3 server\mpmissions\"
copy "C:\Users\bevin.duplessis\Documents\GitHub\EdgespaceAltis\@life_server\addons\life_server.pbo" "C:\arma 3 server\@life_server\addons\life_server.pbo"
copy Edgespace.Altis.pbo "C:\Users\bevin.duplessis\Dropbox"
copy "C:\Users\bevin.duplessis\Documents\GitHub\EdgespaceAltis\@life_server\addons\life_server.pbo" "C:\Users\bevin.duplessis\Dropbox"
timeout 4
C:\arma3tools\restartserver.bat
pause