:: Basic�F�؂Ń��|�W�g�������擾����Ƃ���cURL�̃p�����[�^��ݒ肷��B
:: 
:: �����ꗗ
:: %1 ���[�U��
:: 
:: �o�͕ϐ��ꗗ�i�ďo���ňȉ��̖��O�̕ϐ���p�ӂ��Ă������Ɓj
::   API_ENTRY_POINT
::   CURL_PARAM_AUTH
set Username=%1
set Password=

:: �p�X���[�h��TSV�t�@�C������擾����
:: http://harelba.github.io/q/ja/index.html
set q="C:\root\tool\System\q-1.5.0\bin\q.bat"
set TSV_ACCOUNT=Accounts.tsv
set TokenDescription=RepositoryControl
FOR /F "usebackq" %%i in (`call %q% -H -t -e UTF-8 -E SJIS "select Password from %TSV_ACCOUNT% where Username == '%Username%'"`) DO set Password=%%i

:: �����^�C���p�X���[�h���N���b�v�{�[�h����擾����
:: http://www.vector.co.jp/soft/winnt/util/se486615.html
set picl=C:\root\tool\System\picl.exe
FOR /F "usebackq" %%i in (`"%picl%" -n -o`) DO set OTP=%%i

set API_ENTRY_POINT=/user/repos?
set CURL_PARAM_AUTH= -H "X-Github-OTP: %OTP%" -u "%Username%:%Password%"
