function ReactionOfCarbonDioxideMain(fileName, sheet, sIdx, eIdx)
% fileName(String) : 불러올 excel 파일의 이름
% sheet(String) : 불러오는 excel 파일에서 데이터가 있는 sheet 이름
% sIdx(Int) : 불러온 데이터의 마지막 시간
% eIdx(Int) : 불러온 데이터의 끝 시간
% 
% Ex
% fileName = 'CarbonDioxide';
% sheet = 'sheet2';
% sIdx = 0;
% eIdx = 455;

tic;
% fileNameExtension : 파일 확장자
% xlsFileName : excel 파일 이름
% matFileName : matlab 파일 이름

% Read Excel Data
fileNameExtension = '.xlsx';
xlsFileName = strcat(fileName, fileNameExtension);
srcArr = xlsread(xlsFileName, sheet);

% Save Extracted Data And Load Data
fileNameExtension = '.mat';
matFileName = strcat(fileName, fileNameExtension);
ExtractDataFromArrayModified(srcArr, sIdx, eIdx, matFileName);

% Solve Lsqcurvefit And ODE
ReactionOfCarbonDioxide(matFileName);
toc;
end