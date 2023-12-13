@echo off
set "sourceDirectory=C:\Users\Klandestin\Documents\PROJECT_FIC\ProiectFIC\IAS_MACHINE_APP"
set "destinationDirectory=C:\Users\Klandestin\Documents\PROJECT_FIC\ProiectFIC\TESTING_SIDE"

xcopy "%sourceDirectory%" "%destinationDirectory%" /E /I /Y

echo Content copied from %sourceDirectory% to %destinationDirectory%
