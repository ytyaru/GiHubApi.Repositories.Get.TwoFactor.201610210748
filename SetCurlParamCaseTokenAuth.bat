:: AccessToken�F�؂Ń��|�W�g�������擾����Ƃ���cURL�̃p�����[�^��ݒ肷��B
:: 
:: �����ꗗ
:: %1 Username
:: 
:: �o�͕ϐ��ꗗ�i�ďo���ňȉ��̖��O�̕ϐ���p�ӂ��Ă������Ɓj
::   API_ENTRY_POINT
::   CURL_PARAM_AUTH
:: ����
::   [scope](https://developer.github.com/v3/oauth/#scopes)
::     AccessToken��scope�ɂ�`repo`��t�^���邱�ƁB
set Username=%1

:: TSV�t�@�C������AccessToken���擾����
::   scope��csv�`���Ȃ̂ŁA���̒���repo���܂܂�Ă��邩���肷��̂͂ނ����������B
::   ������TokenDescription�ōi�荞�ނ��Ƃɂ����B
set q="C:\root\tool\System\q-1.5.0\bin\q.bat"
set TSV_TOKEN=AccessToken.tsv
set TokenDescription=RepositoryControl
FOR /F "usebackq" %%i in (`call %q% -H -t -e UTF-8 -E SJIS "select Token from %TSV_TOKEN% where User == '%Username%' and Description == '%TokenDescription%'"`) DO set AccessToken=%%i

set API_ENTRY_POINT=/user/repos?
set CURL_PARAM_AUTH= -H "Authorization: token %AccessToken%"
