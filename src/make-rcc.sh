#!/bin/bash
rcc -binary ePapirus.qrc -o ../ePapirus/ePapirus.rcc
rcc -binary Papirus.qrc -o ../Papirus/Papirus.rcc
rcc -binary PapirusDark.qrc -o ../PapirusDark/PapirusDark.rcc
rcc -binary PapirusAdapta.qrc -o ../PapirusAdapta/PapirusAdapta.rcc
rcc -binary PapirusAdaptaNokto.qrc -o ../PapirusAdaptaNokto/PapirusAdaptaNokto.rcc
echo "done"
