#!/bin/sh
#Скрипт для преобразования Audio CD в формат mp3 CBR 192 kb/s, 44.1 khz, Stereo
#Версия 0.2
#© 2006 Монахов Павел aka meskalin1974
#Все вопросы и пожелания высылать на meskalin1974@inbox.ru
#
#Changelog:
#	0.2:	Теперь имя файлов имеет вид Track#.mp3, вместо двойных расширений
#			Принудительный формат CBR 192 kb/s, 44.1 khz, Stereo вместо default
#			Проверка на наличие программ cdda2wav и lame
#			Путь для временных файлов теперь ~/tmp/cdda2wav
#			Добавлена проверка на успех/неудачу операции


#Объявляем переменные
#Пути и опции для cdda2wav
CDDA2WAV='/usr/bin/cdda2wav'
CDDA2WAV_OPTS='-D /dev/hdc -H -x --alltracks '
#Пути и опции для lame
LAME='/usr/bin/lame'
LAME_OPTS='--cbr -b 192 -m s -s 44.1 -S'
#Префикс для имен файлов
PREFIX='Track'
#Путь для временных файлов
TMPPATH=~/tmp/cdda2wav
#Переменная для нумерации треков
NUMBER=1

#Процедура проверки успешнсти действия
#Если успешно выводим OK!
#иначе Сбой!
checkresult()
{
RES=$?
if [ $RES = 0 ] ; then
	echo "OK!"
else
	echo "Сбой!"
	exit 1
fi
}

#Проверяем наличие cdda2wav
if [ ! -x $CDDA2WAV ]; then
	echo "$CDDA2WAV не найден"
	echo "Установите перед запуском"
	exit 1
fi

#Проверяем наличие lame
if [ ! -x $MP_CODER ]; then
	echo "$LAME не найден"
	echo "Установите перед запуском"
	exit 1
fi

#Если временная папка не существует, то создаем ее,
#иначе очищаем ее
if [ ! -d $TMPPATH ]; then
	mkdir $TMPPATH
else
	rm -rf $TMPPATH/* 
fi

#Конвертируем Audio CD в wav
echo -n "Конвертируем Audio Cd в wav..."
$CDDA2WAV $CDDA2WAV_OPTS $TMPPATH/ 2>/dev/null
checkresult

#Конвертируем каждый wav файл во временной папке в mp3
for TRACK in $TMPPATH/_*.wav
	do
		echo -n "Конвертируем $TRACK в mp3..."
		$LAME $LAME_OPTS $TRACK $TMPPATH/$PREFIX$NUMBER.mp3
		NUMBER=$[$NUMBER+1]
		checkresult
	done

exit 0
