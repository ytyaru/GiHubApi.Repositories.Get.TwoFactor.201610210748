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
set TSV_TOKEN=Accounts.tsv
set TokenDescription=RepositoryControl
FOR /F "usebackq" %%i in (`call %q% -H -t -e UTF-8 -E SJIS "select Password from %TSV_TOKEN% where Username == '%Username%'"`) DO set Password=%%i

set API_ENTRY_POINT=/user/repos?
set CURL_PARAM_AUTH= -u "%Username%:%Password%"
