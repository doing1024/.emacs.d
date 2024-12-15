(require 'mwim)
(add-to-list 'custom-theme-load-path "~/.emacs.d/path/to/atom-one-dark-theme/")
(require 'treemacs)
(require 'window-numbering)
(setq window-numbering-assign-func
      (lambda () (when (equal (buffer-name) "*sort-tab*") 9)))
(window-numbering-mode)

(require 'counsel)
(setq ivy-use-selectable-prompt t)
(require 'ivy)
(require 'swiper)
(ivy-mode 1)
(counsel-mode 1)
(setq ivy-use-virtual-buffers t)
(setq search-default-mode #'char-fold-to-regexp)
(setq ivy-count-format "(%d/%d) ")

(require 'amx)
(amx-mode)
(require 'which-key)
(which-key-mode)
(require 'projectile)
(setq projectile-mode-line "Projectile")
(setq projectile-track-known-projects-automatically nil)

(require 'dashboard)
(setq dashboard-banner-logo-title "Doing's Emacs") ;; 个性签名，随读者喜好设置
(setq dashboard-projects-backend 'projectile) ;; 读者可以暂时注释掉这一行，等安装了 projectile 后再使用
(setq dashboard-startup-banner "~/.emacs.d/logo.png") ;; 也可以自定义图片
(setq dashboard-items '((recents . 10)  ;; 显示多少个最近文件
			(bookmarks . 10) ;; 显示多少个最近书签
			(projects . 10))) ;; 显示多少个最近项目
(dashboard-setup-startup-hook)
(require 'rainbow-delimiters)

(provide 'smalls)
;;; smalls.el ends here
