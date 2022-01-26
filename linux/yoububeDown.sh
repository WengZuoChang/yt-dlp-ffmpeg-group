#!/bin/bash


# ��װyt-dlp
if [[ ! -e yt-dlp ]];
then
    echo "���ڰ�װyt-dl..."
    sudo wget https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp
    sudo chmod a+rx ./yt-dlp
fi

# ��װFfmpeg
if [[ ! -e ffmpeg ]];
then
    # ����Ffmpeg
    wget https://johnvansickle.com/ffmpeg/builds/ffmpeg-git-amd64-static.tar.xz
    # ��ѹFfmpeg
    xz -d ffmpeg-git-amd64-static.tar.xz
    tar -xvf ffmpeg-git-amd64-static.tar
    # ɾ��ѹ����
    rm -rf ffmpeg-git-amd64-static.tar
    # ������
    mv ffmpeg-git-20220108-amd64-static ffmpeg
fi

# ��������ļ�
if [[ ! -e yt-dlp.conf ]]; 
then
    touch yt-dlp.conf
    echo '## Download directory' >> yt-dlp.conf
    echo '--output ./video/%(uploader)s/%(title)s-%(resolution)s.%(ext)s' >> yt-dlp.conf
    echo '--console-title --progress-template "%(uploader)s/download-title:%(info.id)s-%(progress.eta)s"' >> yt-dlp.conf
    echo '## Video Format Options'  >> yt-dlp.conf
    echo '--merge-output-format mp4' >> yt-dlp.conf
    echo '## Subtitle Options' >> yt-dlp.conf
    echo '--sub-langs all,-live_chat' >> yt-dlp.conf
    echo '--embed-thumbnail' >> yt-dlp.conf
    echo '--convert-subs srt' >> yt-dlp.conf
    echo "--ffmpeg-location `pwd`/ffmpeg/ffmpeg" >> yt-dlp.conf
    echo "�������"
fi

echo ============================================================
echo ====================== yt-dlp �������� ======================
echo ================== һ������YouTube�͹���Ƶ ===================
echo ============ �뽳�� https://www.wengzuochang.com ============
echo =============================================================

# ���Խ���ɾ�� stty erase '^H'
stty erase '^H'
while true
do
    read -p "��������Ƶ��ַ��" url
    if [ $url ]; 
    then
        break
    fi
done

echo "���ڲ�ѯ֧�����صĸ�ʽ�б�..."
./yt-dlp -F $url
echo "ע�⣺audio only���д�����Ƶ��video only���д�����Ƶ"
while true
do
    read -p "������������Ƶ�ķֱ���(ֻ��ѡvideo only)��" dpi
    if [ $dpi ]; 
    then
        break
    fi
done

while true
do
    read -p "������������Ƶ�ĸ�(ֻ��ѡaudio only)��" audioFormat
    if [ $audioFormat ]; 
    then
        break
    fi
done

echo "�������أ����Ժ�..."
./yt-dlp $url -f$dpi+$audioFormat
read -p ������ϣ���������˳�!


