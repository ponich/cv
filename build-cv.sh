#!/bin/bash

# Проверяем, установлен ли Docker
if ! command -v docker &> /dev/null; then
    echo "Ошибка: Docker не установлен. Пожалуйста, установите Docker и попробуйте снова."
    exit 1
fi

# Проверяем наличие файла резюме
if [ ! -f "mcdowell-cv/cv.tex" ]; then
    echo "Ошибка: Файл cv.tex не найден. Убедитесь, что сабмодуль mcdowell-cv правильно инициализирован."
    exit 1
fi

# Проверяем, существует ли образ
if [[ "$(docker images -q cv-builder 2> /dev/null)" == "" ]]; then
    echo "Сборка Docker-образа..."
    docker build -t cv-builder .
else
    echo "Образ cv-builder уже существует. Пропускаем сборку."
fi

# Запускаем контейнер для компиляции резюме
echo "Компиляция резюме..."
docker run --rm -v "$(pwd)/mcdowell-cv:/data" -v "$(pwd)/fonts:/usr/share/fonts/truetype/custom" cv-builder lualatex cv.tex

# Проверяем, был ли создан PDF-файл
if [ -f "mcdowell-cv/cv.pdf" ]; then
    echo "Резюме успешно скомпилировано. Файл: mcdowell-cv/cv.pdf"
    
    # Копируем PDF-файл в корень проекта
    mv mcdowell-cv/cv.pdf ./
    
    # Проверяем успешность копирования
    if [ -f "./cv.pdf" ]; then
        echo "PDF-файл успешно скопирован в корень проекта."
    else
        echo "Ошибка: Не удалось скопировать PDF-файл в корень проекта."
    fi
else
    echo "Ошибка: Не удалось скомпилировать резюме."
    echo "Содержимое лог-файла:"
    cat mcdowell-cv/cv.log
    exit 1
fi