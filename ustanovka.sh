#!/bin/zsh
# Устанавливает агентов, команды и регулярные задачи Seller Group в ~/.claude (без перезаписи существующих).
# ./ustanovka.sh --force — перезаписать.
set -e
R="${0:A:h}"; F=""; [[ "$1" == "--force" ]] && F=1
for sub in agents skills scheduled-tasks; do
  mkdir -p ~/.claude/$sub
  for x in "$R/.claude/$sub"/*(N); do
    n="${x:t}"
    if [[ -e ~/.claude/$sub/$n && -z $F ]]; then echo "есть: $sub/$n (пропущено)"; else cp -R "$x" ~/.claude/$sub/ && echo "установлено: $sub/$n"; fi
  done
done
mkdir -p ~/Documents/"Seller Group"
echo "Готово. Регулярные задачи появятся в Claude после перезапуска; проверь их расписание в разделе задач."
