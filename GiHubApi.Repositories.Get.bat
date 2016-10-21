:: GitHubAPI�ɂă��|�W�g�������擾����
:: 
:: �����ꗗ
:: %1 ���[�U��
:: 
:: ����
::   [���N�G�X�g���](https://developer.github.com/v3/#rate-limiting)
::     �F�؂Ȃ��ōs���ƁA1���Ԃ�����60���N�G�X�g�����ł��Ȃ��B
::     �F�؂���ōs���ƁA1���Ԃ�����5000���N�G�X�g�܂łł���B
::   [�擾����](https://developer.github.com/v3/#pagination)
::     per_page�̒l * 30�B
::     per_page=1000�Ȃ�A30000���̃��|�W�g�������擾�ł���B
@echo off

set Username=user1

set CURL_PEM="C:\Program Files\Git\ssl\certs\cacert.pem"
set SAVE_FILE="./GitHub.%Username%.Repositories.json"
set HDR_TIMEZONE="Time-Zone: Asia/Tokyo"

set API_URL_BASE=https://api.github.com
set API_PARAM="type=owner&sort=created&direction=desc&per_page=1000"

:: �ϐ���錾���Ă����iCURL_PARAM��ݒ肷��o�b�`���Ăяo���O�ɐ錾���邱�ƂŌďo���Ŏ󂯎���j
set API_ENTRY_POINT=
set CURL_PARAM_AUTH=

:: �F�ؕ������ƂɃp�����[�^��ݒ肷��
::call SetCurlParamCaseNonAuth.bat %Username%
::call SetCurlParamCaseBasicAuth.bat %Username%
call SetCurlParamCaseTwoFactorAuth.bat %Username%
::call SetCurlParamCaseTokenAuth.bat %Username%

@echo on
curl -o %SAVE_FILE% --cacert %CURL_PEM% -H %HDR_TIMEZONE% %CURL_PARAM_AUTH% %API_URL_BASE%%API_ENTRY_POINT%%API_PARAM%
@echo off

pause
@echo on
