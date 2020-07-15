# Manjaro 软件包备份

### 生成软件包
	pacman -Qenq > package_backup.md
	pacman -Qemq > package_Aur.md

~~不要问我为什么用.md~~

### 通过软件包恢复

	pacman --needed -S - < package-backup.md
	cat package-Aur.md | xargs yay -S --needed --noconfirm
