@rem ����0: exe
@rem ����1: ����bin�ļ� ,ԭʼ�ļ�����ѹ�����ļ�
@rem ����2: ����ļ�(Ŀ�������ļ���
@rem ����3: �����ļ�����,0��image�ļ���1��FLASHBOOT�ļ� 2��secboot�ļ�
@rem ����4: �Ƿ�ѹ���ļ���0��plain�ļ���1��ѹ�������ļ�
@rem ����5: �汾���ļ�
@rem ����6�������ļ���FLASH��Ĵ��λ�ã����λ�ã�
@rem ����7����������ļ�����λ�ã����λ�ã�
@rem ����8��ԭʼbin�ļ�

@echo off

copy build\rtthread-w600.map Bin
copy rtthread.bin Bin
cd Libraries

copy rtthread\version.txt ..\Bin
copy rtthread\secboot.img ..\Bin

cd Tools

wm_gzip.exe "..\..\Bin\rtthread.bin"
makeimg.exe "..\..\Bin\rtthread.bin" "..\..\Bin\rtthread.img" 0 0 "..\..\Bin\version.txt" 90000 10100
makeimg.exe "..\..\Bin\rtthread.bin.gz" "..\..\Bin\rtthread_GZ.img" 0 1 "..\..\Bin\version.txt" 90000 10100 "..\..\Bin\rtthread.bin" 
makeimg.exe "..\..\Bin\rtthread.bin" "..\..\Bin\rtthread_SEC.img" 0 0 "..\..\Bin\version.txt" 90000 10100
makeimg_all.exe "..\..\Bin\secboot.img" "..\..\Bin\rtthread.img" "..\..\Bin\rtthread.FLS"
@del "..\..\Bin\rtthread.img"


