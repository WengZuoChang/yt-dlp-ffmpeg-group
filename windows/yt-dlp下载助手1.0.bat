@echo off
echo 
echo ************************************************************
echo                      yt-dlp ��������
echo                   һ������YouTube�͹���Ƶ
echo              �뽳��  https://www.wengzuochang.com
echo *************************************************************                                                           
set /p url=��������Ƶ��ַ��

if "%url%" == "" echo ��ʾ����������Ƶ������ַ && goto end
echo ���ڲ�ѯ֧�����صĸ�ʽ�б�.......
yt-dlp.exe -F %url%

echo ע�⣺audio only���д�����Ƶ��video only���д�����Ƶ
set /p dpi=������������Ƶ�ķֱ���(ֻ��ѡvideo only)��
set /p audioFormat=������������Ƶ�ĸ�(ֻ��ѡaudio only)��
echo �������أ����Ժ�...
yt-dlp.exe %url% -f%dpi%+%audioFormat%

echo ������ϣ���������˳�!
pause > nul

