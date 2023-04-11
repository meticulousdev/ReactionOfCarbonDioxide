function ExtractDataFromArrayModified(srcArr, sIdx, eIdx, fileName)
% 초기화
% srcArr : 소스 행렬
% srcRowLen : 원본 행렬의 행 길이
% srcColLen : 원본 행렬의 열 길이
% desArr : 새롭게 만들어진 행렬이 저장될 공간
% j : 저장된 데이터의 갯구 확인

% srcArr = 1;
% sIdx = 0;
% eIdx = 49;
% fileName = 'ExtractedData.mat';

[srcRowLen, srcColLen] = size(srcArr);
desArr = zeros((eIdx - sIdx), srcColLen);  
cmpArr = sIdx : 1 : eIdx;
j = 1;

% 처리
% 시간 간격을 가지고 데이터 추출
for i = 1 :  srcRowLen
   
    if (srcArr(i, 1) ==  cmpArr(j))
        for k = 1 : srcColLen
            desArr(j, k) = srcArr(i, k);
        end % for k
        j = j + 1;
        
        if j > (eIdx - sIdx)
            break;
        end
    end % if

end % for i

% 출력
% 필요한 이름으로 입력된 데이터를 저장
save(fileName, 'srcArr', 'desArr');
end % function desArr = ExtractDataFromArray(srcArr, desRowLen, desColLen)