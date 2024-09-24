FROM ubuntu:22.04

# Устанавливаем только необходимые пакеты
RUN apt-get update && apt-get install -y --no-install-recommends \
    texlive-base \
    texlive-latex-recommended \
    texlive-fonts-recommended \
    texlive-latex-extra \
    texlive-luatex \
    texlive-fonts-extra \
    fontconfig \
    && rm -rf /var/lib/apt/lists/*

# Создаем директорию для шрифтов
RUN mkdir -p /usr/share/fonts/truetype/custom

# Копируем шрифты
COPY fonts/*.ttf /usr/share/fonts/truetype/custom/

# Обновляем кэш шрифтов
RUN fc-cache -f -v

# Устанавливаем рабочую директорию
WORKDIR /data

# Команда по умолчанию
CMD ["lualatex"]